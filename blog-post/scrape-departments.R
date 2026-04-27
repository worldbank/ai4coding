library(tidyverse)
library(httr)
library(jsonlite)
library(AzureAuth)

# ── 1. Authenticate ────────────────────────────────────────────────────────
# Opens https://login.microsoft.com/device in your browser.
# Sign in with your normal WB Microsoft 365 account (same as Outlook / Teams).

tenant_id <- "31a2fec0-266b-4c67-b56e-2796d8f59c36"
client_id <- "6004dd2d-ebfd-424a-aa4a-dae1bf75cbcb"
scope <- "6004dd2d-ebfd-424a-aa4a-dae1bf75cbcb/.default"
apim_key <- "c2312f8197e7442c93a3a7260ff60e14"
people_url <- "https://entsearchapi.worldbank.org/search/vertex/people_new"

token <- get_azure_token(
  resource = scope,
  tenant = tenant_id,
  app = client_id,
  auth_type = "device_code"
)

bearer <- token$credentials$access_token


# ── 2. Single-email lookup ─────────────────────────────────────────────────

lookup_person <- function(email, bearer, apim_key, people_url) {
  body <- toJSON(
    list(
      SearchKeyWord = unbox(email),
      top = unbox(5L),
      skip = unbox(0L),
      WithoutDuplicates = unbox(TRUE),
      facet = c("JOBCODEDESCR", "VPU", "ORGNAME", "LOCATION"),
      type = unbox("text2sql"),
      hr = unbox(0L)
    ),
    auto_unbox = FALSE
  )

  resp <- POST(
    people_url,
    add_headers(
      "Content-Type" = "application/json",
      "Authorization" = paste("Bearer", bearer),
      "Ocp-Apim-Subscription-Key" = apim_key
    ),
    body = body,
    encode = "raw",
    timeout(20)
  )

  if (status_code(resp) != 200) {
    warning("HTTP ", status_code(resp), " for: ", email)
    return(tibble(
      email = email,
      name = NA,
      unit = NA,
      department = NA,
      job_title = NA,
      location = NA
    ))
  }

  parsed <- content(resp, as = "parsed", simplifyVector = TRUE)

  # Results live in parsed$data$results (or similar — adjust if structure differs)
  results <- parsed$data$results %||% parsed$results %||% list()

  if (length(results) == 0) {
    return(tibble(
      email = email,
      name = NA,
      unit = NA,
      department = NA,
      job_title = NA,
      location = NA
    ))
  }

  # Take the first hit (exact email match should rank first)
  hit <- results[[1]]

  tibble(
    email = email,
    name = hit$DISPLAYNAME %||% hit$displayName %||% NA_character_,
    unit = hit$VPU %||% hit$vpu %||% NA_character_,
    department = hit$ORGNAME %||% hit$orgName %||% NA_character_,
    job_title = hit$JOBCODEDESCR %||% hit$jobTitle %||% NA_character_,
    location = hit$LOCATION %||% hit$location %||% NA_character_
  )
}


# ── 3. Batch lookup with rate limiting ────────────────────────────────────

lookup_batch <- function(
  emails,
  bearer,
  apim_key = apim_key,
  people_url = people_url,
  pause_sec = 0.3
) {
  emails |>
    map(\(em) {
      Sys.sleep(pause_sec)
      lookup_person(em, bearer, apim_key, people_url)
    }) |>
    list_rbind()
}


# ── 4. Run on attendance person IDs (only WB emails) ──────────────────────

# Load attendance if not already in environment
# source("blog-post/attendance-analysis.R")   # uncomment if needed

wb_emails <- attendance |>
  filter(str_detect(person_id, "@")) |>
  distinct(person_id) |>
  pull(person_id)

cat("Looking up", length(wb_emails), "unique WB email addresses...\n")

person_dept <- lookup_batch(wb_emails, bearer)

# ── 5. Join back to attendance ─────────────────────────────────────────────

attendance_with_dept <- attendance |>
  left_join(person_dept, join_by(person_id == email))

# ── 6. Quick check ────────────────────────────────────────────────────────

person_dept |>
  count(unit, sort = TRUE) |>
  head(20)

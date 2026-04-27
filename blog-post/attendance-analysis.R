library(tidyverse)

# --- 1. Helper: read Teams attendance CSVs (UTF-16LE encoded) --------------

read_teams_attendance <- function(filepath) {
  raw_bytes <- readBin(filepath, "raw", n = file.info(filepath)$size)
  text <- stringi::stri_encode(raw_bytes, from = "UTF-16LE", to = "UTF-8")
  text <- sub("^\uFEFF", "", text)
  lines <- str_split(text, "\r\n|\n|\r")[[1]]

  header_idx <- which(str_detect(lines, "^Name\t"))
  if (length(header_idx) == 0) {
    stop("No participant header in: ", filepath)
  }
  header_idx <- header_idx[1]

  data_lines <- lines[(header_idx + 1):length(lines)]
  data_lines <- data_lines[nchar(data_lines) > 0]
  data_text <- paste(c(lines[header_idx], data_lines), collapse = "\n")

  read_tsv(I(data_text), show_col_types = FALSE) |>
    rename(
      name = Name,
      first_join = `First Join`,
      last_leave = `Last Leave`,
      duration_str = `In-Meeting Duration`,
      email = Email,
      upn = `Participant ID (UPN)`,
      role = Role
    )
}

# --- 2. Read & combine all attendance files --------------------------------

attendance_dir <- "blog-post/atendance"

files_info <- tribble(
  ~file                                                                                                                                  , ~event    , ~session     , ~date ,
  "Revolutionize Your Analysis in Stata and R_ AI Agent-Assisted Workflow with GitHub Copilot and Claude - Attendance report 2-05-2.csv" ,
  "seminar_feb"                                                                                                                          , "single"  , "2025-02-05" ,
  "Poverty Learning Series-Morning Session[Mon_Thur 9AM EST] - Attendance report 4-20-26.csv"                                            ,
  "workshop_apr"                                                                                                                         , "morning" , "2026-04-20" ,
  "AI-Assisted Coding for Economists-Evening Session [Mon_Thur 9PM EST] - Attendance report 4-20-26.csv"                                 ,
  "workshop_apr"                                                                                                                         , "evening" , "2026-04-20" ,
  "Poverty Learning Series-Morning Session[Mon_Thur 9AM EST] - Attendance report 4-23-26.csv"                                            ,
  "workshop_apr"                                                                                                                         , "morning" , "2026-04-23" ,
  "AI-Assisted Coding for Economists-Evening Session [Mon_Thur 9PM EST] - Attendance report 4-23-26.csv"                                 ,
  "workshop_apr"                                                                                                                         , "evening" , "2026-04-23"
) |>
  mutate(
    date = as.Date(date),
    part = case_when(
      event == "seminar_feb" ~ "single",
      date == as.Date("2026-04-20") ~ "part1",
      date == as.Date("2026-04-23") ~ "part2"
    )
  )

raw <- files_info |>
  mutate(
    data = map(file, \(f) read_teams_attendance(file.path(attendance_dir, f)))
  ) |>
  unnest(data)

# --- 3. Parse duration strings & clean IDs ---------------------------------

parse_duration_min <- function(x) {
  h <- str_extract(x, "(\\d+)h", group = 1) |> replace_na("0") |> as.numeric()
  m <- str_extract(x, "(\\d+)m", group = 1) |> replace_na("0") |> as.numeric()
  s <- str_extract(x, "(\\d+)s", group = 1) |> replace_na("0") |> as.numeric()

  h * 60 + m + s / 60
}

attendance <- raw |>
  mutate(
    duration_min = parse_duration_min(duration_str),
    email_clean = str_to_lower(str_trim(email)),
    # Use email as unique ID; fall back to name for unverified participants
    person_id = if_else(
      is.na(email_clean) | email_clean == "",
      str_to_lower(str_trim(name)),
      email_clean
    ),
    event_label = case_when(
      event == "seminar_feb" ~ "1. Feb Seminar (45 min)",
      part == "part1" ~ "2. Apr Workshop Day 1 (2h40m)",
      part == "part2" ~ "3. Apr Workshop Day 2 (2h40m)"
    )
  ) |>
  filter(duration_min > 0)

# --- 4. Unique attendees per event -----------------------------------------

attendees_by_event <- attendance |>
  summarise(
    n_attendees = n_distinct(person_id),
    avg_duration = round(mean(duration_min), 1),
    med_duration = round(median(duration_min), 1),
    .by = event_label
  ) |>
  arrange(event_label)

attendees_by_event

# --- 5. Overall unique attendees -------------------------------------------

n_unique_total <- n_distinct(attendance$person_id)
n_unique_total

# --- 6. Session breakdown (morning vs evening for April) -------------------

session_breakdown <- attendance |>
  filter(event == "workshop_apr") |>
  summarise(
    n_attendees = n_distinct(person_id),
    avg_duration = round(mean(duration_min), 1),
    .by = c(event_label, session)
  ) |>
  arrange(event_label, session)

session_breakdown

# --- 7. Retention analysis -------------------------------------------------

feb_ids <- attendance |>
  filter(event == "seminar_feb") |>
  distinct(person_id) |>
  pull()
apr_part1_ids <- attendance |>
  filter(part == "part1") |>
  distinct(person_id) |>
  pull()
apr_part2_ids <- attendance |>
  filter(part == "part2") |>
  distinct(person_id) |>
  pull()
apr_any_ids <- attendance |>
  filter(event == "workshop_apr") |>
  distinct(person_id) |>
  pull()

retention <- tribble(
  ~transition                                                                             , ~from_n               , ~to_n , ~retained , ~retention_pct ,
  "Feb Seminar → Apr Workshop (any)"                                                      ,
  length(feb_ids)                                                                         , length(apr_any_ids)   ,
  length(intersect(feb_ids, apr_any_ids))                                                 ,
  round(100 * length(intersect(feb_ids, apr_any_ids)) / length(feb_ids), 1)               ,
  "Feb Seminar → Apr Day 1"                                                               ,
  length(feb_ids)                                                                         , length(apr_part1_ids) ,
  length(intersect(feb_ids, apr_part1_ids))                                               ,
  round(100 * length(intersect(feb_ids, apr_part1_ids)) / length(feb_ids), 1)             ,
  "Feb Seminar → Apr Day 2"                                                               ,
  length(feb_ids)                                                                         , length(apr_part2_ids) ,
  length(intersect(feb_ids, apr_part2_ids))                                               ,
  round(100 * length(intersect(feb_ids, apr_part2_ids)) / length(feb_ids), 1)             ,
  "Apr Day 1 → Apr Day 2"                                                                 ,
  length(apr_part1_ids)                                                                   , length(apr_part2_ids) ,
  length(intersect(apr_part1_ids, apr_part2_ids))                                         ,
  round(100 * length(intersect(apr_part1_ids, apr_part2_ids)) / length(apr_part1_ids), 1) ,
  "Apr Workshop only (not in Feb)"                                                        ,
  length(apr_any_ids)                                                                     , NA_real_              ,
  length(setdiff(apr_any_ids, feb_ids))                                                   ,
  round(100 * length(setdiff(apr_any_ids, feb_ids)) / length(apr_any_ids), 1)
)

retention

# --- 8. Participation patterns ---------------------------------------------

person_events <- attendance |>
  distinct(person_id, event_label) |>
  mutate(attended = TRUE) |>
  pivot_wider(
    id_cols = person_id,
    names_from = event_label,
    values_from = attended,
    values_fill = FALSE
  )

participation_patterns <- person_events |>
  count(across(-person_id), name = "n_people") |>
  arrange(desc(n_people))

participation_patterns


# --- 9. Load roster & merge profile info -----------------------------------

roster_dir <- "blog-post/roster"

read_roster <- function(filepath) {
  read_csv(filepath, skip = 19, show_col_types = FALSE, name_repair = "minimal")
}

roster_raw <- list.files(roster_dir, pattern = "\\.csv$", full.names = TRUE) |>
  map(read_roster) |>
  bind_rows()

# Extract profile fields; use lowercased email as join key
roster_profile <- roster_raw |>
  transmute(
    person_id = str_to_lower(str_trim(`Person E-mail`)),
    pmu = `Person Custom7/Person PMU`,
    org_name = `Person Organization Name`,
    org_acronym = `Person Custom3/Person ORG Acronym`,
    city = `Person City`,
    grade = `Person Custom4/Person Grade`,
    gender = `Person Gender`,
    hq_co = `Additional Profile Fields HQ/CO Flag`
  ) |>
  filter(!is.na(person_id), person_id != "") |>
  distinct(person_id, .keep_all = TRUE)

# --- Data prep: person-level presence per event stage & session -------------

person_flow <- attendance |>
  summarise(
    duration_min = sum(duration_min),
    .by = c(person_id, event, part, session)
  ) |>
  mutate(
    stage = case_when(
      event == "seminar_feb" ~ "feb",
      part == "part1" ~ "day1",
      part == "part2" ~ "day2"
    )
  )

feb_status <- person_flow |>
  filter(stage == "feb") |>
  distinct(person_id) |>
  mutate(feb = "Attended")

day1_status <- person_flow |>
  filter(stage == "day1") |>
  summarise(
    session = paste(sort(unique(session)), collapse = "+"),
    .by = person_id
  ) |>
  mutate(
    day1 = if_else(session == "morning", "Morning", "Evening")
  ) |>
  select(person_id, day1)

day2_status <- person_flow |>
  filter(stage == "day2") |>
  summarise(
    session = paste(sort(unique(session)), collapse = "+"),
    .by = person_id
  ) |>
  mutate(
    day2 = if_else(session == "morning", "Morning", "Evening")
  ) |>
  select(person_id, day2)

all_persons <- tibble(person_id = unique(attendance$person_id)) |>
  left_join(feb_status, join_by(person_id)) |>
  left_join(day1_status, join_by(person_id)) |>
  left_join(day2_status, join_by(person_id)) |>
  mutate(
    feb = replace_na(feb, "Did not attend"),
    day1 = replace_na(day1, "Did not attend"),
    day2 = replace_na(day2, "Did not attend")
  )

# Full join: everyone who attended OR registered
# Roster-only rows (registered but no-show) get "Did not attend" for all events
all_persons_full <- full_join(
  all_persons,
  roster_profile,
  join_by(person_id)
) |>
  mutate(
    feb = replace_na(feb, "Did not attend"),
    day1 = replace_na(day1, "Did not attend"),
    day2 = replace_na(day2, "Did not attend"),
    # OLC registration = person appeared in the April workshop roster
    olc_reg = if_else(!is.na(pmu), "Registered", "Not registered")
  )

all_persons_full


# ============================================================================
# FIGURES
# ============================================================================

library(ggalluvial)
library(ggrepel)
library(scales)
library(patchwork)

# --- Shared palette --------------------------------------------------------

session_colors <- c(
  "Single session" = "#2171B5",
  "Morning" = "#2171B5",
  "Evening" = "#6BAED6"
)

flow_colors <- c(
  "Attended" = "#2171B5",
  "Did not attend" = "#D9D9D9"
)

# --- Aggregate watch-time per person per stage for Figure 4 ----------------

feb_time <- person_flow |>
  filter(stage == "feb") |>
  summarise(feb_min = sum(duration_min), .by = person_id) |>
  mutate(feb = "Attended")

day1_time <- person_flow |>
  filter(stage == "day1") |>
  summarise(
    day1_min = sum(duration_min),
    day1_sess = paste(sort(unique(session)), collapse = "+"),
    .by = person_id
  ) |>
  mutate(
    day1 = if_else(day1_sess == "morning", "Morning", "Evening")
  ) |>
  select(person_id, day1_min, day1)

day2_time <- person_flow |>
  filter(stage == "day2") |>
  summarise(
    day2_min = sum(duration_min),
    day2_sess = paste(sort(unique(session)), collapse = "+"),
    .by = person_id
  ) |>
  mutate(
    day2 = if_else(day2_sess == "morning", "Morning", "Evening")
  ) |>
  select(person_id, day2_min, day2)

all_time <- tibble(person_id = unique(attendance$person_id)) |>
  left_join(feb_time, join_by(person_id)) |>
  left_join(day1_time, join_by(person_id)) |>
  left_join(day2_time, join_by(person_id)) |>
  mutate(
    feb = replace_na(feb, "Did not attend"),
    day1 = replace_na(day1, "Did not attend"),
    day2 = replace_na(day2, "Did not attend"),
    across(ends_with("_min"), \(x) replace_na(x, 0)),
    total_min = feb_min + day1_min + day2_min
  )

# --- Time by stage & session for bar charts --------------------------------

time_by_stage <- person_flow |>
  summarise(
    total_hours = sum(duration_min) / 60,
    n_attendees = n_distinct(person_id),
    .by = c(stage, session)
  ) |>
  mutate(
    stage_label = factor(
      case_when(
        stage == "feb" ~ "Feb Seminar",
        stage == "day1" ~ "Apr Day 1",
        stage == "day2" ~ "Apr Day 2"
      ),
      levels = c("Feb Seminar", "Apr Day 1", "Apr Day 2")
    ),
    session_label = case_when(
      session == "single" ~ "Single session",
      session == "morning" ~ "Morning",
      session == "evening" ~ "Evening"
    )
  )


# --- Figure 1: Stacked bars — unique attendees per event -------------------

p_attendees <- ggplot(
  time_by_stage,
  aes(x = stage_label, y = n_attendees, fill = session_label)
) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  geom_text(
    aes(label = paste0(n_attendees, "\n(", session_label, ")")),
    position = position_stack(vjust = 0.5),
    size = 3.2,
    color = "white",
    fontface = "bold"
  ) +
  stat_summary(
    fun = sum,
    geom = "text",
    aes(label = after_stat(y), group = stage_label),
    vjust = -0.5,
    size = 4,
    fontface = "bold",
    show.legend = FALSE
  ) +
  scale_fill_manual(values = session_colors, name = "Session") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.12))) +
  labs(
    title = "Unique Attendees per Event",
    # subtitle = "Apr workshop offered morning & evening sessions (same content)",
    x = NULL,
    y = "Unique attendees"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40"),
    legend.position = "bottom"
  )


# --- Figure 2: Stacked bars — cumulative watch time ------------------------

p_watchtime <- ggplot(
  time_by_stage,
  aes(x = stage_label, y = total_hours, fill = session_label)
) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  geom_text(
    aes(label = paste0(round(total_hours), "h\n(", session_label, ")")),
    position = position_stack(vjust = 0.5),
    size = 3.2,
    color = "white",
    fontface = "bold"
  ) +
  stat_summary(
    fun = sum,
    geom = "text",
    aes(label = paste0(round(after_stat(y)), "h"), group = stage_label),
    vjust = -0.5,
    size = 4,
    fontface = "bold",
    show.legend = FALSE
  ) +
  scale_fill_manual(values = session_colors, name = "Session") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.12))) +
  labs(
    title = "Cumulative Watch Time per Event",
    subtitle = "Total person-hours of participation",
    x = NULL,
    y = "Total hours"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40"),
    legend.position = "bottom"
  )


# --- Figure 3: Alluvial — participant flow (headcount) ---------------------

alluvial_headcount <- all_persons_full |>
  mutate(
    feb = factor(feb, levels = c("Did not attend", "Attended")),
    olc_reg = factor(olc_reg, levels = c("Not registered", "Registered")),
    day1 = factor(day1, levels = c("Did not attend", "Evening", "Morning")),
    day2 = factor(day2, levels = c("Did not attend", "Evening", "Morning"))
  ) |>
  count(feb, olc_reg, day1, day2, name = "n")

flow_colors4 <- c(
  "Attended" = "#2171B5",
  "Did not attend" = "#D9D9D9"
)

p_flow_headcount <- ggplot(
  alluvial_headcount,
  aes(axis1 = feb, axis2 = olc_reg, axis3 = day1, axis4 = day2, y = n)
) +
  geom_alluvium(
    aes(fill = feb),
    width = 1 / 4,
    alpha = 0.55,
    knot.pos = 0.4,
    aes.bind = "alluvia"
  ) +
  geom_stratum(
    width = 1 / 3,
    fill = "grey92",
    color = "grey30",
    linewidth = 0.5
  ) +
  geom_text(
    stat = "stratum",
    aes(label = after_stat(stratum)),
    size = 3,
    fontface = "bold"
  ) +
  scale_x_discrete(
    limits = c(
      "Feb Seminar\n(45 min)",
      "OLC\nRegistered",
      "Apr Day 1\n(2h 40m)",
      "Apr Day 2\n(2h 40m)"
    ),
    expand = c(0.12, 0.05)
  ) +
  scale_fill_manual(values = flow_colors4, guide = "none") +
  labs(
    title = "Participant Flow Across Events",
    subtitle = "581 registered or attended | width ~ number of people",
    y = "Number of participants"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40")
  )


# --- Figure 4: Manual Sankey — watch-time flow -----------------------------
# Column heights reflect actual person-hours AT each event (not cross-event totals)

# Helper: sigmoid ribbon polygon between two columns
sigmoid_ribbon <- function(
  x0,
  x1,
  y0_lo,
  y0_hi,
  y1_lo,
  y1_hi,
  group_id,
  fill,
  n = 60
) {
  t <- seq(0, 1, length.out = n)
  sig <- 1 / (1 + exp(-12 * (t - 0.5)))
  x <- x0 + (x1 - x0) * t
  y_hi <- y0_hi + (y1_hi - y0_hi) * sig
  y_lo <- y0_lo + (y1_lo - y0_lo) * sig
  tibble(
    x = c(x, rev(x)),
    y = c(y_hi, rev(y_lo)),
    group = group_id,
    fill = fill
  )
}

# Aggregate per-person hours at each event stage
psh <- attendance |>
  summarise(
    hours = sum(duration_min) / 60,
    .by = c(person_id, part, session)
  ) |>
  mutate(
    stage = case_when(
      part == "single" ~ "feb",
      part == "part1" ~ "day1",
      part == "part2" ~ "day2"
    ),
    sess = case_when(
      session == "morning" ~ "Morning",
      session == "evening" ~ "Evening",
      TRUE ~ "Attended Feb"
    )
  )

feb_h2 <- psh |>
  filter(stage == "feb") |>
  summarise(feb_h = sum(hours), .by = person_id)
day1_h2 <- psh |>
  filter(stage == "day1") |>
  summarise(
    day1_h = sum(hours),
    day1_sess = paste(sort(unique(sess)), collapse = "+"),
    .by = person_id
  ) |>
  mutate(
    day1_sess = if_else(str_detect(day1_sess, "\\+"), "Morning", day1_sess)
  )
day2_h2 <- psh |>
  filter(stage == "day2") |>
  summarise(
    day2_h = sum(hours),
    day2_sess = paste(sort(unique(sess)), collapse = "+"),
    .by = person_id
  ) |>
  mutate(
    day2_sess = if_else(str_detect(day2_sess, "\\+"), "Morning", day2_sess)
  )

pax2 <- tibble(person_id = unique(attendance$person_id)) |>
  left_join(feb_h2, join_by(person_id)) |>
  left_join(day1_h2, join_by(person_id)) |>
  left_join(day2_h2, join_by(person_id)) |>
  mutate(
    feb_grp = if_else(!is.na(feb_h), "Attended Feb", "Not Feb"),
    day1_sess = replace_na(day1_sess, "Did not attend"),
    day2_sess = replace_na(day2_sess, "Did not attend"),
    across(ends_with("_h"), \(x) replace_na(x, 0))
  )

flow_fd1 <- pax2 |>
  filter(day1_sess != "Did not attend") |>
  summarise(h = sum(day1_h), .by = c(feb_grp, day1_sess))
flow_d1d2 <- pax2 |>
  filter(day2_sess != "Did not attend") |>
  summarise(h = sum(day2_h), .by = c(day1_sess, day2_sess))

# Node totals
feb_tot <- sum(filter(pax2, feb_grp == "Attended Feb")$feb_h)
d1_mor <- sum(filter(pax2, day1_sess == "Morning")$day1_h)
d1_eve <- sum(filter(pax2, day1_sess == "Evening")$day1_h)
d2_mor <- sum(filter(pax2, day2_sess == "Morning")$day2_h)
d2_eve <- sum(filter(pax2, day2_sess == "Evening")$day2_h)
gap_pk <- 10 # spacing between stacked nodes

# Flow values
f_att_mor <- filter(
  flow_fd1,
  feb_grp == "Attended Feb",
  day1_sess == "Morning"
)$h
f_att_eve <- filter(
  flow_fd1,
  feb_grp == "Attended Feb",
  day1_sess == "Evening"
)$h
f_new_mor <- filter(flow_fd1, feb_grp == "Not Feb", day1_sess == "Morning")$h
f_new_eve <- filter(flow_fd1, feb_grp == "Not Feb", day1_sess == "Evening")$h
f_mm <- filter(flow_d1d2, day1_sess == "Morning", day2_sess == "Morning")$h
f_me <- filter(flow_d1d2, day1_sess == "Morning", day2_sess == "Evening")$h
f_em <- filter(flow_d1d2, day1_sess == "Evening", day2_sess == "Morning")$h
f_ee <- filter(flow_d1d2, day1_sess == "Evening", day2_sess == "Evening")$h
tmp_nm2 <- filter(
  flow_d1d2,
  day1_sess == "Did not attend",
  day2_sess == "Morning"
)
f_nm2 <- if (nrow(tmp_nm2) > 0) tmp_nm2$h else 0
tmp_ne2 <- filter(
  flow_d1d2,
  day1_sess == "Did not attend",
  day2_sess == "Evening"
)
f_ne2 <- if (nrow(tmp_ne2) > 0) tmp_ne2$h else 0

# Source slices within Feb node (0..feb_tot)
s_att_to_mor_lo <- 0
s_att_to_mor_hi <- feb_tot * f_att_mor / (f_att_mor + f_att_eve)
s_att_to_eve_lo <- s_att_to_mor_hi
s_att_to_eve_hi <- feb_tot

# Dest in Day1 Morning (0..d1_mor)
d_new_mor_lo <- 0
d_new_mor_hi <- f_new_mor
d_att_mor_lo <- f_new_mor
d_att_mor_hi <- d1_mor

# Dest in Day1 Evening (d1_mor+gap..d1_mor+gap+d1_eve)
e1 <- d1_mor + gap_pk
d_new_eve_lo <- e1
d_new_eve_hi <- e1 + f_new_eve
d_att_eve_lo <- e1 + f_new_eve
d_att_eve_hi <- e1 + d1_eve

# Dest in Day2 Morning (0..d2_mor)
d_nm2_lo <- 0
d_nm2_hi <- f_nm2
d_em_lo <- f_nm2
d_em_hi <- f_nm2 + f_em
d_mm_lo <- f_nm2 + f_em
d_mm_hi <- d2_mor

# Dest in Day2 Evening (d2_mor+gap..d2_mor+gap+d2_eve)
e2 <- d2_mor + gap_pk
d_ne2_lo <- e2
d_ne2_hi <- e2 + f_ne2
d_me_lo <- e2 + f_ne2
d_me_hi <- e2 + f_ne2 + f_me
d_ee_lo <- e2 + f_ne2 + f_me
d_ee_hi <- e2 + d2_eve

# Source slices within Day1 Morning for Day1→Day2 flows
s_mm_lo <- 0
s_mm_hi <- f_mm
s_me_lo <- f_mm
s_me_hi <- f_mm + f_me

s_ee_lo <- e1
s_ee_hi <- e1 + f_ee
s_em_lo <- e1 + f_ee
s_em_hi <- e1 + f_ee + f_em

node_w <- 0.12

snk_flows <- bind_rows(
  # Feb → Day1
  sigmoid_ribbon(
    1.15,
    1.85,
    s_att_to_mor_lo,
    s_att_to_mor_hi,
    d_att_mor_lo,
    d_att_mor_hi,
    "a_mor",
    "#2171B5"
  ),
  sigmoid_ribbon(
    1.15,
    1.85,
    s_att_to_eve_lo,
    s_att_to_eve_hi,
    d_att_eve_lo,
    d_att_eve_hi,
    "a_eve",
    "#2171B5"
  ),
  sigmoid_ribbon(
    1.15,
    1.85,
    0,
    0,
    d_new_mor_lo,
    d_new_mor_hi,
    "n_mor",
    "#D9D9D9"
  ),
  sigmoid_ribbon(
    1.15,
    1.85,
    0,
    0,
    d_new_eve_lo,
    d_new_eve_hi,
    "n_eve",
    "#D9D9D9"
  ),
  # Day1 → Day2
  sigmoid_ribbon(
    2.15,
    2.85,
    s_mm_lo,
    s_mm_hi,
    d_mm_lo,
    d_mm_hi,
    "mm",
    "#2171B5"
  ),
  sigmoid_ribbon(
    2.15,
    2.85,
    s_me_lo,
    s_me_hi,
    d_me_lo,
    d_me_hi,
    "me",
    "#2171B5"
  ),
  sigmoid_ribbon(
    2.15,
    2.85,
    s_ee_lo,
    s_ee_hi,
    d_ee_lo,
    d_ee_hi,
    "ee",
    "#6BAED6"
  ),
  sigmoid_ribbon(
    2.15,
    2.85,
    s_em_lo,
    s_em_hi,
    d_em_lo,
    d_em_hi,
    "em",
    "#6BAED6"
  ),
  sigmoid_ribbon(
    2.15,
    2.85,
    e1 + d1_eve,
    e1 + d1_eve,
    d_nm2_lo,
    d_nm2_hi,
    "nm2",
    "#D9D9D9"
  ),
  sigmoid_ribbon(
    2.15,
    2.85,
    e1 + d1_eve,
    e1 + d1_eve,
    d_ne2_lo,
    d_ne2_hi,
    "ne2",
    "#D9D9D9"
  )
)

snk_nodes <- bind_rows(
  tibble(
    x = 1,
    label = "Attended\nFeb",
    h = feb_tot,
    y0 = 0,
    y1 = feb_tot,
    fill = "#2171B5"
  ),
  tibble(
    x = 2,
    label = "Morning\n(Day 1)",
    h = d1_mor,
    y0 = 0,
    y1 = d1_mor,
    fill = "#2171B5"
  ),
  tibble(
    x = 2,
    label = "Evening\n(Day 1)",
    h = d1_eve,
    y0 = d1_mor + gap_pk,
    y1 = d1_mor + gap_pk + d1_eve,
    fill = "#6BAED6"
  ),
  tibble(
    x = 3,
    label = "Morning\n(Day 2)",
    h = d2_mor,
    y0 = 0,
    y1 = d2_mor,
    fill = "#2171B5"
  ),
  tibble(
    x = 3,
    label = "Evening\n(Day 2)",
    h = d2_eve,
    y0 = d2_mor + gap_pk,
    y1 = d2_mor + gap_pk + d2_eve,
    fill = "#6BAED6"
  )
) |>
  mutate(xmin = x - node_w, xmax = x + node_w)

snk_totals <- tribble(
  ~x , ~y                            , ~label                                    ,
   1 , feb_tot + 35                  , paste0(round(feb_tot), "h total")         ,
   2 , d1_mor + gap_pk + d1_eve + 35 , paste0(round(d1_mor + d1_eve), "h total") ,
   3 , d2_mor + gap_pk + d2_eve + 35 , paste0(round(d2_mor + d2_eve), "h total")
)

p_flow_hours <- ggplot() +
  geom_polygon(
    data = snk_flows,
    aes(x = x, y = y, group = group, fill = fill),
    alpha = 0.45,
    colour = NA
  ) +
  geom_rect(
    data = snk_nodes,
    aes(xmin = xmin, xmax = xmax, ymin = y0, ymax = y1, fill = fill),
    colour = "white",
    linewidth = 0.4
  ) +
  geom_text(
    data = snk_nodes,
    aes(x = x, y = (y0 + y1) / 2, label = paste0(label, "\n", round(h), "h")),
    size = 3,
    colour = "white",
    fontface = "bold",
    lineheight = 0.9
  ) +
  geom_text(
    data = snk_totals,
    aes(x = x, y = y, label = label),
    size = 3.5,
    fontface = "bold",
    colour = "grey30",
    vjust = 0
  ) +
  scale_fill_identity() +
  scale_x_continuous(
    breaks = 1:3,
    labels = c(
      "Feb Seminar\n(45 min)",
      "Apr Day 1\n(2h 40m)",
      "Apr Day 2\n(2h 40m)"
    ),
    limits = c(0.7, 3.3)
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "Cumulative Watch Time Flow Across Events",
    subtitle = "Column heights = person-hours at each event | Blue = Feb cohort | Grey = new | Teal = evening",
    x = NULL,
    y = "Person-hours"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40", size = 10),
    axis.text.x = element_text(size = 11, face = "bold")
  )


# --- Figure 5: AAlluvial — in roster participant flow by PMU (Unit) -------------------

top_pmus <- c("DEC", "WKP", "AFE", "EAP", "AFW", "ECA", "MAP", "LCR", "SAR")

pmu_colors <- c(
  "DEC" = "#7B2D8B",
  "WKP" = "#D94E0F",
  "AFE" = "#F4A11F",
  "EAP" = "#1B998B",
  "AFW" = "#E84855",
  "ECA" = "#5C4D8A",
  "MAP" = "#0D7BC7",
  "LCR" = "#3BAA6E",
  "SAR" = "#C9523B",
  "Other" = "#888888",
  "NA" = "#D0D0D0"
)

alluvial_pmu <- all_persons_full |>
  mutate(
    pmu_group = case_when(
      pmu %in% top_pmus ~ pmu,
      !is.na(pmu) ~ "Other",
      TRUE ~ "NA"
    ),
    pmu_group = factor(
      pmu_group,
      levels = c(top_pmus, "Other", "NA")
    ),
    fill_group = if_else(
      feb == "Did not attend" &
        day1 == "Did not attend" &
        day2 == "Did not attend",
      "No-show",
      as.character(pmu_group)
    ),
    fill_group = factor(
      fill_group,
      levels = c(top_pmus, "Other", "NA", "No-show")
    ),
    feb = factor(feb, levels = c("Did not attend", "Attended")),
    olc_reg = factor(olc_reg, levels = c("Not registered", "Registered")),
    day1 = factor(day1, levels = c("Did not attend", "Evening", "Morning")),
    day2 = factor(day2, levels = c("Did not attend", "Evening", "Morning"))
  ) |>
  count(fill_group, feb, olc_reg, day1, day2, name = "n")

p_flow_pmu <- ggplot(
  alluvial_pmu,
  aes(axis1 = feb, axis2 = olc_reg, axis3 = day1, axis4 = day2, y = n)
) +
  geom_alluvium(
    aes(fill = fill_group),
    width = 1 / 4,
    alpha = 0.7,
    knot.pos = 0.4,
    aes.bind = "alluvia"
  ) +
  geom_stratum(
    width = 1 / 3,
    fill = "grey92",
    color = "grey30",
    linewidth = 0.5
  ) +
  geom_text(
    stat = "stratum",
    aes(label = after_stat(stratum)),
    size = 3,
    fontface = "bold"
  ) +
  scale_x_discrete(
    limits = c(
      "Feb Seminar\n(45 min)",
      "OLC\nRegistered",
      "Apr Day 1\n(2h 40m)",
      "Apr Day 2\n(2h 40m)"
    ),
    expand = c(0.12, 0.05)
  ) +
  scale_fill_manual(
    values = c(pmu_colors, "No-show" = "#D9D9D9"),
    name = "Unit (PMU)",
    breaks = c(top_pmus, "Other", "NA")
  ) +
  labs(
    title = "Participant Flow Across Events by Unit (PMU)",
    subtitle = "581 registered or attended | width ~ number of people",
    y = "Number of participants"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40"),
    legend.position = "right",
    legend.key.size = unit(0.5, "cm")
  )


# --- Figure 5b-e: Unique attendees by Grade, PMU, Gender & Location --------

grade_levels <- c("ST", "ET/EC", "≤GE", "GF", "GG", "GH+", "NA")
grade_colors <- setNames(
  c(RColorBrewer::brewer.pal(6, "Paired"), "#F0F0F0"),
  grade_levels
)

attendees_only <- all_persons_full |>
  filter(
    feb != "Did not attend" |
      day1 != "Did not attend" |
      day2 != "Did not attend"
  )

# All registered or attended (includes no-shows)
registered_all <- all_persons_full

unique_by_grade <- registered_all |>
  mutate(
    grade_group = case_when(
      grade %in% c("UC", "UA", "UJ") ~ "ST",
      str_starts(grade, "ET") | str_starts(grade, "EC") ~ "ET/EC",
      grade %in% c("GA", "GB", "GC", "GD", "GE") ~ "≤GE",
      grade == "GF" ~ "GF",
      grade == "GG" ~ "GG",
      grade %in% c("GH", "GI", "GJ", "GK", "GL", "GM", "GN") ~ "GH+",
      TRUE ~ "NA"
    ),
    grade_group = factor(grade_group, levels = grade_levels)
  ) |>
  count(grade_group, name = "n") |>
  mutate(pct = n / sum(n))

unique_by_pmu <- registered_all |>
  mutate(
    pmu_group = case_when(
      pmu %in% top_pmus ~ pmu,
      !is.na(pmu) ~ "Other",
      TRUE ~ "NA"
    ),
    pmu_group = factor(pmu_group, levels = c(top_pmus, "Other", "NA"))
  ) |>
  count(pmu_group, name = "n") |>
  mutate(pct = n / sum(n))

unique_by_gender <- registered_all |>
  mutate(gender_group = replace_na(gender, "NA")) |>
  count(gender_group, name = "n") |>
  mutate(pct = n / sum(n))

unique_by_hqco <- registered_all |>
  mutate(hqco_group = replace_na(hq_co, "NA")) |>
  count(hqco_group, name = "n") |>
  mutate(pct = n / sum(n))

gender_colors <- c("Male" = "#2166AC", "Female" = "#D6604D", "NA" = "#BBBBBB")
hqco_colors <- c("HQ" = "#4DAC26", "CO" = "#B45E00", "NA" = "#BBBBBB")

unique_combined <- bind_rows(
  unique_by_grade |>
    transmute(
      bar = "By Grade",
      group = as.character(grade_group),
      n,
      pct,
      fill_key = as.character(grade_group)
    ),
  unique_by_pmu |>
    transmute(
      bar = "By Unit (PMU)",
      group = as.character(pmu_group),
      n,
      pct,
      fill_key = paste0("pmu_", as.character(pmu_group))
    ),
  unique_by_gender |>
    transmute(
      bar = "By Gender",
      group = as.character(gender_group),
      n,
      pct,
      fill_key = paste0("g_", gender_group)
    ),
  unique_by_hqco |>
    transmute(
      bar = "By Location",
      group = as.character(hqco_group),
      n,
      pct,
      fill_key = paste0("h_", hqco_group)
    )
) |>
  mutate(
    bar = factor(
      bar,
      levels = c("By Grade", "By Unit (PMU)", "By Gender", "By Location")
    ),
    fill_key = factor(
      fill_key,
      levels = c(
        grade_levels,
        paste0("pmu_", c(top_pmus, "Other", "NA")),
        paste0("g_", c("Male", "Female", "NA")),
        paste0("h_", c("HQ", "CO", "NA"))
      )
    )
  )

all_fill_colors <- c(
  grade_colors,
  setNames(unname(pmu_colors), paste0("pmu_", names(pmu_colors))),
  setNames(unname(gender_colors), paste0("g_", names(gender_colors))),
  setNames(unname(hqco_colors), paste0("h_", names(hqco_colors)))
)

p_overall_combined <- ggplot(
  unique_combined,
  aes(x = bar, y = n, fill = fill_key)
) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  geom_text(
    aes(
      label = paste0(group, ": ", n, " (", round(pct * 100), "%)"),
      colour = fill_key
    ),
    position = position_stack(vjust = 1),
    vjust = -0.3,
    size = 2.5,
    fontface = "bold"
  ) +
  scale_fill_manual(values = all_fill_colors, guide = "none") +
  scale_colour_manual(values = all_fill_colors, guide = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0)), limits = c(0, 600)) +
  labs(
    title = "Unique Attendees Across All Sessions",
    subtitle = paste0(nrow(registered_all), " registered or attended"),
    x = NULL,
    y = "Unique attendees"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40")
  )


# --- Figure 6-8: Grade bar charts + alluvial -------------------------------

# Join grade groups onto person_flow
person_flow_grade <- person_flow |>
  left_join(
    all_persons_full |> select(person_id, grade),
    join_by(person_id)
  ) |>
  mutate(
    grade_group = case_when(
      grade %in% c("UC", "UA", "UJ") ~ "ST",
      str_starts(grade, "ET") | str_starts(grade, "EC") ~ "ET/EC",
      grade %in% c("GA", "GB", "GC", "GD", "GE") ~ "≤GE",
      grade == "GF" ~ "GF",
      grade == "GG" ~ "GG",
      grade %in% c("GH", "GI", "GJ", "GK", "GL", "GM", "GN") ~ "GH+",
      TRUE ~ "NA"
    ),
    grade_group = factor(grade_group, levels = grade_levels)
  )

time_by_grade <- person_flow_grade |>
  summarise(
    total_hours = sum(duration_min) / 60,
    n_attendees = n_distinct(person_id),
    .by = c(stage, grade_group)
  ) |>
  mutate(
    stage_label = factor(
      case_when(
        stage == "feb" ~ "Feb Seminar",
        stage == "day1" ~ "Apr Day 1",
        stage == "day2" ~ "Apr Day 2"
      ),
      levels = c("Feb Seminar", "Apr Day 1", "Apr Day 2")
    )
  )

# Figure 6: Stacked bars — attendees by grade
p_attendees_grade <- ggplot(
  time_by_grade,
  aes(x = stage_label, y = n_attendees, fill = grade_group)
) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  scale_fill_manual(values = grade_colors, name = "Grade") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  stat_summary(
    fun = sum,
    geom = "text",
    aes(label = after_stat(y), group = stage_label),
    vjust = -0.4,
    size = 4,
    fontface = "bold",
    show.legend = FALSE
  ) +
  labs(
    title = "Unique Attendees per Event by Grade",
    subtitle = "Attendees only (not registered no-shows)",
    x = NULL,
    y = "Unique attendees"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40"),
    legend.position = "right",
    legend.key.size = unit(0.45, "cm")
  )

# Figure 7: Stacked bars — watch time by grade
p_watchtime_grade <- ggplot(
  time_by_grade,
  aes(x = stage_label, y = total_hours, fill = grade_group)
) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  scale_fill_manual(values = grade_colors, name = "Grade") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  stat_summary(
    fun = sum,
    geom = "text",
    aes(label = paste0(round(after_stat(y)), "h"), group = stage_label),
    vjust = -0.4,
    size = 4,
    fontface = "bold",
    show.legend = FALSE
  ) +
  labs(
    title = "Cumulative Watch Time per Event by Grade",
    subtitle = "Total person-hours of participation",
    x = NULL,
    y = "Total hours"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40"),
    legend.position = "right",
    legend.key.size = unit(0.45, "cm")
  )

# Figure 8: Alluvial — participant flow by grade
alluvial_grade <- all_persons_full |>
  mutate(
    grade_group = case_when(
      grade %in% c("UC", "UA", "UJ") ~ "ST",
      str_starts(grade, "ET") | str_starts(grade, "EC") ~ "ET/EC",
      grade %in% c("GA", "GB", "GC", "GD", "GE") ~ "≤GE",
      grade == "GF" ~ "GF",
      grade == "GG" ~ "GG",
      grade %in% c("GH", "GI", "GJ", "GK", "GL", "GM", "GN") ~ "GH+",
      TRUE ~ "NA"
    ),
    fill_group = factor(
      grade_group,
      levels = c("NA", "ST", "ET/EC", "≤GE", "GF", "GG", "GH+")
    ),
    feb = factor(feb, levels = c("Did not attend", "Attended")),
    olc_reg = factor(olc_reg, levels = c("Not registered", "Registered")),
    day1 = factor(day1, levels = c("Did not attend", "Evening", "Morning")),
    day2 = factor(day2, levels = c("Did not attend", "Evening", "Morning"))
  ) |>
  count(fill_group, feb, olc_reg, day1, day2, name = "n")

p_flow_grade <- ggplot(
  alluvial_grade,
  aes(axis1 = feb, axis2 = olc_reg, axis3 = day1, axis4 = day2, y = n)
) +
  geom_alluvium(
    aes(fill = fill_group),
    width = 1 / 4,
    alpha = 0.7,
    knot.pos = 0.4,
    aes.bind = "alluvia"
  ) +
  geom_stratum(
    width = 1 / 3,
    fill = "grey92",
    color = "grey30",
    linewidth = 0.5
  ) +
  geom_text(
    stat = "stratum",
    aes(label = after_stat(stratum)),
    size = 3,
    fontface = "bold"
  ) +
  scale_x_discrete(
    limits = c(
      "Feb Seminar\n(45 min)",
      "OLC\nRegistered",
      "Apr Day 1\n(2h 40m)",
      "Apr Day 2\n(2h 40m)"
    ),
    expand = c(0.12, 0.05)
  ) +
  scale_fill_manual(
    values = grade_colors,
    name = "Grade",
    breaks = c("NA", "ST", "ET/EC", "≤GE", "GF", "GG", "GH+")
  ) +
  labs(
    title = "Participant Flow Across Events by Grade",
    subtitle = "581 registered or attended | width ~ number of people",
    y = "Number of participants"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey40"),
    legend.position = "right",
    legend.key.size = unit(0.5, "cm")
  )


# --- Save figures ----------------------------------------------------------

ggsave(
  "blog-post/fig-attendees-by-event.png",
  p_attendees,
  width = 7,
  height = 5,
  dpi = 200,
  bg = "white"
)
ggsave(
  "blog-post/fig-watchtime-by-event.png",
  p_watchtime,
  width = 7,
  height = 5,
  dpi = 200,
  bg = "white"
)
ggsave(
  "blog-post/fig-participant-flow.png",
  p_flow_headcount,
  width = 10,
  height = 6,
  dpi = 150,
  bg = "white"
)
ggsave(
  "blog-post/fig-flow-pmu.png",
  p_flow_pmu,
  width = 12,
  height = 7,
  dpi = 200,
  bg = "white"
)
ggsave(
  "blog-post/fig-attendees-grade.png",
  p_attendees_grade,
  width = 8,
  height = 5,
  dpi = 200,
  bg = "white"
)
ggsave(
  "blog-post/fig-watchtime-grade.png",
  p_watchtime_grade,
  width = 8,
  height = 5,
  dpi = 200,
  bg = "white"
)
ggsave(
  "blog-post/fig-flow-grade.png",
  p_flow_grade,
  width = 12,
  height = 7,
  dpi = 200,
  bg = "white"
)

# Combined panel — overview (session breakdown)
combined <- (p_attendees | p_overall_combined) /
  p_flow_headcount /
  p_flow_pmu +
  plot_annotation(
    title = "AI-Assisted Coding Event Series — Attendance Analysis",
    theme = theme(
      plot.title = element_text(face = "bold", size = 16, hjust = 0.5)
    )
  )
ggsave(
  "blog-post/attendance-figures.png",
  combined,
  width = 9,
  height = 9,
  dpi = 300,
  scale = 1.5,
  bg = "white"
)

# Combined panel — grade breakdown
combined_grade <- ((p_attendees_grade | p_overall_combined) +
  plot_layout(widths = c(2, 3))) /
  p_flow_grade +
  plot_annotation(
    title = "AI-Assisted Coding Event Series — Grade Breakdown",
    theme = theme(
      plot.title = element_text(face = "bold", size = 16, hjust = 0.5)
    )
  )
ggsave(
  "blog-post/attendance-figures-grade.png",
  combined_grade,
  width = 9,
  height = 6,
  dpi = 300,
  scale = 1.5,
  bg = "white"
)

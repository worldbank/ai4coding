library(tidyverse)

# --- 1. Helper: read Teams attendance CSVs (UTF-16LE encoded) --------------

read_teams_attendance <- function(filepath) {
  raw_bytes <- readBin(filepath, "raw", n = file.info(filepath)$size)
  text <- stringi::stri_encode(raw_bytes, from = "UTF-16LE", to = "UTF-8")
  text <- sub("^\uFEFF", "", text)
  lines <- str_split(text, "\r\n|\n|\r")[[1]]

  header_idx <- which(str_detect(lines, "^Name\t"))
  if (length(header_idx) == 0) stop("No participant header in: ", filepath)
  header_idx <- header_idx[1]

  data_lines <- lines[(header_idx + 1):length(lines)]
  data_lines <- data_lines[nchar(data_lines) > 0]
  data_text  <- paste(c(lines[header_idx], data_lines), collapse = "\n")

  read_tsv(I(data_text), show_col_types = FALSE) |>
    rename(
      name         = Name,
      first_join   = `First Join`,
      last_leave   = `Last Leave`,
      duration_str = `In-Meeting Duration`,
      email        = Email,
      upn          = `Participant ID (UPN)`,
      role         = Role
    )
}

# --- 2. Read & combine all attendance files --------------------------------

attendance_dir <- "blog-post/atendance"

files_info <- tribble(
  ~file, ~event, ~session, ~date,
  "Revolutionize Your Analysis in Stata and R_ AI Agent-Assisted Workflow with GitHub Copilot and Claude - Attendance report 2-05-2.csv",
    "seminar_feb", "single", "2025-02-05",
  "Poverty Learning Series-Morning Session[Mon_Thur 9AM EST] - Attendance report 4-20-26.csv",
    "workshop_apr", "morning", "2026-04-20",
  "AI-Assisted Coding for Economists-Evening Session [Mon_Thur 9PM EST] - Attendance report 4-20-26.csv",
    "workshop_apr", "evening", "2026-04-20",
  "Poverty Learning Series-Morning Session[Mon_Thur 9AM EST] - Attendance report 4-23-26.csv",
    "workshop_apr", "morning", "2026-04-23",
  "AI-Assisted Coding for Economists-Evening Session [Mon_Thur 9PM EST] - Attendance report 4-23-26.csv",
    "workshop_apr", "evening", "2026-04-23"
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
  mutate(data = map(file, \(f) read_teams_attendance(file.path(attendance_dir, f)))) |>
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
    email_clean  = str_to_lower(str_trim(email)),
    # Use email as unique ID; fall back to name for unverified participants
    person_id    = if_else(is.na(email_clean) | email_clean == "",
                           str_to_lower(str_trim(name)), email_clean),
    event_label  = case_when(
      event == "seminar_feb" ~ "1. Feb Seminar (45 min)",
      part == "part1"        ~ "2. Apr Workshop Day 1 (2h40m)",
      part == "part2"        ~ "3. Apr Workshop Day 2 (2h40m)"
    )
  ) |>
  filter(duration_min > 0)

# --- 4. Unique attendees per event -----------------------------------------

attendees_by_event <- attendance |>
  summarise(
    n_attendees  = n_distinct(person_id),
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
    n_attendees  = n_distinct(person_id),
    avg_duration = round(mean(duration_min), 1),
    .by = c(event_label, session)
  ) |>
  arrange(event_label, session)

session_breakdown

# --- 7. Retention analysis -------------------------------------------------

feb_ids       <- attendance |> filter(event == "seminar_feb") |> distinct(person_id) |> pull()
apr_part1_ids <- attendance |> filter(part == "part1")        |> distinct(person_id) |> pull()
apr_part2_ids <- attendance |> filter(part == "part2")        |> distinct(person_id) |> pull()
apr_any_ids   <- attendance |> filter(event == "workshop_apr")|> distinct(person_id) |> pull()

retention <- tribble(
  ~transition, ~from_n, ~to_n, ~retained, ~retention_pct,
  "Feb Seminar → Apr Workshop (any)",
    length(feb_ids), length(apr_any_ids),
    length(intersect(feb_ids, apr_any_ids)),
    round(100 * length(intersect(feb_ids, apr_any_ids)) / length(feb_ids), 1),
  "Feb Seminar → Apr Day 1",
    length(feb_ids), length(apr_part1_ids),
    length(intersect(feb_ids, apr_part1_ids)),
    round(100 * length(intersect(feb_ids, apr_part1_ids)) / length(feb_ids), 1),
  "Feb Seminar → Apr Day 2",
    length(feb_ids), length(apr_part2_ids),
    length(intersect(feb_ids, apr_part2_ids)),
    round(100 * length(intersect(feb_ids, apr_part2_ids)) / length(feb_ids), 1),
  "Apr Day 1 → Apr Day 2",
    length(apr_part1_ids), length(apr_part2_ids),
    length(intersect(apr_part1_ids, apr_part2_ids)),
    round(100 * length(intersect(apr_part1_ids, apr_part2_ids)) / length(apr_part1_ids), 1),
  "Apr Workshop only (not in Feb)",
    length(apr_any_ids), NA_real_,
    length(setdiff(apr_any_ids, feb_ids)),
    round(100 * length(setdiff(apr_any_ids, feb_ids)) / length(apr_any_ids), 1)
)

retention

# --- 8. Participation patterns ---------------------------------------------

person_events <- attendance |>
  distinct(person_id, event_label) |>
  mutate(attended = TRUE) |>
  pivot_wider(
    id_cols     = person_id,
    names_from  = event_label,
    values_from = attended,
    values_fill = FALSE
  )

participation_patterns <- person_events |>
  count(across(-person_id), name = "n_people") |>
  arrange(desc(n_people))

participation_patterns


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
  "Morning"        = "#2171B5",
  "Evening"        = "#6BAED6"
)

flow_colors <- c(
  "Attended"        = "#2171B5",
  "Did not attend"  = "#D9D9D9"
)

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
  summarise(session = paste(sort(unique(session)), collapse = "+"), .by = person_id) |>
  mutate(day1 = case_when(
    session == "morning" ~ "Morning",
    session == "evening" ~ "Evening",
    TRUE ~ "Both sessions"
  )) |>
  select(person_id, day1)

day2_status <- person_flow |>
  filter(stage == "day2") |>
  summarise(session = paste(sort(unique(session)), collapse = "+"), .by = person_id) |>
  mutate(day2 = case_when(
    session == "morning" ~ "Morning",
    session == "evening" ~ "Evening",
    TRUE ~ "Both sessions"
  )) |>
  select(person_id, day2)

all_persons <- tibble(person_id = unique(attendance$person_id)) |>
  left_join(feb_status,  join_by(person_id)) |>
  left_join(day1_status, join_by(person_id)) |>
  left_join(day2_status, join_by(person_id)) |>
  mutate(
    feb  = replace_na(feb, "Did not attend"),
    day1 = replace_na(day1, "Did not attend"),
    day2 = replace_na(day2, "Did not attend")
  )

# --- Aggregate watch-time per person per stage for Figure 4 ----------------

feb_time <- person_flow |>
  filter(stage == "feb") |>
  summarise(feb_min = sum(duration_min), .by = person_id) |>
  mutate(feb = "Attended")

day1_time <- person_flow |>
  filter(stage == "day1") |>
  summarise(day1_min = sum(duration_min), day1_sess = paste(sort(unique(session)), collapse = "+"), .by = person_id) |>
  mutate(day1 = case_when(day1_sess == "morning" ~ "Morning", day1_sess == "evening" ~ "Evening", TRUE ~ "Both sessions")) |>
  select(person_id, day1_min, day1)

day2_time <- person_flow |>
  filter(stage == "day2") |>
  summarise(day2_min = sum(duration_min), day2_sess = paste(sort(unique(session)), collapse = "+"), .by = person_id) |>
  mutate(day2 = case_when(day2_sess == "morning" ~ "Morning", day2_sess == "evening" ~ "Evening", TRUE ~ "Both sessions")) |>
  select(person_id, day2_min, day2)

all_time <- tibble(person_id = unique(attendance$person_id)) |>
  left_join(feb_time,  join_by(person_id)) |>
  left_join(day1_time, join_by(person_id)) |>
  left_join(day2_time, join_by(person_id)) |>
  mutate(
    feb  = replace_na(feb, "Did not attend"),
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
      case_when(stage == "feb" ~ "Feb Seminar", stage == "day1" ~ "Apr Day 1", stage == "day2" ~ "Apr Day 2"),
      levels = c("Feb Seminar", "Apr Day 1", "Apr Day 2")
    ),
    session_label = case_when(session == "single" ~ "Single session", session == "morning" ~ "Morning", session == "evening" ~ "Evening")
  )


# --- Figure 1: Stacked bars — unique attendees per event -------------------

p_attendees <- ggplot(time_by_stage, aes(x = stage_label, y = n_attendees, fill = session_label)) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  geom_text(
    aes(label = paste0(n_attendees, "\n(", session_label, ")")),
    position = position_stack(vjust = 0.5),
    size = 3.2, color = "white", fontface = "bold"
  ) +
  stat_summary(
    fun = sum, geom = "text",
    aes(label = after_stat(y), group = stage_label),
    vjust = -0.5, size = 4, fontface = "bold", show.legend = FALSE
  ) +
  scale_fill_manual(values = session_colors, name = "Session") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.12))) +
  labs(
    title    = "Unique Attendees per Event",
    subtitle = "Apr workshop offered morning & evening sessions (same content)",
    x = NULL, y = "Unique attendees"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank(),
    plot.title          = element_text(face = "bold"),
    plot.subtitle       = element_text(color = "grey40"),
    legend.position     = "bottom"
  )


# --- Figure 2: Stacked bars — cumulative watch time ------------------------

p_watchtime <- ggplot(time_by_stage, aes(x = stage_label, y = total_hours, fill = session_label)) +
  geom_col(width = 0.55, color = "white", linewidth = 0.3) +
  geom_text(
    aes(label = paste0(round(total_hours), "h\n(", session_label, ")")),
    position = position_stack(vjust = 0.5),
    size = 3.2, color = "white", fontface = "bold"
  ) +
  stat_summary(
    fun = sum, geom = "text",
    aes(label = paste0(round(after_stat(y)), "h"), group = stage_label),
    vjust = -0.5, size = 4, fontface = "bold", show.legend = FALSE
  ) +
  scale_fill_manual(values = session_colors, name = "Session") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.12))) +
  labs(
    title    = "Cumulative Watch Time per Event",
    subtitle = "Total person-hours of participation",
    x = NULL, y = "Total hours"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank(),
    plot.title          = element_text(face = "bold"),
    plot.subtitle       = element_text(color = "grey40"),
    legend.position     = "bottom"
  )


# --- Figure 3: Alluvial — participant flow (headcount) ---------------------

alluvial_headcount <- all_persons |>
  mutate(
    feb  = factor(feb,  levels = c("Attended", "Did not attend")),
    day1 = factor(day1, levels = c("Morning", "Evening", "Both sessions", "Did not attend")),
    day2 = factor(day2, levels = c("Morning", "Evening", "Both sessions", "Did not attend"))
  ) |>
  count(feb, day1, day2, name = "n")

p_flow_headcount <- ggplot(alluvial_headcount,
       aes(axis1 = feb, axis2 = day1, axis3 = day2, y = n)) +
  geom_alluvium(aes(fill = feb), width = 1/6, alpha = 0.55, knot.pos = 0.4) +
  geom_stratum(width = 1/4, fill = "grey90", color = "grey40") +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)), size = 3) +
  scale_x_discrete(
    limits = c("Feb Seminar\n(45 min)", "Apr Day 1\n(2h 40m)", "Apr Day 2\n(2h 40m)"),
    expand = c(0.15, 0.05)
  ) +
  scale_fill_manual(values = flow_colors, guide = "none") +
  labs(
    title    = "Participant Flow Across Events",
    subtitle = "500 unique attendees | width ~ number of people",
    y = "Number of participants"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank(),
    plot.title          = element_text(face = "bold"),
    plot.subtitle       = element_text(color = "grey40")
  )


# --- Figure 4: Alluvial — watch-time flow ----------------------------------

alluvial_hours <- all_time |>
  mutate(
    feb  = factor(feb,  levels = c("Attended", "Did not attend")),
    day1 = factor(day1, levels = c("Morning", "Evening", "Both sessions", "Did not attend")),
    day2 = factor(day2, levels = c("Morning", "Evening", "Both sessions", "Did not attend"))
  ) |>
  summarise(total_hours = sum(total_min) / 60, .by = c(feb, day1, day2))

p_flow_hours <- ggplot(alluvial_hours,
       aes(axis1 = feb, axis2 = day1, axis3 = day2, y = total_hours)) +
  geom_alluvium(aes(fill = feb), width = 1/6, alpha = 0.55, knot.pos = 0.4) +
  geom_stratum(width = 1/4, fill = "grey90", color = "grey40") +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)), size = 3) +
  scale_x_discrete(
    limits = c("Feb Seminar\n(45 min)", "Apr Day 1\n(2h 40m)", "Apr Day 2\n(2h 40m)"),
    expand = c(0.15, 0.05)
  ) +
  scale_fill_manual(values = flow_colors, guide = "none") +
  labs(
    title    = "Cumulative Watch Time Flow Across Events",
    subtitle = "Width ~ total person-hours invested",
    y = "Total hours"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank(),
    plot.title          = element_text(face = "bold"),
    plot.subtitle       = element_text(color = "grey40")
  )


# --- Save figures ----------------------------------------------------------

ggsave("blog-post/fig-attendees-by-event.png", p_attendees, width = 7, height = 5, dpi = 200, bg = "white")
ggsave("blog-post/fig-watchtime-by-event.png", p_watchtime, width = 7, height = 5, dpi = 200, bg = "white")
ggsave("blog-post/fig-participant-flow.png", p_flow_headcount, width = 10, height = 6, dpi = 200, bg = "white")
ggsave("blog-post/fig-watchtime-flow.png", p_flow_hours, width = 10, height = 6, dpi = 200, bg = "white")

# Combined panel
combined <- (p_attendees | p_watchtime) / p_flow_headcount / p_flow_hours +
  plot_annotation(
    title = "AI-Assisted Coding Event Series — Attendance Analysis",
    theme = theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5))
  )
ggsave("blog-post/attendance-figures.png", combined, width = 14, height = 18, dpi = 200, bg = "white")

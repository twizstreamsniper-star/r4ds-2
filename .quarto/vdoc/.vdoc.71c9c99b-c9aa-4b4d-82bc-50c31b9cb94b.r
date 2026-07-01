#
#
#
#
#
#
#
#| cache: true
library(readxl)
library(dplyr)

basketball_tibble <- read_excel("data/nba_recruits.xlsx") |>
  mutate(
    tier = factor(
      tier,
      levels = c("Never played", "Brief career", "Solid career", "All-Star level", "Superstar"),
      ordered = TRUE
    ),
    recruit_group = factor(
      recruit_group,
      levels = c("#1–10", "#11–25", "#26–50", "#51–100", "Outside top 100"),
      ordered = TRUE
    )
  )

basketball_tibble
#
#
#
library(dplyr)

basketball_tibble |>
  filter(!is.na(nba_mean_ws48)) |>
  arrange(desc(nba_mean_ws48)) |>
  select(name, rank, recruit_group, nba_mean_ws48) |>
  head(10)
#
#
#
#

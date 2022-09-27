library(nflfastR)
library(dplyr, warn.conflicts = FALSE)
library(readr)
ids <- nflfastR::fast_scraper_schedules(2022:2022) %>%
  dplyr::pull(game_id)

future::plan("multisession")
pbp <- nflfastR::build_nflfastR_pbp(ids)

write_excel_csv(pbp, "C:\\NFL_Data\\NFL_PBP2022.csv")

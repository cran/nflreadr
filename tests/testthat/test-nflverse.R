test_that("load_pbp", {

  skip_on_cran()
  skip_if_offline("github.com")

  pbp <- load_pbp()
  pbp_years <- load_pbp(2019:2020)
  pbp_qs <- load_pbp(2019:2020, file_type = "qs")

  expect_s3_class(pbp, "nflverse_data")
  expect_s3_class(pbp_qs, "nflverse_data")
  expect_s3_class(pbp_years, "nflverse_data")

  expect_gt(nrow(pbp_years), 90000)
  expect_gt(nrow(pbp_qs), 90000)
})
test_that("load_participation", {

  skip_on_cran()
  skip_if_offline("github.com")

  participation <- load_participation(2019)
  pbp_participation <- load_participation(2020,include_pbp = TRUE, file_type = "parquet")

  expect_s3_class(participation, "nflverse_data")
  expect_s3_class(pbp_participation, "nflverse_data")

  expect_gt(ncol(participation), 5)
  expect_gt(ncol(pbp_participation), 300)
  expect_gt(nrow(participation), 40000)
  expect_gt(nrow(pbp_participation), 40000)
})

test_that("load_player_stats", {

  skip_on_cran()
  skip_if_offline("github.com")

  ps <- load_player_stats()
  ps_2020 <- load_player_stats(2020,stat_type = "offense")
  ps_csv <- load_player_stats(2020, file_type = "csv")
  ps_all <- load_player_stats(seasons = TRUE)

  kick <- load_player_stats(2020, stat_type = "kicking")
  defense <- load_player_stats(2022, stat_type = "defense")

  expect_s3_class(ps, "nflverse_data")
  expect_s3_class(ps_2020, "nflverse_data")
  expect_s3_class(ps_csv, "nflverse_data")
  expect_s3_class(ps_all, "nflverse_data")
  expect_s3_class(kick, "nflverse_data")
  expect_s3_class(defense, "nflverse_data")

  expect_gt(nrow(ps_2020), 5000)
  expect_gt(nrow(ps_csv), 5000)
  expect_gt(nrow(ps_all), 110000)
  expect_gt(nrow(kick), 500)
  expect_gt(nrow(defense), 9800)
})

test_that("load_schedules", {

  skip_on_cran()
  skip_if_offline("github.com")

  schedules <- load_schedules()

  expect_s3_class(schedules, "nflverse_data")

  expect_gt(nrow(schedules), 6000)

  expect_error(load_schedules("2020"))

  sched_2020 <- load_schedules(2020)

  expect_s3_class(schedules, "nflverse_data")

  expect_lte(nrow(sched_2020), 269)
})

test_that("load_rosters", {

  skip_on_cran()
  skip_if_offline("github.com")

  rosters <- load_rosters()
  rosters_years <- load_rosters(seasons = 2019:2020)

  expect_s3_class(rosters, "nflverse_data")
  expect_s3_class(rosters_years, "nflverse_data")
  expect_gt(nrow(rosters), 2000)
  expect_gt(nrow(rosters_years), 5000)
})

test_that("load_rosters_weekly", {

  skip_on_cran()
  skip_if_offline("github.com")

  rosters <- load_rosters_weekly()
  rosters_years <- load_rosters_weekly(seasons = 2019:2020)

  expect_s3_class(rosters, "nflverse_data")
  expect_s3_class(rosters_years, "nflverse_data")
  expect_gt(nrow(rosters), 2000)
  expect_gt(nrow(rosters_years), 90000)
})

test_that("load_ngs", {

  skip_on_cran()
  skip_if_offline("github.com")

  ngs_passing <- load_nextgen_stats()
  ngs_receiving <- load_nextgen_stats(seasons = 2019:2020, stat_type = "receiving", file_type = "parquet")
  ngs_rushing <- load_nextgen_stats(seasons = 2020, stat_type = "rushing")

  expect_s3_class(ngs_passing, "nflverse_data")
  expect_s3_class(ngs_receiving, "nflverse_data")
  expect_s3_class(ngs_rushing, "nflverse_data")

  expect_gt(nrow(ngs_receiving), 1500)
  expect_gt(nrow(ngs_rushing), 500)
})

test_that("load_teams", {

  skip_on_cran()
  skip_if_offline("github.com")

  team_graphics <- load_teams()
  team_graphics_all <- load_teams(current = FALSE)

  expect_s3_class(team_graphics, "nflverse_data")
  expect_s3_class(team_graphics_all, "nflverse_data")

  expect_gte(nrow(team_graphics), 32)
  expect_gt(nrow(team_graphics_all), 32)
})

test_that("load_depth_charts", {

  skip_on_cran()
  skip_if_offline("github.com")

  depth_charts <- load_depth_charts()
  depth_charts_years <- load_depth_charts(seasons = 2019:2020)

  expect_s3_class(depth_charts, "nflverse_data")
  expect_s3_class(depth_charts_years, "nflverse_data")
  expect_gt(nrow(depth_charts_years), 60000)
})

test_that("load_injuries", {

  skip_on_cran()
  skip_if_offline("github.com")

  injuries <- load_injuries()
  injuries_years <- load_injuries(seasons = 2019:2020)
  injuries_all <- load_injuries(seasons = TRUE)

  expect_s3_class(injuries, "nflverse_data")
  expect_s3_class(injuries_years, "nflverse_data")
  expect_s3_class(injuries_all, "nflverse_data")
  expect_gt(nrow(injuries_years), 8000)
  expect_gt(nrow(injuries_all), 60000)
})

test_that("load_espn_qbr", {

  skip_on_cran()
  skip_if_offline("github.com")

  qbr_default <- load_espn_qbr()
  qbr_nfl_weekly <- load_espn_qbr(league = "nfl", seasons = TRUE, summary_type = "weekly")
  qbr_cfb_season <- load_espn_qbr(league = "college", seasons = 2019:2020)

  expect_s3_class(qbr_default, "nflverse_data")
  expect_s3_class(qbr_nfl_weekly, "nflverse_data")
  expect_s3_class(qbr_cfb_season, "nflverse_data")
  # expect_gt(nrow(qbr_default), 30)
  expect_gt(nrow(qbr_nfl_weekly), 7500)
  expect_gt(nrow(qbr_cfb_season), 200)
})

test_that("load_trades", {

  skip_on_cran()
  skip_if_offline("github.com")

  trades <- load_trades()
  trades_2020 <- load_trades(seasons = 2020)

  expect_s3_class(trades, "nflverse_data")
  expect_s3_class(trades_2020, "nflverse_data")

  expect_gt(nrow(trades), 3000)
  expect_lte(nrow(trades_2020), 215)

  expect_error(load_trades("2020"))
})

test_that("load_draft_picks", {

  skip_on_cran()
  skip_if_offline("github.com")

  picks <- load_draft_picks()
  picks_2020 <- load_draft_picks(2020)

  expect_s3_class(picks, "nflverse_data")
  expect_s3_class(picks_2020, "nflverse_data")

  expect_gt(nrow(picks), 10000)
  expect_lt(nrow(picks_2020), 260)

  expect_error(load_draft_picks("2020"))
})

test_that("load_combine", {

  skip_on_cran()
  skip_if_offline("github.com")

  combine <- load_combine()
  combine_2020 <- load_combine(2020)

  expect_s3_class(combine, "nflverse_data")
  expect_s3_class(combine_2020, "nflverse_data")

  expect_gt(nrow(combine), 7000)
  expect_gte(nrow(combine_2020), 337)

  expect_error(load_combine("2020"))
})

test_that("load_pfr_passing", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_warning(passing <- load_pfr_passing())

  expect_s3_class(passing, "nflverse_data")
  expect_gt(nrow(passing), 200)
})

test_that("load_pfr_advstats", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_error(load_pfr_advstats("2020"))

  pass <- load_pfr_advstats(seasons = 2020, stat_type = "pass")
  rush <- load_pfr_advstats(seasons = TRUE, stat_type = "rush")
  def <- load_pfr_advstats(seasons = TRUE, stat_type = "def", summary_level = "season")

  expect_s3_class(pass, "nflverse_data")
  expect_s3_class(rush, "nflverse_data")

  expect_gt(nrow(pass), 600)
  expect_gt(nrow(rush), 5000)
})

test_that("load_snap_counts", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_error(load_snap_counts("2020"))

  counts <- load_snap_counts(2020)

  expect_s3_class(counts, "nflverse_data")
  expect_gt(nrow(counts), 20000)
})

test_that("load_contracts", {

  skip_on_cran()
  skip_if_offline("github.com")

  contracts <- load_contracts()

  expect_s3_class(contracts, "nflverse_data")
  expect_gt(nrow(contracts), 20000)
})

test_that("load_players", {

  skip_on_cran()
  skip_if_offline("github.com")

  players <- load_players()

  expect_s3_class(players, "nflverse_data")
  expect_gt(nrow(players), 5000)
})

test_that("load_officials", {

  skip_on_cran()
  skip_if_offline("github.com")

  officials <- load_officials()

  expect_s3_class(officials, "nflverse_data")
  expect_gt(nrow(officials), 10000)
})

test_that("load_ftn_charting", {

  skip_on_cran()
  skip_if_offline("github.com")

  ftn_charting <- load_ftn_charting(2022)

  expect_s3_class(ftn_charting, "nflverse_data")
  expect_gt(nrow(ftn_charting), 40000)
})


## NEW LOAD FUNCTIONS GO ABOVE THIS LINE ##

test_that("nflverse_data print method works", {

  skip_on_cran()
  skip_if_offline("github.com")

  contracts <- load_contracts()

  expect_output(
    expect_message(
      print(contracts),
      regexp = "nflverse Historical Contract Data from OverTheCap.com|Data updated")
  )

})

test_that("Cache clearing works",{

  skip_on_cran()
  skip_if_offline("github.com")

  csv_from_url("https://github.com/nflverse/nflverse-data/releases/download/draft_picks/draft_picks.csv")

  expect(memoise::has_cache(csv_from_url)("https://github.com/nflverse/nflverse-data/releases/download/draft_picks/draft_picks.csv"), "Function was not memoised!")

  expect_message(.clear_cache(), "nflreadr function cache cleared!")

  expect(!memoise::has_cache(csv_from_url)("https://github.com/nflverse/nflverse-data/releases/download/draft_picks/draft_picks.csv"), "Cache was not cleared!")
})

test_that("nflverse_game_id works", {

  # test single value input
  expect_equal(nflverse_game_id(2022, 2, "LAC", "KC"), "2022_02_LAC_KC")

  # test vector input
  expect_equal(
    nflverse_game_id(rep(2022, 2), c(2,13), c("LAC", "LAC"), c("KC", "LV")),
    c("2022_02_LAC_KC", "2022_13_LAC_LV")
  )

  # allow old names (SD) and clean team abbreviations (LAR -> LA)
  expect_equal(
    nflverse_game_id(rep(2022, 2), c(2,13), c("SD", "LAC"), c("KC", "LAR")),
    c("2022_02_SD_KC", "2022_13_LAC_LA")
  )

  # error on season outside range
  expect_error(
    nflverse_game_id(1998, 2, "LAC", "KC"), "must be between 1999"
  )

  # error on week outside range
  expect_error(
    nflverse_game_id(2022, 30, "LAC", "KC"), "must be between 1 and"
  )

  # error on away team
  expect_error(
    nflverse_game_id(2022, 2, rep("LACC",2), "KC"), "invalid `away` abbreviation"
  )

  # error on home team
  expect_error(
    nflverse_game_id(2022, 2, "LAC", rep("KKC", 2)), "invalid `home` abbreviation"
  )

  # warn on non smart input
  expect_warning(
    nflverse_game_id(2022, 2, rep("LAC", 2), rep("KC", 3)),
    "Arguments should be of of length one or of length"
  )

})

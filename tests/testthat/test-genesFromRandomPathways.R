test_that("getGenesFromRandomPathways is working with 'kegH'", {
  data(kegH)
  set.seed(12345)

  a1 <- suppressMessages(genesFromRandomPathways(kegH, 3, 50))

  expect_length(a1, 2)
  expect_named(a1, c("genes", "selectedPathways"))
  expect_length(a1[["genes"]], 50)
})

test_that("getGenesFromRandomPathways is working with 'kegM'", {
  data(kegM)
  set.seed(12345)

  a1 <- suppressMessages(genesFromRandomPathways(kegM, 3, 50))

  expect_length(a1, 2)
  expect_named(a1, c("genes", "selectedPathways"))
  expect_length(a1[["genes"]], 50)
})

test_that("getGenesFromRandomPathways is working with 'reaH'", {
  data(reaH)
  set.seed(12345)

  a1 <- suppressMessages(genesFromRandomPathways(reaH, 5, 100))

  expect_length(a1, 2)
  expect_named(a1, c("genes", "selectedPathways"))
  expect_length(a1[["genes"]], 100)
})

test_that("getGenesFromRandomPathways is working with 'reaM'", {
  data(reaM)
  set.seed(12345)

  a1 <- suppressMessages(genesFromRandomPathways(reaM, 5, 100))

  expect_length(a1, 2)
  expect_named(a1, c("genes", "selectedPathways"))
  expect_length(a1[["genes"]], 100)
})

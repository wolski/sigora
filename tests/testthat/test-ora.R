test_that("is working with 'kegH'", {
  data(kegH)
  set.seed(12345)
  a1_kegH <- suppressMessages(genesFromRandomPathways(kegH, 3, 50))

  oraRes_kegH <- ora(a1_kegH[["genes"]], kegH)

  expect_equal(dim(oraRes_kegH), c(62, 6))
  expect_snapshot(oraRes_kegH)
})

test_that("is working with 'kegM'", {
  data(kegM)
  set.seed(12345)
  a1_kegM <- suppressMessages(genesFromRandomPathways(kegM, 3, 50))

  oraRes_kegM <- ora(a1_kegM[["genes"]], kegM)

  expect_equal(dim(oraRes_kegM), c(36, 6))
  expect_snapshot(oraRes_kegM)
})

test_that("is working with 'reaH'", {
  data(reaH)
  set.seed(12345)
  a1_reaH <- suppressMessages(genesFromRandomPathways(reaH, 5, 100))

  oraRes_reaH <- ora(a1_reaH[["genes"]], reaH)

  expect_equal(dim(oraRes_reaH), c(135, 6))
  expect_snapshot(oraRes_reaH)
})

test_that("is working with 'reaM'", {
  data(reaM)
  set.seed(12345)
  a1_reaM <- suppressMessages(genesFromRandomPathways(reaM, 5, 100))

  oraRes_reaM <- ora(a1_reaM[["genes"]], reaM)

  expect_equal(dim(oraRes_reaM), c(145, 6))
  expect_snapshot(oraRes_reaM)
})

test_that("sigora is working with 'kegH'", {
  data(idmap, kegH)

  ils_kegH <- grep(
    "^IL",
    idmap[["Symbol"]],
    value = TRUE
  )

  sigoraRes_kegH <- sigora(
    queryList = ils_kegH,
    GPSrepo = kegH,
    level = 2
  )

  expect_length(sigoraRes_kegH, 2)
  expect_equal(dim(sigoraRes_kegH[["summary_results"]]), c(3, 8))
  expect_equal(dim(sigoraRes_kegH[["detailed_results"]]), c(1761, 4))
  expect_snapshot(sigoraRes_kegH)
})

test_that("sigora is working with 'kegM'", {
  data(idmap, kegM)

  ils_kegM <- grep(
    "^Il",
    idmap[["Symbol"]],
    value = TRUE
  )

  sigoraRes_kegM <- sigora(
    queryList = ils_kegM,
    GPSrepo = kegM,
    level = 2
  )

  expect_length(sigoraRes_kegM, 2)
  expect_equal(dim(sigoraRes_kegM[["summary_results"]]), c(3, 8))
  expect_equal(dim(sigoraRes_kegM[["detailed_results"]]), c(1617, 4))
  expect_snapshot(sigoraRes_kegM)
})

test_that("sigora is working with 'reaH'", {
  data(idmap, reaH)

  ils_reaH <- grep(
    "^IL",
    idmap[["Symbol"]],
    value = TRUE
  )

  sigoraRes_reaH <- sigora(
    queryList = ils_reaH,
    GPSrepo = reaH,
    level = 4
  )

  expect_length(sigoraRes_reaH, 2)
  expect_equal(dim(sigoraRes_reaH[["summary_results"]]), c(24, 8))
  expect_equal(dim(sigoraRes_reaH[["detailed_results"]]), c(669, 4))
  expect_snapshot(sigoraRes_reaH)
})

test_that("sigora is working with 'reaM'", {
  data(idmap, reaM)

  ils_reaM <- grep(
    "^Il",
    idmap[["Symbol"]],
    value = TRUE
  )

  sigoraRes_reaM <- sigora(
    queryList = ils_reaM,
    GPSrepo = reaM,
    level = 4
  )

  expect_length(sigoraRes_reaM, 2)
  expect_equal(dim(sigoraRes_reaM[["summary_results"]]), c(14, 8))
  expect_equal(dim(sigoraRes_reaM[["detailed_results"]]), c(1062, 4))
  expect_snapshot(sigoraRes_reaM)
})

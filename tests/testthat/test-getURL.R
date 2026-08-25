test_that("we get the right URL for 'kegH'", {
  data(kegH)
  set.seed(12345)

  a1_kegH <- genesFromRandomPathways(kegH, 3, 50)

  sigoraRes_kegH <- sigora(
    GPSrepo = kegH,
    queryList = a1_kegH[["genes"]],
    level = 4
  )

  expect_snapshot(getURL(sigoraRes_kegH, 1))
})

test_that("we get the right URL for 'kegM'", {
  data(kegM)
  set.seed(12345)

  a1_kegM <- genesFromRandomPathways(kegM, 3, 50)

  sigoraRes_kegM <- sigora(
    GPSrepo = kegM,
    queryList = a1_kegM[["genes"]],
    level = 4
  )

  expect_snapshot(getURL(sigoraRes_kegM, 1))
})

test_that("we get the right URL for 'reaH'", {
  data(reaH)
  set.seed(12345)

  a1_reaH <- genesFromRandomPathways(reaH, 3, 50)

  sigoraRes_reaH <- sigora(
    GPSrepo = reaH,
    queryList = a1_reaH[["genes"]],
    level = 4
  )

  expect_snapshot(getURL(sigoraRes_reaH, 1))
})

test_that("we get the right URL for 'reaM'", {
  data(reaM)
  set.seed(12345)

  a1_reaM <- genesFromRandomPathways(reaM, 3, 50)

  sigoraRes_reaM <- sigora(
    GPSrepo = reaM,
    queryList = a1_reaM[["genes"]],
    level = 4
  )

  expect_snapshot(getURL(sigoraRes_reaM, 1))
})

test_that("getGenes is working with 'kegH'", {
  data(kegH)
  set.seed(12345)

  a1 <- genesFromRandomPathways(kegH, 3, 50)

  sigoraRes <- sigora(
    GPSrepo = kegH,
    queryList = a1[["genes"]],
    level = 2
  )

  getGenesRes <- getGenes(sigoraRes, 1)

  expect_equal(dim(getGenesRes), c(31, 4))
})

test_that("getGenes is working with 'kegM'", {
  data(kegM)
  set.seed(12345)

  a1 <- genesFromRandomPathways(kegM, 3, 50)

  sigoraRes <- sigora(
    GPSrepo = kegM,
    queryList = a1[["genes"]],
    level = 2
  )

  getGenesRes <- getGenes(sigoraRes, 1)

  expect_equal(dim(getGenesRes), c(25, 4))
})

test_that("getGenes is working with 'reaH'", {
  data(reaH)
  set.seed(12345)

  a1 <- genesFromRandomPathways(reaH, 5, 100)

  sigoraRes <- sigora(
    GPSrepo = reaH,
    queryList = a1[["genes"]],
    level = 4
  )

  getGenesRes <- getGenes(sigoraRes, 1)

  expect_equal(dim(getGenesRes), c(15, 4))
})

test_that("getGenes is working with 'reaM'", {
  data(reaM)
  set.seed(12345)

  a1 <- genesFromRandomPathways(reaM, 5, 100)

  sigoraRes <- sigora(
    GPSrepo = reaM,
    queryList = a1[["genes"]],
    level = 4
  )

  getGenesRes <- getGenes(sigoraRes, 1)

  expect_equal(dim(getGenesRes), c(62, 4))
})

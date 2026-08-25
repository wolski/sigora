test_that("building a GPS works as expected", {
  data(nciTable)

  nciH <- makeGPS(pathwayTable = nciTable, repoName = "NCI")

  expect_snapshot(nciH)
})

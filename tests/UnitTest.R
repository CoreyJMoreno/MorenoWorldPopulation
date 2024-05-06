library(MorenoWorldPopulation)
context('Country Population')

test_that('Simple Case', {
  A <- CountryPopulation('Italy')
  B <- CountryPopulation('Italyyyyy')

  expect_equal(A, NULL)
  expect_equal(B, NULL)

})

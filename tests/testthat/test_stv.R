context("Single Transferable Vote")


replist <- function(arg, times) {
  lapply(seq(times), function(i) arg)
}


votes <- list(
  dex = c("Ice Skating", "Unihoc", "Food"),
  dean = c("Ice Skating", "Unihoc", "Food"),
  paul = c("Whiskey Tasting", "Established"),
  james = c("Ice Skating", "Unihoc", "Food"),
  ken = c("Theatre", "Other Theatre"),
  dean = c("Whiskey Tasting")
)

test_that("STV works for small data", {
  stv_soln <- stv(votes, 2)
  expect_equal(stv_soln$winners, c("Ice Skating", "Whiskey Tasting"))
  stv_soln <- stv(votes, 3)
  expect_equal(stv_soln$winners, c("Ice Skating", "Whiskey Tasting", "Unihoc"))
})

votes <- c(
  replist("Orange",                4),
  replist(c("Pear", "Orange"),     2),
  replist(c("Choc", "Strawberry"), 8),
  replist(c("Choc", "Candy"),      4),
  replist("Strawberry",            1),
  replist("Candy",                 1)
)

test_that("Wikipedia STV example resolves correctly", {
  stv_soln <- stv(votes, 3)
  expect_equal(stv_soln$winners, c("Choc", "Orange", "Strawberry"))
})

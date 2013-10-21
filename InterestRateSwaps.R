 # http://www.r-bloggers.com/pricing-interest-rate-swaps-with-lambda-r/
 # Brian Lee Yung Rowe

IRSwap(notional, terms) %::% a : character : data.frame
IRSwap(notional, terms) %as% IRSwap(notional, read.csv(terms))
 
IRSwap(notional, terms) %::% a : data.frame : data.frame
IRSwap(notional, terms) %when% {
  terms %hasa% period
  terms %hasa% days
  terms %hasa% fwd.1y
} %as% {
  terms@notional <- notional
  terms
}

################################################################################
pv(swap, 'floating') %as%
{
  forward.rate <- swap$fwd.1y * swap$days / 360
  float.rate <- swap@notional * forward.rate
  fn <- function(x) prod(1 + forward.rate[1:x])
  discount.factor <- 1 / sapply(swap$period, fn)
  float.rate * discount.factor
}
 
pv(swap, 'fixed') %as%
{
  forward.rate <- swap$fwd.1y * swap$days / 360
  fn <- function(x) prod(1 + forward.rate[1:x])
  discount.factor <- 1 / sapply(swap$period, fn)
  swap@notional * swap$days / 360 * discount.factor
}
 
rate(swap) %::% IRSwap : numeric
rate(swap) %as% {
  sum(pv(swap, 'floating')) / sum(pv(swap, 'fixed'))
}

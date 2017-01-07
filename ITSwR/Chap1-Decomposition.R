#Section 1.5.5 Decomposition in R

plot(decompose(Elec.ts))
Elec.decom <- decompose(Elec.ts , type=”mult”)
plot(Elec.decom)
Trend <- Elec.decom$trend
Seasonal <- Elec.decom$seasonal
ts.plot(cbind(Trend, Trend * Seasonal),lty=1:2)

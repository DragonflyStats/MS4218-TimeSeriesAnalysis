% http://a-little-book-of-r-for-time-series.readthedocs.org/en/latest/src/timeseries.html

kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)

kingstimeseries <- ts(kings)
kingstimeseries

plot.ts(kingstimeseries)


kingstimeseriesSMA3 <- SMA(kingstimeseries,n=3)
plot.ts(kingstimeseriesSMA3)

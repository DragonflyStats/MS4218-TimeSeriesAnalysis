# 7.4.2 Definition of the ARCH model

# 7.4.4 
set.seed(1)
alpha0<-0.1
alpha1<-0.4
beta1<-0.2

w<-rnorm(10000)
a<-rep(0,10000)
h<-rep(0,10000)

for (i in 2:10000)
{
h[i] <- alpha0 + alpha1 * (a[i-1]^2) + beta1 * (h[i-1])
a[i] <- w[i] * sqrt(h[i])
}

acf(a)
acf(a^2)
################################################################
#7.4.4
library(tseries)
a.garch<-garch(a,grad,="numerical",trace=FALSE)
confint(a.garch)

# 7.4.5 Fit to S&P500 series
# The GARCH model is fitted to the S&P500 returns series.

sp.garch <-garch(SP500,trace=F)
sp.res<-sp.garch$res[-1]
acf(sp.res)
acf(sp.res^2)

7.4.6 Volatility in climate series

stemp <-scan("MASSEY/temp.dat")
stemp.ts <-ts(stemp,start=1850,freq=12)



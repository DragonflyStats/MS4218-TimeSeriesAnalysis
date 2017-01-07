#Chapter 6
#6.6.1 Simulation and fitting

set.seed(1)
x<-arima.set(n=10000, list(ar=-0.6,ma=0.5))
coef(arima(x,order=c(1,0,1)))

#########################################

#6.6.2 Exchange rate series

x.ma<-arima(x.ts,order=c(0,0,1))
x.ar<-arima(x.ts,order=c(1,0,0))
x.arma<-arima(x.ts,order=c(1,0,1))
AIC(x.ma)

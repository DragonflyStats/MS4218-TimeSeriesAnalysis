library(TSA)


data(tempdub)

dev.new(width=8, height=4)
plot(tempdub, ylab="Temperature", main="Temperature in Dubuque")
points(x=as.vector(time(tempdub)), y=as.vector(tempdub),
    pch=as.vector(season(tempdub)), cex=0.8, col=4)

acf(tempdub)


d12temp <- diff(tempdub, lag=12)

plot(d12temp, ylab="Differenced Temperature", main="Differenced Temperature")
acf(d12temp)


tempmod1 <- arima(d12temp, order=c(0,0,12) )
tempmod1
dev.new()
tsdiag(tempmod1)


d12tempsub <- armasubsets(d12temp, nar=14, nma=14)
plot(d12tempsub)

tempmod2 <- arima(tempdub, order=c(0,0,0),
                 seasonal=list(order=c(0,1,1), period=12) )
tempmod2
dev.new()
tsdiag(tempmod2)



###

data(co2)


dev.new(width=8, height=4)
plot(co2, ylab="CO2", main="CO2")
points(x=as.vector(time(co2)), y=as.vector(co2),
    pch=as.vector(season(co2)), cex=0.6, col=4)

d12dco2 <- diff(diff(co2,lag=1),lag=12)

plot(d12dco2, ylab=~(1-B^12)(1-B)*" CO2", 
              main=~(1-B^12)(1-B)*" CO2")

acf(d12dco2, main=~"ACF of "*(1-B^12)(1-B)*" CO2" )


d12dco2sub <- armasubsets(d12dco2, nar=14, nma=14)
plot(d12dco2sub)


co2mod1 <- arima(co2, order=c(0,1,0),
                 seasonal=list(order=c(0,1,1), period=12) )
co2mod1
dev.new()
tsdiag(co2mod1)


co2mod2 <- arima(co2, order=c(0,1,1),
                 seasonal=list(order=c(0,1,1), period=12) )
co2mod2
dev.new()
tsdiag(co2mod2)







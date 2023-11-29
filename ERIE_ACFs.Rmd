
# To select the appropriate ARIMA model, which means finding the values of most appropriate values of p and q for an ARIMA(p,d,q) model. 
#To do this, you usually need to examine the correlogram and partial correlogram of the stationary time series.

install.packages("TSA")
library("TSA")

Erie <- read.csv("https://raw.githubusercontent.com/DragonflyStats/DANGLES/master/daniel.csv",header=FALSE)
#dim(Erie)

X <- ts(Erie, freq = 12, start = c(1921,1))
length(X)

Y <- ts(head(X,-60),freq = 12, start = c(1921,1))
#length(Y)

Y1 <- diff(Y, lag=12, diff=1)


plot(Y1)

## Transform the lags from years to months
acfplot <- acf(Y1,plot=F)

plot(acfplot)

pacfplot <- pacf(Y1,plot=F)

plot(pacfplot)

library(forecast)

?auto.arima

auto.arima(Y1,max.p=10, max.q=10,
     max.P=10, max.Q=10, max.order=10,)

Model <- arima(Y1, order=c(5,1,2))
Model

Acf(residuals(Model))
Box.test(residuals(Model), lag=12, fitdf=4, type="Ljung")

for (i in 1:7){
    Model0 <- arima(Y, order=c(i,1,0  ),seasonal=list(order=c(0,1,1), period=12) )
    Model1 <- arima(Y, order=c(i,1,1  ),seasonal=list(order=c(0,1,1), period=12) )
    Model2 <- arima(Y, order=c(i,1,2  ),seasonal=list(order=c(0,1,1), period=12) )
    cat("\n",i,":",Model0$aic,":",Model1$aic,":",Model2$aic,":")
    }

for (i in 8:15){
    Model0 <- arima(Y, order=c(i,1,0  ),seasonal=list(order=c(0,1,1), period=12) )
    Model1 <- arima(Y, order=c(i,1,1  ),seasonal=list(order=c(0,1,1), period=12) )

    cat("\n",i,":",Model0$aic,":",Model1$aic,":")
    }

Erielevelsubs <- armasubsets(Y, nar=12, nma=12)
plot(Erielevelsubs)


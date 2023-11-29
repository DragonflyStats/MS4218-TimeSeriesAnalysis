
install.packages("TSA")
library("TSA")

Erie <- read.csv("https://raw.githubusercontent.com/DragonflyStats/DANGLES/master/daniel.csv",header=F)
dim(Erie)
head(Erie)
tail(Erie)

X <- ts(Erie, freq = 12, start = c(1921,1))
length(X)

Y <- ts(head(X,-60),freq = 12, start = c(1921,1))
length(Y)

summary(Y)

Y

## Last 10% of Observations
W <- ts(tail(X,60),freq = 12, start = c(1966,1))
length(W)

W

#dev.new(width=6, height=3)
#plot(Y, xlab = "Year", ylab = "erie levels", type = "l")

#plot(Y,ylab="erie levels",type='l', main= "TS in mts")
#points(y=Y,x=time(Y) , pch=as.vector(season(Y)))

dev.new(width=6, height=3)

acf(Y)

tempdecom <- decompose(Y)
plot(tempdecom)


diff(range(Y))
diff(range(tempdecom$trend,na.rm=T))
diff(range(tempdecom$seasonal,na.rm=T))
diff(range(tempdecom$random,na.rm=T))

#Y.transf=BoxCox.ar(y=Y) 

pacf(Y)

Y.transf$ci


plot(X, xlab = "Year", ylab = "Lake Erie", type = "l") 



acf(Y, main = "ACF of Time Series")


Ydecom <- decompose(Y) 

plot(Ydecom, xlab="Year")

diff(range(Ydecom$trend,na.rm=T))

diff(range(Ydecom$seasonal,na.rm=T)) 

diff(range(Ydecom$random,na.rm=T))


Z <- diff(Y, lag=12, diff=1)


plot(Z,ylab="Lake Erie levels",type='l', main= "New time with mnths")

#points(y=Z,x=time(Z), pch=as.vector(season(Z)))


acf(Z, main= "acf")

pacf(Z, main="partial acf")

eacf(Z) 

#### ARMA Subsets

D1 <- armasubsets(Z, nar=10, nma=10)

plot(D1)

#SMA(1) Trio of Tests

D2 <- arima(Z, order=c(0,0,0), seasonal=list(order=c(0,1,1), period=12) )
D2


tsdiag(D2)

adf.test(Y)

dff <- diff(Y,lag=1,diff=1)
adf.test(dff) 

acf(dff)

pacf(dff)

eacf(dff) 

Erielevelsubs <- armasubsets(diff(Y), nar=12, nma=12)

plot(Erielevelsubs)

D3 <- arima(Z, order=c(1,0,0), seasonal=list(order=c(0,1,0), period=12))
D3

tsdiag(D3)

D4 <- arima(Z, order=c(4,0,0), seasonal=list(order=c(0,1,0), period=12))
D4

tsdiag(D4)

D5 <- arima(Z, order=c(7,0,0), seasonal=list(order=c(0,1,0), period=12))
D5

tsdiag(D5)

F1 <- rstandard(D5) 
F1

fitF1 <- fitted(D5)


hist(F1, main="Histogram residuals", xlab="Residuals")

qqnorm(F1, main="Normal Q-Q Plot of Residuals"); 
qqline(F1);
shapiro.test(F1)

Model1 <- arima(x = Y, order = c(4, 1, 1), seasonal=list(order=c(0,1,1), period=12) )
Model1


resids1 <- resid(Model1)
head(resids1,3)

par(mfrow=c(2,1))

hist(resids1, main="Histogram residuals", xlab="Residuals")

qqnorm(resids1, main="Q-Q Plot of Residuals")
qqline(resids1)

par(mfrow=c(1,1))


shapiro.test(resids1)

Model2 <- arima(x = Y, order = c(6, 1, 2), seasonal=list(order=c(0,1,1), period=12) )
Model2

resids2 <- resid(Model2)

par(mfrow=c(2,1))
hist(resids2, main="Histogram of Residuals", xlab="Resid")

qqnorm(resids2, main="Q-Q Plot of Residuals")

qqline(resids2)
par(mfrow=c(1,1))

shapiro.test(resids2)



### Model 3

Model3 <- arima(Y, order=c(12,1,0),seasonal=list(order=c(0,1,1), period=12) )
Model3

resids3 <- resid(Model3)

par(mfrow=c(2,1))
hist(resids3, main="Histogram residuals", xlab="Resid")

qqnorm(resids3, main="Q-Q Plot of Resid")

qqline(resids3)
par(mfrow=c(1,1))




shapiro.test(resids3)

Model4 <- arima(Y, order=c(12,1,2),seasonal=list(order=c(0,1,1), period=12) )
Model4

resids4 <- resid(Model4)

par(mfrow=c(2,1))
hist(resids4, main="Histogram residuals", xlab="Resid")

qqnorm(resids4, main="Q-Q Plot of Resid")

qqline(resids4)
par(mfrow=c(1,1))



shapiro.test(resids4)

Model4 <- arima(Y, order=c(12,1,1),seasonal=list(order=c(0,1,1), period=12) )
Model4

predict(Model4,60)

W - predict(Model4,54)$pred

W

plot(W,type="l",col="blue",ylim=c(10,21))
points(predict(Model4,60)$pred,type="l",col="red")

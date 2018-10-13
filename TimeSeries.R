## Setting directory and loading datsaset and packages
setwd("E:\\")
DouglasF<- read.csv("DouglasFir.csv")
install.packages("TSA")
install.packages("MASS")
install.packages("forecast")
install.packages("ggplot2")
library(forecast)
library(TSA)
library (MASS)
Dougdelete<- read.csv("DouglasFirdeleted.csv")

Correct<- auto.arima(Dnew,trace=TRUE,test="kpss" , ic="aic")
??kpss
#Getting a visual of the data and the decomposition
Dnew<-ts(DouglasF$Douglas, freq=1, start=1194)
plot(Dnew, main="Douglas Fir", xlab="Year", ylab="No. of Trees")
acf(Dnew, main="Douglas Fir")
pacf(Dnew, main="Douglas Fir")

#TESTING LINEAR/QUADRATIC
Dremoved<-ts(Dougdelete$Douglas, freq = 1, start =1194)
plot(Dremoved,  main="Douglas Fir", xlab="Year", ylab="No. of Trees")
ti <- as.vector(time(Dnew))
M1 <- lm(Dnew ~ ti)
M2 <- lm(Dnew ~ ti + I(ti^2))

summary(M1)
summary(M2)

lines(x=ti, y=predict(M1), col=2)
lines(x=ti, y=predict(M2), col=3)
#Plotting residuals
resid1 <- residuals(M1)
resid2 <- residuals(M2)
plot(x=ti, y=resid1, type="o")
plot(x=ti, y=resid2, type="o")

Task 2)##Need to make dataset stationary
#Trend range present
adf.test(Dnew)#RESULT: non-stationary

#Testing BoxCox transformation for log of data: #NOTNEEDED
BC <-BoxCox.ar(Dnew, lambda=seq(-2,2,0.1))
BC$mle
BC$ci


#Testing for log even though boxcox confirms constant variance
dev.new(width=8, height=4)
LogDoug <- log(Dnew)
plot(LogDoug,  main="Log-Doug", xlab="Year", ylab="Log-Doug")


#Checking range of values for each decomposition
D<-decompose(Dnew)
plot(D)
diff(range(Dnew))
diff(range(Dnew$trend, na.rm=T))
diff(range(D$seasonal,na.rm=T))
diff(range(D$random,na.rm=T))

#Testing differencing to remove trend
diffdoug<-diff(Dnew)
plot(diffdoug, main="Differenced Series")
acf(diffdoug, main="Differenced Series")
pacf(diffdoug)
adf.test(diffdoug)# RESULT: STATIONARY
eacf(diffdoug)

res<-residuals(diffdoug)
dev.new(width=8, height=4)
hist(res, main="Temperature Seasonal Effects: Residuals")
qqnorm(res); qqline(res)
shapiro.test(res)

??decompose
at<-decompose(Dnew)
#testing logged and differenced data
difflogdoug<- diff(LogDoug)
plot(difflogdoug,  main="Difference-Log-Wage", 
    xlab="Year", ylab="Difference-Log-Wage")
acf(difflogdoug)
pacf(difflogdoug)
adf.test(difflogdoug)
#RESULT: still stationary

#ORIGINAL MODEL IS THE BEST ONE: CONTINUE
eacf(Dnew)

diffdougsubs <- armasubsets(diffdoug, nar=6, nma=6)
plot(diffdougsubs)

dougsubs <- armasubsets(Dnew, nar=6, nma=6)
plot(dougsubs)

#No differencing required-Time to model fit
arima(x = Dremoved, order=c(1,0,1))
arima(x = Dremoved, order=c(2,0,0))
arima(x = Dremoved, order=c(1,0,3))

#MODEL FIT AND RESIDUAL ANALYSIS
Dmodel <- arima(Dremoved, order=c(1,0,1))
resid <- rstandard(Dmodel)
par(mfrow=c(1,2))
qqnorm(resid)
qqline(resid)
hist(resid, main="Residuals ARIMA(1,0,1)")
shapiro.test(resid)

Dmodel1 <- arima(Dremoved, order=c(2,0,0))
resid1 <- rstandard(Dmodel1)
par(mfrow=c(1,2))
qqnorm(resid1); qqline(resid1);
hist(resid1, main="Residuals ARIMA(2,0,0)")
shapiro.test(resid1)

Dmodel2 <- arima(Dremoved, order=c(1,0,3))
resid2 <- rstandard(Dmodel2)
par(mfrow=c(1,2))
qqnorm(resid2); qqline(resid2);
hist(resid2, main="Residuals")
shapiro.test(resid2)


par(mfrow=c(1,1))
acf(resid)
acf(resid1)
acf(resid2)

fit <- fitted(Dmodel)
plot(as.vector(fit), as.vector(resid))
fit <- fitted(Dmodel1)
plot(as.vector(fit), as.vector(resid1))
fit <- fitted(Dmodel2)
plot(as.vector(fit), as.vector(resid2))

plot(resid)
plot(resid1)
plot(resid2)

LB.test(Dmodel, lag=5)
LB.test(Dmodel, lag=10)
LB.test(Dmodel, lag=15)

LB.test(Dmodel1, lag=5)
LB.test(Dmodel1, lag=10)
LB.test(Dmodel1, lag=15)

LB.test(Dmodel2, lag=5)
LB.test(Dmodel2, lag=10)
LB.test(Dmodel2, lag=15)

(runs(resid))
(runs(resid1))
(runs(resid2))

tsdiag(Dmodel)
tsdiag(Dmodel1)
tsdiag(Dmodel2)

AIC(Dmodel)
AIC(Dmodel1)
AIC(Dmodel2)
BIC(Dmodel)
BIC(Dmodel1)
BIC(Dmodel2)

#PREDICTING FUTURE VALUES
arima(x = Dnew, order=c(1,0,3))
Dmodel2 <- arima(x = Dremoved, order=c(1,0,3))
preseries<-predict(Dmodel2, n.ahead=77)

plot(Dnew, xlim=c(1194,1964), ylim=c(0,350),col="blue")
par (new = TRUE)
plot(Dremoved, xlim=c(1194,1964), ylim=c(0,350),ylab = "") 
lines(preseries$pred,col="red")
lines(preseries$pred+2*preseries$se,col="red",lty=3)
lines(preseries$pred-2*preseries$se,col="red",lty=3)

lines(Dnew, col="blue", ylim=c(0,5))
plot(Dmodel2)
predict(D)

predict(Dmodel2, n.ahead=77)
plot(Dmodel2,n.ahead=77, ylab=c("Number of Trees"))
predict(Dmodel, n.ahead=77)
plot(Dmodel,n.ahead=77)

#OVERFITTING MODEL
DDD<-arima(x = Dnew, order=c(2,0,4))
DDD
AIC(DDD)
BIC(DDD)


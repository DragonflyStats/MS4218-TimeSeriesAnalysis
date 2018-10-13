
install.packages("TSA")
library("TSA")

Erie <- read.csv("daniel.csv",header=FALSE)
dim(Erie)
head(Erie)
tail(Erie)

#FullData
X <- ts(Erie, freq = 12, start = c(1921,1))
length(X)

# First 90% of the Data
Y <- ts(head(X,-60),freq = 12, start = c(1921,1))
length(Y)

## Last 10% of Observations
W <- ts(tail(X,60),freq = 12, start = c(1966,1))
length(W)

##############################################

# Part 2


dev.new(width=6, height=3)
plot(Y, xlab = "Year", ylab = "erie levels", type = "l")

dev.new(width=6, height=3)
plot(Y,ylab="Erie levels",type='l', main= "TS in mts")
points(y=Y,x=time(Y) , pch=as.vector(season(Y)))

##############################################

# Part 3 White Noise

acf(Y)

pacf(Y)

##############################################

# Part 4 Decomposition

tempdecom <- decompose(Y)
dev.new(width=6, height=3)
plot(tempdecom)

diff(range(Y))
diff(range(tempdecom$trend,na.rm=T))
diff(range(tempdecom$seasonal,na.rm=T))
diff(range(tempdecom$random,na.rm=T))

##############################################

# Part 5 Differencing

Y1 <- diff(Y, lag=12, diff=1)

dev.new(width=6, height=3)
plot(Y1,ylab="Lake Erie levels",type='l', main= "New time with mnths")
points(y=Y1,x=time(Y1), pch=as.vector(season(Y1)))

dev.new(width=6, height=3)
acf(Y1, main= "acf")

dev.new(width=6, height=3)
pacf(Y1, main="partial acf")

##############################################

# Part 6 Detecting Stationarity


adf.test(Y)

Y1 <- diff(Y, lag=12, diff=1)

adf.test(Y1)

Y1 <- diff(Y, lag=12, diff=2)

adf.test(Y2)


##############################################

# Part 7 Extended Sample ACF

eacf(Y1) 

eacf(Y1,ar.max=15,ma.max=15)


Erielevelsubs <- armasubsets(Y1, nar=12, nma=12)
plot(Erielevelsubs)
dev.new(width=6, height=3)

##############################################

# Fitting Models

Model1 <- arima(x = Y, order = c(4, 1, 1), seasonal=list(order=c(0,1,1), period=12) )
Model1

resids1 <- resid(Model1)
head(resids1,3)
shapiro.test(resids1)

dev.new(width=6, height=3)
hist(resids1, main="Histogram residuals", xlab="Residuals")

dev.new(width=6, height=3)
qqnorm(resids1, main="Q-Q Plot of Residuals")
qqline(resids1)



Model2 <- arima(x = Y, order = c(6, 1, 2), seasonal=list(order=c(0,1,1), period=12) )
Model2

resids2 <- resid(Model2)
shapiro.test(resids2)

dev.new(width=6, height=3)
hist(resids2, main="Histogram of Residuals", xlab="Residuals")

dev.new(width=6, height=3)
qqnorm(resids2, main="Q-Q Plot of Residuals")
qqline(resids2)



Model3 <- arima(Y, order=c(12,1,0),seasonal=list(order=c(0,1,1), period=12) )
Model3

resids3 <- resid(Model3)
shapiro.test(resids3)

dev.new(width=6, height=3)
hist(resids3, main="Histogram of Residuals", xlab="Residuals")

dev.new(width=6, height=3)
qqnorm(resids3, main="Q-Q Plot of Residuals")
qqline(resids3)




Model4 <- arima(Y, order=c(12,1,2),seasonal=list(order=c(0,1,1), period=12) )
Model4

resids4 <- resid(Model4)
shapiro.test(resids4)

dev.new(width=6, height=3)
hist(resids4, main="Histogram of Residuals", xlab="Residuals")

dev.new(width=6, height=3)
qqnorm(resids4, main="Q-Q Plot of Residuals")
qqline(resids4)

##############################################

# Making Predictions


predict(Model4,60)
W - predict(Model4,60)

plot(W,type="l",col="blue",ylim=c(10,21))
points(predict(Model4,60)$pred,type="l",col="red")





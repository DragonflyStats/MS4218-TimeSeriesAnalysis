library(TSA)

##### Q1 #####

data(color)

## b
 
colormod <- arima(color, order=c(1,0,0))

pred <- predict(colormod, n.ahead=2)
pred
pred$pred - 1.96*pred$se
pred$pred + 1.96*pred$se

## c

dev.new(width=8, height=4)
plot(colormod, n.ahead=20)

abline(h=coef(colormod)[2], col=2)

# We can see that the predictions converge to the process mean.



##### Q5 #####

data(robot)

## a

robotarma11 <- arima(robot, order=c(1,0,1))
predict(robotarma11, n.ahead=5)

## b

robotima11 <- arima(robot, order=c(0,1,1))
predict(robotima11, n.ahead=5)

## c

# The forecasts and standard errors are numerically quite close.
# This is not surprising since we previously found both models to be
# reasonable based on the residuals.

plot(robotarma11, n.ahead=5)


plot(robotarma11, n.ahead=5, n1=300) # note that n1=300 starts the plot at
                                     # time t=300 so that we can see the 
                                     # forecasts

plot(robotima11, n.ahead=5, n1=300)



##### Q6 #####

data(oil.price)


## a

oilima <- arima(log(oil.price), order=c(0,1,1))
oilima

## b

predict(oilima, n.ahead=10)

plot(oilima, n.ahead=10)

plot(oilima, n.ahead=10, n1=2000)

## c

exp(predict(oilima, n.ahead=10)$pred)

plot(oilima, n.ahead=10, transform=exp) # transform=exp means that the
                                        # exponential function is applied to
                                        # undo the log transformation

plot(oilima, n.ahead=10, n1=2000, transform=exp)

# We can clearly see that the prediction limits are getting wider with time.
# This arises since the series is non-stationary, i.e., we cannot be too
# certain as to what the series will do next.



##### Q7 #####

data(hare)

## a

BoxCox.ar(hare)$ci
# this supports lambda = 0.5, i.e., a square-root transformation

harear3 <- arima(sqrt(hare), order=c(3,0,0))
harear3

## b

dev.new()
tsdiag(harear3)

# This seems to be support the assumption that the residual series is
# white noise, i.e., no significant autocorrelations and the
# Ljung-Box p-values are well above 0.05

# The timeplot of the residuals looks relatively good apart from possible
# increased variation later in time. However, there are no obvious patterns
# or trends.

residar3 <- rstandard(harear3)
fitar3 <- fitted(harear3)

dev.new(width=8, height=4)
hist(residar3)
qqnorm(residar3); qqline(residar3);
shapiro.test(residar3)
# There seems to be evidence against the assumption that residuals
# are normally distributed.

plot(as.vector(fitar3), as.vector(residar3))
# no obvious patterns in the residual versus fitted

## c
plot(harear3, n.ahead=30, transform=function(x){x^2} )





##### Q8 #####

data(tempdub)

## a
tempmod2 <- arima(tempdub, order=c(0,0,0),
                 seasonal=list(order=c(0,1,1), period=12) )
tempmod2


## b
plot(tempmod2, n.ahead=36)

# Highly regular pattern with very tight prediction limits.



##### Q3 #####

data(airpass)

## a

plot(airpass)
points(x=as.vector(time(airpass)), y=as.vector(airpass),
    pch=as.vector(season(airpass)), cex=0.6, col=4)

# There is regular seasonal pattern. Also there is overall trend. The number
# of passengers is increasing. The variance seems to be increasing with
# the level of the series.

## b

# The log transform can stabilise the variance.

## c

d12dair <- diff(diff(log(airpass)), lag=12)

acf(d12dair)

# There is significant lag 1 and lag 12 autocorrelation which could be
# handled by a combination of MA(1) and SMA(1) terms.

## d
airmod <- arima(log(airpass), order=c(0,1,1),
                 seasonal=list(order=c(0,1,1), period=12) )
airmod

dev.new()
tsdiag(airmod)

# The residuals appear to be white noise.

resid <- rstandard(airmod)
fit <- fitted(airmod)

dev.new(width=8, height=4)
hist(resid)
qqnorm(resid); qqline(resid);
shapiro.test(resid)
# The residuals are normally distributed.

plot(as.vector(fit), as.vector(resid))
# 

## e
plot(airmod, n.ahead=24, transform=exp )


plot(airmod, n1=1970, n.ahead=24, transform=exp )



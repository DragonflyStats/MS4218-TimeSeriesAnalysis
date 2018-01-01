
# Time Series Analysis

# Air Passengers Data Set

data(AirPassengers)

help(AirPassengers)


AP.ts  <- AirPassengers

class(AP.ts)

mode(AP.ts)

str(AP.ts)


start(AP.ts) 

end(AP.ts) 

frequency(AP.ts)

plot(AP.ts, ylab = "Air Passengers (\'000s)",lwd=2)

### We are going to aggregate over the years, and extract the cycles
AP.year.ts  <- aggregate(AP.ts)

# cycle gives the positions in the cycle of each observation.
AP.cycle.ts <- cycle(AP.ts)


### We are going to stack the two plots together
layout(1:2)
plot(AP.year.ts)
boxplot(AP.ts ~ AP.cycle.ts)


############################################################## Section 1.4.1 [ page 7 ]

Layout(1:2)
plot(aggregate(AP))
boxplot(AP ~ cycle(AP))
#############################################################
#Section 1.4.5 Global Temperature Series

www <- “http://www.massey.ac.nz/~pacowper/ts/global.dat”
Global <-scan(www)
Global.ts <- ts(Global,st=c(1856,1),end=c(2006,12),fr =12)
Global.annual <-aggregate(Global.ts, FUN = mean)
plot(Global.ts)
plot(Global.annual)

#############################################################
New.series <- window(Global.ts, start=c(1970,1), end=c(2005,12))
New.time <- time(New.series)
plot(New.series)
abline(reg=lm(New.series ~ New.time))

# Section 1.5.5 Decomposition in R

plot(decompose(Elec.ts))
Elec.decom <- decompose(Elec.ts , type=”mult”)
plot(Elec.decom)
Trend <- Elec.decom$trend
Seasonal <- Elec.decom$seasonal
ts.plot(cbind(Trend, Trend * Seasonal),lty=1:2)


#############################################################

# Section 3.3.2. Building Approvals Publication

www <- “http://www.massey.ac.nz/~pacowper/ts/ApprovActiv.dat”
Built.dat <- read.table(www, header = T)
App.ts <-ts(Approvals, start = c(1996,1),freq = 4)
Act.ts <-ts(Activity, start = c(1996,1),freq = 4)
ts.plot(App.ts, Act.ts,lty=c(1,3))




acf(ts.union(App.ts,Act.ts))






Section 3.3.4 Example : Bass Curves

T79<- 1:10
Tdelt <- (1:100)/10
Sales <- c(840,1470,2110,4000,7590,10950,10530,94707790,5890)
Cusales <- cumsum(Sales)

summary(Bass.nls)





Section 4.2.3 Simulation in R

set.seed(1)
w <- rnorm(100)
plot (w,type=”l”)
Section 4.2.4 Simulation in R

set.seed(2)
acf(rnorm(100))

Section 4.4.2 Exchange Rate Series ( Holts Winter )

Z.hw <- HoltWinters(Z.ts, alpha = 1, gamma = 0)
acf(resid(Z.hw))

4.7 Summary of R commands

set.seed  Sets a seed for the random number generator enabling a simulation to be reproduced
rnorm simulates a Gaussian white noise series
diff creates a series of first order differences
ar gets the best fitting AR(p) model
pacf extracts partial autocorrelations and partial correlograms
polyroot extracts the root of a polynomial
resid extracts the residuals from a fitted time series

Chapter 5
5.2.3
set.seed(1)
z<-w<-rnorm(100,sd=20)
for (t in 2:100) z[t] <- 0.8*z[t-1]+ w[t]
Time <-1:100
x<-50 +3*Time +z
plot(x,xlab ="time",type="l")

5.4.1 GLS fit to simulated series

library(nlme)
x.gls <-gls(x~Time,cor=corAR1(0.8))
coef(x.gls)

5.4.2 Confidence itnerval for the trend in the temperature series

temp.gls <-gls(temp~time(temp,cor=corAR1(0.7))
confint(temp.gls)

5.5.3

new.dat <- data.frame(Time=new.t,Seas=rep(1:12,2))
predict(temp.lm,new.dat)[1:24]

5.6.1 Simulation

set.seed(1)
TIME <- 1:(10*12)
w<-rnorm(10*12,sd = 0.5)
Trend <- 0.1 + 0.005*TIME + 0.001*TIME^2
Seasonal <- sin(2*pi*TIME/12) + 0.2*sin(2*pi*2*TIME/12) 
+ 0.1*sin(2*pi*4*TIME/12) + 0.1*cos(2*pi*4*TIME/12) 
x <-Trend + Seasonal + w
plot(x,type ="l")



Chapter 6
6.6.1 Simulation and fitting
set.seed(1)
x<-arima.set(n=10000, list(ar=-0.6,ma=0.5))
coef(arima(x,order=c(1,0,1)))


6.6.2 Exchange rate series

x.ma<-arima(x.ts,order=c(0,0,1))
x.ar<-arima(x.ts,order=c(1,0,0))
x.arma<-arima(x.ts,order=c(1,0,1))
AIC(x.ma)

7.4.2 Definition of the ARCH model

7.4.4 
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

7.4.4
library(tseries)
a.garch<-garch(a,grad,="numerical",trace=FALSE)
confint(a.garch)

7.4.5 Fit to S&P500 series
The GARCH model is fitted to the S&P500 returns series.

sp.garch <-garch(SP500,trace=F)
sp.res<-sp.garch$res[-1]
acf(sp.res)
acf(sp.res^2)

7.4.6 Volatility in climate series

stemp <-scan("MASSEY/temp.dat")
stemp.ts <-ts(stemp,start=1850,freq=12)


9.5.1  Nyquist frequency
t<-(0:10)/5
tc<-(0:2000)/1000
x<-sin(2*pi*t)
xc<-sin(2*pi*tc)
xa<-sin(-4*2*pi*tc)
plot(t,x)
lines(tx,xc)
lines(tc,xa,lty ="dashed")

9.6.1 Wavetank data
www <-scan("MASSEY/wave.dat")
wavetank.dat <-read.table(www,header= T)
attach(wavetank.dat)
layout(1:3)
plot(as.ts(wave.ht))
acf(waveht)
spectrum(acf)

9.6.2
www <-scan("MASSEY/imotor.dat")
imotor.dat <-read.table(www,header= T)
attach(imotor.dat)
xg.spec <-spectrum(good, span = 9)
xb.spec <-spectrum(broken, span = 9)
freqg <- 400*xg.spec$freq[4400:5600]
freqb <- 400*xb.spec$freq[4400:5600]
plot(freqg,10**log10(xg.spec$spec[4400:5600]),main=" ",
     xlab ="Frequency(Hz)",ylab = "Current spectrum (dB)", type="l")
lines(freqb, 10**log10(xg.spec$spec[4400:5600]), lty ="dashed")
sd(good)
sd(broken)


Southern Oscillation Index
(a) time plot 
(b) spectrum
(c) spectrum for low frequencies

www <-scan("MASSEY/soi.dat")
soi.dat <-read.table(www,header= T)
attach(soi.dat)
soi.ts<-ts(SOI,st=c(1986,1), end=c(2006,11,fr=12)
layout(1:3)
plot(soi.ts)
soi.spec <-spectrum(SOI,span=sqrt(2*length(SOI)) )
plot(soi.spec$freq[1:60],soi.spec$spec[1:60],type="l")

9.6.4
Pacific Decadal Oscillation (PDO) Index

www <-scan("MASSEY/pdo.dat")
pdo.dat <-read.table(www,header= T)
attach(pdo.dat)
pdo.ts<-ts(PDO,st=c(1900,1), end=c(2007,11,fr=12)
layout(1:2)
plot(pdo.ts)
spectrum(PDO,span=sqrt(2*length(PDO)) )
































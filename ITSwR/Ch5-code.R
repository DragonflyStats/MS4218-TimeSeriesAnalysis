#############################################################
#5.2.3
set.seed(1)
z<-w<-rnorm(100,sd=20)
for (t in 2:100) z[t] <- 0.8*z[t-1]+ w[t]
Time <-1:100
x<-50 +3*Time +z
plot(x,xlab ="time",type="l")

#############################################################
#5.4.1 GLS fit to simulated series

library(nlme)
x.gls <-gls(x~Time,cor=corAR1(0.8))
coef(x.gls)

#5.4.2 Confidence itnerval for the trend in the temperature series

temp.gls <-gls(temp~time(temp,cor=corAR1(0.7))
confint(temp.gls)
#############################################################
#5.5.3

new.dat <- data.frame(Time=new.t,Seas=rep(1:12,2))
predict(temp.lm,new.dat)[1:24]
#############################################################
#5.6.1 Simulation

set.seed(1)
TIME <- 1:(10*12)
w<-rnorm(10*12,sd = 0.5)
Trend <- 0.1 + 0.005*TIME + 0.001*TIME^2
Seasonal <- sin(2*pi*TIME/12) + 0.2*sin(2*pi*2*TIME/12) 
+ 0.1*sin(2*pi*4*TIME/12) + 0.1*cos(2*pi*4*TIME/12) 
x <-Trend + Seasonal + w
plot(x,type ="l")
#############################################################

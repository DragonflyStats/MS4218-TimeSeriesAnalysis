############################################################################################
#9.5.1  Nyquist frequency
t<-(0:10)/5
tc<-(0:2000)/1000
x<-sin(2*pi*t)
xc<-sin(2*pi*tc)
xa<-sin(-4*2*pi*tc)
plot(t,x)
lines(tx,xc)
lines(tc,xa,lty ="dashed")
############################################################################################
#9.6.1 Wavetank data
www <-scan("MASSEY/wave.dat")
wavetank.dat <-read.table(www,header= T)
attach(wavetank.dat)
layout(1:3)
plot(as.ts(wave.ht))
acf(waveht)
spectrum(acf)

############################################################################################
#9.6.2
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


#Southern Oscillation Index
#(a) time plot 
#(b) spectrum
#(c) spectrum for low frequencies

www <-scan("MASSEY/soi.dat")
soi.dat <-read.table(www,header= T)
attach(soi.dat)
soi.ts<-ts(SOI,st=c(1986,1), end=c(2006,11,fr=12)
layout(1:3)
plot(soi.ts)
soi.spec <-spectrum(SOI,span=sqrt(2*length(SOI)) )
plot(soi.spec$freq[1:60],soi.spec$spec[1:60],type="l")
############################################################################################
#9.6.4
#Pacific Decadal Oscillation (PDO) Index

www <-scan("MASSEY/pdo.dat")
pdo.dat <-read.table(www,header= T)
attach(pdo.dat)
pdo.ts<-ts(PDO,st=c(1900,1), end=c(2007,11,fr=12)
layout(1:2)
plot(pdo.ts)
spectrum(PDO,span=sqrt(2*length(PDO)) )
############################################################################################


#setwd("L:/MS4218/Week1")

setwd("F:/MS4218/Week1")



##############################Chapter1##########################

#############################################

#Exercise 1.1 
#Use software to produce the time series plots 
#shown in Exhibits (1.1) and (1.2).

#The following R code will produce the graphs.

library(TSA)

data(larain) 
win.graph(width=3,height=3,pointsize=8)
# this is the box into which the plot will be placed
plot(larain,ylab="Inches",xlab="Year",type="o")

win.graph(width=4.875, height=2.5,pointsize=8)
plot(y=larain,x=zlag(larain),ylab='Inches',xlab='Previous Year Inches')

#When you use the plot function, a plot appears.
#When the plot function is called again, the first plot disappears.
#win.graph() allows you to view all created plots simulaneously.
#The function dev.new() does the same thing.

############################################

#Exercise 1.2 
Produce the time series plot displayed in Exhibits (1.3) and (1.4). 

data(color)
win.graph(width=3,height=3,pointsize=8)

plot(color,ylab='Color Property',xlab='Batch',type='o')

plot(y=color,x=zlag(color),
xlab="Previous Batch Color Property",
ylab="Color Property")

############################################

#Exercise 1.3 
#Simulate a completely random process of length 48 with 
#independent, normal values. 
#Repeat this exercise several times with a new simulation, that is, 
#a new seed, each time.

win.graph(width=3,height=3,pointsize=8)
plot(ts(rnorm(n=48)),type='o')

win.graph(width=3,height=3,pointsize=8)
plot(ts(rnorm(n=48)),type='o') 

#If you repeat this command R will use new "random numbers" each time. 
#If you want to reproduce the same simulation first use the
#command set.seed(x) where x is an integer of your choice.

set.seed(123)
win.graph(width=3,height=3,pointsize=8)
plot(ts(rnorm(n=48)),type='o') 
set.seed(123)
win.graph(width=3,height=3,pointsize=8)
plot(ts(rnorm(n=48)),type='o') 


###########################################

#Exercise 1.4 
#Simulate a completely random process of length 48 with 
#independent, chi-square distributed values each with 2 degrees of freedom. 
#Use the same R code as in the solution of Exercise 1.3 but 
#replace rnorm(n=48)with rchisq(n=48,df=2).

win.graph(width=3,height=3,pointsize=8)
plot(ts(rchisq(n=48,df=2)),type='o')

########################################### 

#Exercise 1.5 
#Simulate a completely random process of length 48 with 
#independent, t-distributed values each with 5 degrees of freedom. 
#Construct the time series plot. 
#Use the same R code as in the solution of Exercise 1.3 but
#replace rnorm(n=48) with rt(n=48,df=5).

win.graph(width=3,height=3,pointsize=8)
plot(ts(rt(n=48,df=5)),type='o') 

###########################################

#Exercise 1.6 
#Construct a time series plot with monthly plotting symbols 
#for the Dubuque temperature series as in Exhibit (1.7).
#(Make the plot full screen so that you can see all of detail.)

data(tempdub)
win.graph(width=30,height=20,pointsize=8)
plot(tempdub,ylab='Temperature')
points(y=tempdub,x=time(tempdub), pch=as.vector(season(tempdub)))

###########################################

#Exercise 1.7

setwd("L:/MS4218/Week1"")
BPdata<-read.csv("BP.csv",header=T)
class(BPdata)
head(BPdata)
BPdata<-ts(BPdata[,2],start=c(2003,1),end=c(2013,1),frequency=52)
class(BPdata)
plot(BPdata)

###########################################






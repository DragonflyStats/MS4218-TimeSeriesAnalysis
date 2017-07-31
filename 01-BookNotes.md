
Time Series Analysis 





Section 2 Correlation

3.5 Summary of important functions

Section 4 Basic Stochastic Models

Section 5 Regression

Section 6 Stationarity



Datasets (massey.ac.nz)

-----------------------



wine.dat        #Australian wines

global.dat

CBE.dat         #chocolate,Beer and electricity

Herald.dat      #Carbon dioixde emissions at Herald Square, Manhattan.

-------------------------------------------------------------


Section 1


1.1 Purpose of Time Series Data


1.2 Time series


1.3 The R language


R can be insalled free of charge from www.r-project.org


An online guide "An Introduction to R" can  be access by typing

help.start() at the command prompt to access this.


R is case sensitive.

A convention is to use define a variable name with a capital letter.

This reduces the chance of overwriting inbuild R functions, which are

usually written in lowercase letters.



Functions in R can be treated as "objects" that can be manipulated or

used recursively.


R shares many aspects with both Object orietnated and Functional

programming langguages.


all data in R is stored an objects, which have a range of "methods" available.

The "class" of an object can be found using the class() function.

1.4 Plots Trends and Seasonal Variation

dataset: Air Passengers

#########################

data(AirPassengers)

AP<-Air.Passengers

AP




######################################

plot(decompose(Elec.ts))

Elec.decom <- decompose(Elec.ts, type = "mult")

plot(Elec.decom)

Trend<-Elec.decom$trend

Seasonal<-Elec.decom$seasonal

ts.plot(cbind(Trend,Trend*Seasonal),lty =1:2)

-------------------------------------------------------------


Section 2 Correlation

Correllelograms


2.2.2 The ensemble and stationarity

The mean function of a time series model is a function of $t$.

(t) =E(xt)


2.2.3 ergodic series


2.2.5 Summary of useful function


cor

cov


-------------------------------------------------------------

Section 3 Forecasting strategies


3.3 The Bass Model






 f(t) density

 F(t)cumulative distribution function

 h(t) hazard function


3.4 Exponential Smoothing and Holt-Winters

3.4.1. Exponential smoothing


3.5 Summary of important functions

 nls()

 predict()

 coef()

 ts.union() union of two time series analysis


The CCf


################################

ccf

-------------------------------------------------------------

Section 4 Basic Stochastic Models

4.3 Random Walks



xt=xt-1+wt


The backward shift operator


B.xt=xt-1


The differenceoperator

-------------------------------------------------------------

Section 5 Regression


-------------------------------------------------------------

Section 6 Stationarity


-------------------------------------------------------------

Section 7


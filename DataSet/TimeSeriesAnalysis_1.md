TimeSeriesAnalysis_1
========================================================
author: 
date: 
autosize: true

First Slide
========================================================



```r
library(TSA)
```



`larain`
========================================================

larain: Annual rainfall in Los Angeles / time series

#### Description
Annual precipitation (in inches) in Los Angeles, 1878-1992.



```r
data(larain)
```



LA Rain Data Set
========================================================


```r
head(larain)
```

```
[1] 20.86 17.41 18.65  5.53 10.74 14.14
```


```r
summary(larain)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.080   9.675  14.140  14.888  18.400  40.290 
```


```r
class(larain)
```

```
[1] "ts"
```

Time Plot
========================================================

The first analytical step is to create a time plot by plotting the
observations over time.


```r
win.graph(width=4.875, height=2.5,pointsize=8)
plot(larain,ylab="Inches",xlab="Year",type="o")
```

![plot of chunk unnamed-chunk-6](TimeSeriesAnalysis_1-figure/unnamed-chunk-6-1.png)

Slide With Plot
========================================================
Scatter plot of LA annual rainfall v Last year's rainfall



```r
plot(y=larain,x=zlag(larain),ylab="Inches",
xlab="Previous Year Inches")
```

![plot of chunk unnamed-chunk-7](TimeSeriesAnalysis_1-figure/unnamed-chunk-7-1.png)
Scatter plot of LA annual rainfall v Last year's rainfall

```
processing file: TimeSeriesAnalysis_1.Rpres

Attaching package: 'TSA'

The following objects are masked from 'package:stats':

    acf, arima

The following object is masked from 'package:utils':

    tar

output file: TimeSeriesAnalysis_1.md

Warning message:
package 'TSA' was built under R version 4.0.5
```

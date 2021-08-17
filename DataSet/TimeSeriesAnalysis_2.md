TimeSeriesAnalysis_2
========================================================
author: 
date: 
autosize: true

First Slide
========================================================



```r
library(TSA)
```


```r
data(tempdub)
```

Slide
========================================================



```r
plot(tempdub,xlab="Time",ylab="Temperature",type="o")
```

![plot of chunk unnamed-chunk-3](TimeSeriesAnalysis_2-figure/unnamed-chunk-3-1.png)


Seasonality on show here. All January months are cold, and all
July months are hot. Models for such series must
accommodate this variation while keeping the similarities.

Slide
========================================================

```r
data(oilfilters)
plot(oilfilters,xlab="Time",ylab="Sales",type="o")
```

![plot of chunk unnamed-chunk-4](TimeSeriesAnalysis_2-figure/unnamed-chunk-4-1.png)
Seasonality is again on show here.


Display plotting symbols
========================================

```r
plot(oilfilters,type="l",ylab="Sales")
points(y=oilfilters,x=time(oilfilters),
pch=as.vector(season(oilfilters)))
```

![plot of chunk unnamed-chunk-5](TimeSeriesAnalysis_2-figure/unnamed-chunk-5-1.png)

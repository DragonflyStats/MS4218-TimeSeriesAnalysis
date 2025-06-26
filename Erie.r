In time series analysis, the **Erie dataset** typically refers to historical water level measurements from **Lake Erie**, one of North America's Great Lakes. This dataset is often used in environmental and hydrological studies to model and forecast lake behavior over time.

One example is a dataset covering **Lake Erie water levels from 1921 to 1970**, which has been used to demonstrate forecasting techniques such as **SARIMA (Seasonal Autoregressive Integrated Moving Average)** and **Holt-Winters exponential smoothing**. These models help analyze seasonal patterns, long-term trends, and irregular fluctuations in lake levels.

Researchers use this kind of data to:
- Understand seasonal and long-term changes in water levels
- Forecast future lake behavior for environmental planning
- Demonstrate time series modeling techniques in academic settings

--------------------------

```{r}
install.packages("TSA")
library("TSA")
```

Erie <- read.csv("https://raw.githubusercontent.com/DragonflyStats/DANGLES/master/daniel.csv")
dim(Erie)



--------------------------------------------


```{r}
X <- ts(Erie, freq = 12, start = c(1921,1))
length(X)

Y <- ts(head(X,-54),freq = 12, start = c(1921,1))
length(Y)


plot(log(Y))

Y1 <- diff(Y, lag=12, diff=1)


plot(Y1)
```

## **Tutorial: Exploring the LA Rainfall Time Series in R**

This tutorial is hands-on walk-throough of exploring and visualizing a real-world time series dataset—*Los Angeles annual rainfall from 1878 to 1992*. 


### **Step 1: Load the Dataset**

```r
library(TSA)
data(larain)
```

The dataset `larain` is a univariate time series of annual rainfall (in inches) for Los Angeles.

---

### **Step 2: Understand the Structure**

Inspect the data using basic functions:

```r
head(larain)
summary(larain)
class(larain)
```

This shows the dataset is of class `"ts"` (time series) and spans 115 years with rainfall values ranging roughly from 4 to 40 inches.

---

### **Step 3: Plot the Time Series**

Visual inspection is crucial in time series analysis:

```r
win.graph(width=4.875, height=2.5, pointsize=8)
plot(larain, ylab="Inches", xlab="Year", type="o", main="LA Annual Rainfall")
```

This reveals the variability in precipitation over time and might hint at long-term trends or anomalies (like drought years or outliers).

---

### **Step 4: Lagged Scatter Plot**

To explore autocorrelation or year-to-year dependence, use a lagged scatter plot:

```r
plot(y = larain, x = zlag(larain), ylab = "Rainfall (inches)", xlab = "Previous Year's Rainfall",
     main = "Lag Scatter Plot")
```

This helps identify whether rainfall in a given year correlates with the previous year’s rainfall—a subtle but useful insight when considering autoregressive models.

---

### **Output Notes**

Some warnings during rendering (e.g., about the package build version) are non-fatal and often safe to ignore unless functionality is impaired.

---

### Other Topics
- Stationarity testing (ADF, KPSS)
- Fitting ARIMA models
- Forecasting future rainfall

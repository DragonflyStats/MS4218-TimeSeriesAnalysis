Time Series Analysis
===========================
#### Time Series 
A time series is a sequence of observations which are ordered in time (or space). If observations are made on some phenomenon throughout time, it is most sensible to display the data in the order in which they arose, particularly since successive observations will probably be dependent. Time series are best displayed in a scatter plot. The series value X is plotted on the vertical axis and time t on the horizontal axis. Time is called the independent variable (in this case however, something over which you have little control). There are two kinds of time series data: 
Continuous:  where we have an observation at every instant of time, e.g. lie detectors, electrocardiograms. We denote this using observation X at time t, X(t). 
Discrete: where we have an observation at (usually regularly) spaced intervals. We denote this as Xt. 

Examples 
-	Economics - weekly share prices, monthly profits 
-	Meteorology - daily rainfall, wind speed, temperature 
-	Sociology - crime figures (number of arrests, etc), employment figure

#### Trend Component 
We want to increase our understanding of a time series by picking out its main features. One of these main features is the trend component. Descriptive techniques may be extended to forecast (predict) future values.
Trend is a long term movement in a time series. It is the underlying direction (an upward or downward tendency) and rate of change in a time series, when allowance has been made for the other components.
A simple way of detecting trend in seasonal data is to take averages over a certain period. If these averages change with time we can say that there is evidence of a trend in the series. There are also more formal tests to enable detection of trend in time series.
It can be helpful to model trend using straight lines, polynomials etc.

#### Cyclical Component 
We want to increase our understanding of a time series by picking out its main features. One of these main features is the cyclical component. Descriptive techniques may be extended to forecast (predict) future values.
In weekly or monthly data, the cyclical component describes any regular fluctuations.
It is a non-seasonal component which varies in a recognisable cycle.


#### Seasonal Component 
We want to increase our understanding of a time series by picking out its main features. One of these main features is the seasonal component. Descriptive techniques may be extended to forecast (predict) future values.
In weekly or monthly data, the seasonal component, often referred to as seasonality, is the component of variation in a time series which is dependent on the time of year. It describes any regular fluctuations with a period of less than one year. For example, the costs of various types of fruits and vegetables, unemployment figures and average daily rainfall, all show marked seasonal variation.
We are interested in comparing the seasonal effects within the years, from year to year; removing seasonal effects so that the time series is easier to cope with; and, also interested in adjusting a series for seasonal effects using various models.

#### Irregular Component 
We want to increase our understanding of a time series by picking out its main features. One of these main features is the irregular component (or 'noise'). Descriptive techniques may be extended to forecast (predict) future values.
The irregular component is that left over when the other components of the series (trend, seasonal and cyclical) have been accounted for.

#### Smoothing 
Smoothing techniques are used to reduce irregularities (random fluctuations) in time series data. They provide a clearer view of the true underlying behaviour of the series.
In some time series, seasonal variation is so strong it obscures any trends or cycles which are very important for the understanding of the process being observed. Smoothing can remove seasonality and makes long term fluctuations in the series stand out more clearly.
The most common type of smoothing technique is moving average smoothing although others do exist. Since the type of seasonality will vary from series to series, so must the type of smoothing.

#### Exponential Smoothing 
Exponential smoothing is a smoothing technique used to reduce irregularities (random fluctuations) in time series data, thus providing a clearer view of the true underlying behaviour of the series. It also provides an effective means of predicting future values of the time series (forecasting). 

#### Moving Average Smoothing 
A moving average is a form of average which has been adjusted to allow for seasonal or cyclical components of a time series. Moving average smoothing is a smoothing technique used to make the long term trends of a time series clearer.
When a variable, like the number of unemployed, or the cost of strawberries, is graphed against time, there are likely to be considerable seasonal or cyclical components in the variation. These may make it difficult to see the underlying trend. These components can be eliminated by taking a suitable moving average.
By reducing random fluctuations, moving average smoothing makes long term trends clearer.

#### Running Medians Smoothing 
Running medians smoothing is a smoothing technique analogous to that used for moving averages. The purpose of the technique is the same, to make a trend clearer by reducing the effects of other fluctuations.

####  Differencing 
Differencing is a popular and effective method of removing trend from a time series. This provides a clearer view of the true underlying behaviour of the series.

#### Autocorrelation 
Autocorrelation is the correlation (relationship) between members of a time series of observations, such as weekly share prices or interest rates, and the same values at a fixed time interval later.
More technically, autocorrelation occurs when residual error terms from observations of the same variable at different times are correlated (related).
#### Extrapolation 
Extrapolation is when the value of a variable is estimated at times which have not yet been observed. This estimate may be reasonably reliable for short times into the future, but for longer times, the estimate is liable to become less accurate.

**Example** 
Suppose Angela was 1.20m tall on January 1st 1975, and 1.40m tall on January 1st 1976. By extrapolation, it could be estimated that by January 1st 1977 she would have grown another 0.20m to be 1.60m tall. This however assumes that she continued to grow at the same rate. This must eventually become a false assumption, otherwise by January 1st 1980, she would be a giantess.

<strong>Time Series Analysis</strong>

A time series is a collection of observations of well-defined data items obtained through repeated measurements over time.

Examples of time series are the daily closing value of the Dow Jones Industrial Average and the annual flow volume of the Nile River at Aswan. Time series are very frequently plotted via line charts.
<ul>
	<li>EWMA Models</li>
	<li>Holt-Winters Equations</li>
</ul>
<span style="text-decoration: underline;"><strong>Notes and Online Resources</strong></span>
<ul>
	<li><a title="Time Series Analysis : The Basics" href="http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Time+Series+Analysis:+The+Basics" target="_blank">Time Series Analysis: The Basics</a></li>
	<li>Introduction to Time Series Analysis (Australian Bureau of Statistics) - <a title="ABS -TSA" href="http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Time+Series+Analysis:+The+Basics" target="_blank">Here</a></li>
	<li>Time Series and Forecasting (Book Chapter)  - <a title="http://highered.mcgraw-hill.com/sites/dl/free/0070951640/354829/lind51640_ch16.pdf" href="Time Series and Forecasting" target="_blank">Here</a></li>
	<li>Time Series Analysis - Lecture Notes - <a title="Time Series Analysis" href="http://www.public.iastate.edu/~alicia/stat328/Time%20Series.pdf" target="_blank">Here</a></li>
</ul>
<span style="text-decoration: underline;"><strong>Applications of Time Series</strong></span>

Time series are used in statistics, signal processing, pattern recognition, econometrics, mathematical finance, weather forecasting, earthquake prediction, electroencephalography, control engineering, astronomy, and communications engineering.

Time series analysis comprises methods for analyzing time series data in order to extract meaningful statistics and other characteristics of the data. Time series forecasting is the use of a model to predict future values based on previously observed values. While regression analysis is often employed in such a way as to test theories that the current values of one or more independent time series affect the current value of another time series, this type of analysis of time series is not called "time series analysis", which focuses on comparing values of time series at different points in time.
Time series data have a natural temporal ordering. This makes time series analysis distinct from other common data analysis problems, in which there is no natural ordering of the observations (e.g. explaining people's wages by reference to their respective education levels, where the individuals' data could be entered in any order). Time series analysis is also distinct from spatial data analysis where the observations typically relate to geographical locations (e.g. accounting for house prices by the location as well as the intrinsic characteristics of the houses).

<span style="line-height: 1.714285714; font-size: 1rem;">A stochastic model for a time series will generally reflect the fact that observations close together in time will be more closely related than observations further apart. In addition, time series models will often make use of the natural one-way ordering of time so that values for a given period will be expressed as deriving in some way from past values, rather than from future values (see time reversibility.)</span>

Time series analysis can be applied to real-valued, continuous data, discrete numeric data, or discrete symbolic data (i.e. sequences of characters, such as letters and words in the English language.).

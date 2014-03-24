# http://cran.r-project.org/web/packages/PerformanceAnalytics/vignettes/PA-charts.pdf
install.packages("PerformanceAnalytics")
    # Select Mirror etc
library(PerformanceAnalytics)


data(edhec)
charts.PerformanceSummary(edhec[,c(1,13)])


##############################################################

charts.PerformanceSummary(managers[,c(manager.col,indexes.cols)], colorset=rich6)

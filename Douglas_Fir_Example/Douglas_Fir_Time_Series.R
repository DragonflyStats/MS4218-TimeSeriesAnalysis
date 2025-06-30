#----------------------------#
#  LOAD DATASETS             #
#----------------------------#
DouglasF <- read.csv("DouglasFir.csv")
Dougdelete <- read.csv("DouglasFirdeleted.csv")

#----------------------------#
#  INSTALL & LOAD PACKAGES   #
#----------------------------#
required_pkgs <- c("TSA", "MASS", "forecast", "ggplot2")
lapply(required_pkgs, function(pkg) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg)
  library(pkg, character.only = TRUE)
})

#----------------------------#
#  DEFINE TIME SERIES OBJECT #
#----------------------------#
Dnew <- ts(DouglasF$Douglas, freq = 1, start = 1194)

#----------------------------#
#  VISUALIZE RAW SERIES      #
#----------------------------#
plot(Dnew, main = "Douglas Fir", xlab = "Year", ylab = "No. of Trees")
acf(Dnew, main = "ACF: Douglas Fir")
pacf(Dnew, main = "PACF: Douglas Fir")

#----------------------------#
#  TESTING LINEAR & QUADRATIC MODELS #
#----------------------------#
Dremoved <- ts(Dougdelete$Douglas, freq = 1, start = 1194)
plot(Dremoved, main = "Douglas Fir (Cleaned)", xlab = "Year", ylab = "No. of Trees")

ti <- as.vector(time(Dnew))
M1 <- lm(Dnew ~ ti)                 # Linear trend
M2 <- lm(Dnew ~ ti + I(ti^2))       # Quadratic trend

summary(M1)
summary(M2)

lines(x = ti, y = predict(M1), col = 2)
lines(x = ti, y = predict(M2), col = 3)

#----------------------------#
#  RESIDUAL ANALYSIS OF TRENDS #
#----------------------------#
resid1 <- residuals(M1)
resid2 <- residuals(M2)
plot(ti, resid1, type = "o", main

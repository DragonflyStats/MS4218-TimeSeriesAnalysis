
install.packages("TSA")
library("TSA")

Erie <- read.csv("https://raw.githubusercontent.com/DragonflyStats/DANGLES/master/daniel.csv",header=FALSE)
#dim(Erie)

X <- ts(Erie, freq = 12, start = c(1921,1))
length(X)

Y <- ts(head(X,-60),freq = 12, start = c(1921,1))
#length(Y)



########################################

# Differencing

# Detecting Stationarity


adf.test(Y)




Y1 <- diff(Y, lag=12, diff=1)

adf.test(Y1)




Y2 <- diff(Y, lag=12, diff=2)

adf.test(Y2)

eacf(Y1)

eacf(Y1,ar.max=15,ma.max=15)


Erielevelsubs <- armasubsets(Y1, nar=12, nma=12)
plot(Erielevelsubs)
dev.new(width=6, height=3)

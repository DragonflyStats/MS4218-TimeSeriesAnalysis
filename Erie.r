
install.packages("TSA")
library("TSA")

Erie <- read.csv("https://raw.githubusercontent.com/DragonflyStats/DANGLES/master/daniel.csv")
dim(Erie)

X <- ts(Erie, freq = 12, start = c(1921,1))
length(X)

Y <- ts(head(X,-54),freq = 12, start = c(1921,1))
length(Y)


plot(log(Y))

Y1 <- diff(Y, lag=12, diff=1)


plot(Y1)

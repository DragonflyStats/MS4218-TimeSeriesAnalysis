
library(ggplot2);
library(gridExtra);
library(reshape2);

ensure.installed <- function(package){
    if (!package %in% installed.packages()) install.packages(package)
}

###
### Worksheet Exercise 4.1
###

source('setup_data.R', echo = TRUE);

AP.ts.acf <- acf(AP.ts, plot = FALSE);

str(AP.ts.acf);


###
### Worksheet Exercise 4.2
###

source('setup_data.R', echo = TRUE);

AP.ts.acf <- acf(AP.ts, plot = FALSE);


calc.autocor <- function(x, lag) {
    N <- length(x);

    idx1 <- 1:(N-lag);
    idx2 <- (lag+1):N;

    cor(AP.ts[idx1], AP.ts[idx2]);
}





### Adding 1 to the index of the acf as acf[1] is the lag at 0 (i.e. it has value 1)
lag <- 1;
AP.ts.acf$acf[lag+1]
calc.autocor(AP.ts, lag);


lag <- 3;
AP.ts.acf$acf[lag+1]
calc.autocor(AP.ts, lag);


lag <- 12;
AP.ts.acf$acf[lag+1]
calc.autocor(AP.ts, lag);

###
### Worksheet Exercise 4.3
###

source('setup_data.R', echo = TRUE);

AP.ts.acf <- acf(AP.ts, plot = FALSE);

plot(AP.ts.acf, ylim = c(-1, 1));


###
### Worksheet Exercise 4.4
###

source('setup_data.R', echo = TRUE);

AP.ts.acf <- acf(AP.ts, plot = FALSE);

AP.ts.decomp        <- decompose(AP.ts);
AP.ts.decomp.random <- AP.ts.decomp$random[!is.na(AP.ts.decomp$random)]

AP.ts.decomp.random.acf <- acf(AP.ts.decomp.random, plot = FALSE);

layout(1:2);
plot(AP.ts.acf,               ylim = c(-1, 1));
plot(AP.ts.decomp.random.acf, ylim = c(-1, 1))


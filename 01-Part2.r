
library(ggplot2);
library(gridExtra);
library(reshape2);

ensure.installed <- function(package){
    if (!package %in% installed.packages()) install.packages(package)
}


###
### Worksheet Exercise 1.1
###

source('setup_data.R', echo = TRUE);


class(AP.ts);

str(AP.ts);

start(AP.ts); end(AP.ts); frequency(AP.ts);

plot(AP.ts, ylab = "Air Passengers (\'000s)");


### Using ggplot2 looks better, but you have to work hard for the
### labels on the x-axis so I am leaving this out for now.

#qplot(1:length(AP.ts), as.vector(AP.ts), geom = 'line', ylab = 'Air Passengers (\'000s)');

###
### Worksheet Exercise 2.1
###



head(CBE.df);

tail(CBE.df);

str(CBE.df);


###
### Worksheet Exercise 2.2
###




beer.ts <- ts(CBE.df$beer, start = 1958, freq = 12);
choc.ts <- ts(CBE.df$choc, start = 1958, freq = 12);
elec.ts <- ts(CBE.df$elec, start = 1958, freq = 12);

plot(cbind(beer.ts, choc.ts, elec.ts));


###
### Worksheet Exercise 2.3
###

source('setup_data.R', echo = TRUE);

elec.ts    <- ts(CBE.df$elec, start = 1958, freq = 12);
AP.elec.ts <- ts.intersect(AP.ts, elec.ts);

head(AP.elec.ts); tail(AP.elec.ts);

str(AP.elec.ts);

plot(AP.elec.ts);



### Create a plot in ggplot2
#qplot(Var1, value, data = melt(AP.elec.ts), geom = 'line', colour = Var2);


###
### Worksheet Exercise 2.4
###

source('setup_data.R', echo = TRUE);

elec.ts     <- ts(CBE.df$elec, start = 1958, freq = 12);
AP.elec.ts  <- ts.intersect(AP.ts, elec.ts);


AP.elec.cor <- cor(AP.elec.ts);

str(AP.elec.cor);

### Show the scaled plot
qplot(Var1, value, data = melt(scale(AP.elec.ts)), geom = 'line', colour = Var2);


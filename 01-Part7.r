
###
### Worksheet Exercise 7.1
###

source('setup_data.R', echo = TRUE);

set.seed(42);

arma11.ts <- arima.sim(list(order = c(1, 0, 1), ar = -0.6, ma = 0.5), n = 1000)

arma11.ts.pacf <- pacf(arma11.ts);


layout(1:2);
plot(arma11.ts);
plot(arma11.ts.pacf);


###
### Worksheet Exercise 7.2
###

source('setup_data.R', echo = TRUE);

set.seed(42);

arma11.fit <- arima(arma11.ts, order = c(1, 0, 1));

print(arma11.fit);


###
### Worksheet Exercise 7.1
###

source('setup_data.R', echo = TRUE);

set.seed(42);

arma22.ts <- arima.sim(list(order = c(2, 0, 2), ar = c(0.2, -0.5), ma = c(-0.1, 0.3)), n = 1000)

arma22.ts.pacf <- pacf(arma11.ts);


layout(1:2);
plot(arma22.ts);
plot(arma22.ts.pacf);


arma22.fit <- arima(arma22.ts, order = c(2, 0, 2));
print(arma22.fit);





1.5 Decomposition of series

1.5.2 Simple Additive Model


* $m_t$ is the trend

* $s_t$ is the seasonal effect

* $z_t$ is the error Term

simple multiplicative model






1.5.5. Decomposition in R

decompose() function

* $x_t$
* $m_t$
* $s_t$
* $z_t$



#### Simple Additive Decomposition Model
 $$ x_t = m_t + s_t +z_t $$


#### Multiplicative Model
 $$ x_t = m_t \times s_t +z_t  $$


If the random variation is modelleed by a multiplicative factor, and the variable is positive, an additive decomposition for $log(x_t)$
could be used
 $$  log(x_t) = m_t \times s_t +z_t  $$
This form tends to introduce a bias on the predictions, so care must be taken.

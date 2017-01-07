Measurements of the annual flow of the river Nile at Ashwan 1871–1970.
Water flow as indication into weather climate 

### Summary of Nile:
```{r}
summary (Nile)
```

Summary of the difference in the river flow:
```{r}
summary(diff(Nile)
``` 

Plot of Nile with red line as the mean
```{r}
plot(Nile,xlab="Years",ylab="River Flow")
abline(h=mean(Nile),col="red")
```

library(TSA)

dev.new(width=8, height=4)
data(larain)
plot(larain,ylab='Inches',xlab='Year',type='o')

zlag(larain,d=1)
dev.new(width=7, height=7)
plot(y=larain,x=zlag(larain,d=1),ylab='Inches',
xlab='Previous Year Inches')
cor(y=larain,x=zlag(larain,d=1), use="pairwise")

dev.new(width=8, height=4)
data(color)
plot(color,ylab='Color Property',xlab='Batch',type='o')

zlag(color,d=1)
dev.new(width=7, height=7)
plot(y=color,x=zlag(color,d=1),ylab='Color Property',
xlab='Previous Batch Color Property')
cor(y=color,x=zlag(color,d=1), use="pairwise")

dev.new(width=8, height=4)
data(hare)
plot(hare,ylab='Abundance',xlab='Year',type='o')

zlag(hare,d=1)
dev.new(width=7, height=7)
plot(y=hare,x=zlag(hare,d=1),ylab='Abundance',
xlab='Previous Year Abundance')
cor(y=hare,x=zlag(hare,d=1), use="pairwise")

dev.new(width=7, height=7)
plot(y=hare,x=zlag(hare,d=2),ylab='Abundance',
xlab='Abundance Two Year\'s Ago')
cor(y=color,x=zlag(color,d=2), use="pairwise")

dev.new(width=8, height=4)
data(tempdub)
plot(tempdub,ylab='Temperature',type='o')

dev.new(width=8, height=4)
plot(tempdub,ylab='Temperature',type='l')
points(y=tempdub,x=time(tempdub),
pch=as.vector(season(tempdub)), col=4, cex=0.8 )

aggregate(tempdub~season(tempdub), data=tempdub, mean)

dev.new(width=7, height=7)
boxplot(tempdub~season(tempdub), ylab="Temperature")


dev.new(width=7, height=7)
plot(y=tempdub,x=zlag(tempdub,d=1),ylab='Temperature',
xlab='Previous Month Temperature')
cor(y=tempdub,x=zlag(tempdub,d=1), use="pairwise")



dev.new(width=8, height=4)
data(oilfilters)
plot(oilfilters,ylab='Sales',type='o')

dev.new(width=8, height=4)
plot(oilfilters,ylab='Sales',type='l')
points(y=oilfilters,x=time(oilfilters),
pch=as.vector(season(oilfilters)), col=4, cex=0.8 )

aggregate(oilfilters~season(oilfilters), data=oilfilters, mean)

dev.new(width=7, height=7)
boxplot(oilfilters~season(oilfilters), ylab="Sales")



dev.new(width=7, height=7)
plot(y=oilfilters,x=zlag(oilfilters,d=1),ylab='Sales',
xlab='Previous Month Sales')
cor(y=oilfilters,x=zlag(oilfilters,d=1), use="pairwise")


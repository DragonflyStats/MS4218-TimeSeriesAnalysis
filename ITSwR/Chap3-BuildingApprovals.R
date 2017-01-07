# Section 3.3.2. Building Approvals Publication

www <- “http://www.massey.ac.nz/~pacowper/ts/ApprovActiv.dat”
Built.dat <- read.table(www, header = T)
App.ts <-ts(Approvals, start = c(1996,1),freq = 4)
Act.ts <-ts(Activity, start = c(1996,1),freq = 4)
ts.plot(App.ts, Act.ts,lty=c(1,3))




acf(ts.union(App.ts,Act.ts))




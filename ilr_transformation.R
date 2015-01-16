#load required library
library(compositions)
#read data  sample XRD data
xrd<-read.csv("~/Dropbox/AfSIS_reporting_data/Seperated_datasets/AfSIS_xrd.csv")
xrd.a<-xrd[837:890,]
setwd("")
write.table(xrd.a,file="compositional data.csv",sep=",",row.names=FALSE)
#create compositional data prior to taking ilr  
xrd.ac<-acomp(xrd.a[,-1])#Remove  the first column containing sample id

#then take ilr transformation
xrd.ilr<- ilr (xrd.ac)
#add column with sample ids
xrd.ilrs<-as.data.frame(cbind(as.vector(xrd.a[,1]),xrd.ilr))

plot(xrd.ilrs[,3:4])
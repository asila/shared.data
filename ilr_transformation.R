#load required library
library(compositions)
#setwd where compositional data is
#setwd("~/Dropbox/compositional.data")

#read data  sample XRD data
xrd<-read.csv("~compositional data.csv")

#create compositional data prior to taking ilr  
xrd.ac<-acomp(xrd.a[,-1])#Remove  the first column containing sample id

#then take ilr transformation
xrd.ilr<- ilr (xrd.ac)
#add column with sample ids
xrd.ilrs<-as.data.frame(cbind(as.vector(xrd.a[,1]),xrd.ilr))

#xrd.ilrs is the ilr transformed and can be used for other type of analysis. However the authors of compositions library cautions:
#"the interpretation of the results may be difficult, since there is no one-to-one relation between the original parts and the transformed variables" 
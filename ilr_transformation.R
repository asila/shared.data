#1:This is a small R-script to read compositional data for isometric log-ratio transformation.
#2: A csv file with test data is available  in the shared dropbox and will be downloaded automatically
#3: For the script to work correct you will need two packages: compositions and downloader if missing install them first
#4: For assitance contact me at asila@cgiar.org

#load required library
library(compositions)
library(downloader)
#download file from compositional dropbox folder and read it before ilr
download("https://www.dropbox.com/s/qlpjef9q5krbz28/compositional_data.csv?dl=0","compositional_data.csv")
#read data  sample XRD data
xrd<-read.csv("compositional_data.csv")

#create compositional data prior to taking ilr  
xrd.ac<-acomp(xrd.a[,-1])#Remove  the first column containing sample id

#then take ilr transformation
xrd.ilr<- ilr (xrd.ac)
#add column with sample ids
xrd.ilrs<-as.data.frame(cbind(as.vector(xrd.a[,1]),xrd.ilr))

#xrd.ilrs is the ilr transformed and can be used for other type of analysis. However the authors of compositions library cautions:
#"the interpretation of the results may be difficult, since there is no one-to-one relation between the original parts and the transformed variables" 
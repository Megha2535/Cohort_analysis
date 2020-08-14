getwd()
rm(list=ls())
setwd("D:/Coursera")
online.retail<-read.csv("online_retail.csv")
library(dplyr)
library(tidyr)
#----------------------------------------extracting unique values
online.retail2<-unique(online.retail)
online.retail3<-online.retail2[complete.cases(online.retail2),]
#----------------------------------------taking care of formats

write.csv(online.retail3,"D:/Coursera/online_retail3.csv")
online.retail4<-read.csv("D:/Coursera/online_retail4.csv")
#online.retail4$InvoiceDate<- as.Date(online.retail4$InvoiceDate,format="%m/%d/%Y")
#online.retail4$Year<-as.numeric(format(online.retail4$InvoiceDate,'%Y'))
#----------------------------------------making a new dataframe cohorts2011
cohorts2011<-online.retail4[online.retail4$Year==2011,]
cohorts2011<-cohorts2011[,c("CustomerID","InvoiceDate","Year")]
str(cohorts2011)
colnames(cohorts2011)[4]<-"Cohort"
#----------------------------------------

#cohorts2011$Cohort<-ifelse(cohorts2011$Year==2011&cohorts2011$UnitPrice>3&cohorts2011$Quantity>2,"1","0")
cohort<-online.retail4[online.retail4$Year==2011&online.retail4$UnitPrice>3&online.retail4$Quantity>2,]
#----------------------------------------
library(ggplot2)
Quantity<-cohort$Quantity
Frequency<-seq_along(cohort$Quantity)
qplot(Quantity,Frequency)
max(cohort$Quantity,na.rm=TRUE)
min(cohort$Quantity,na.rm=TRUE)
#---------------------------------------
cohort2<-online.retail4[online.retail4$Country!="United Kingdom"&online.retail4$Country!="France"&online.retail4$UnitPrice>3.3&online.retail4$UnitPrice<6.8,]
Country<-cohort2$Country
Frequency1<-seq_along(cohort2$Country)
qplot(Country,Frequency1)


#importo le librerie

list.of.packages <- c("xts", "forecast", "tseries", "ggplot2", "urca", "tsoutliers", "fpp2", "timeSeries", "KFAS", "tidyverse", "glue", "forcats", "timetk", "tidyquant", "tibbletime", "cowplot", "recipes", "rsample", "yardstick", "keras", "dplyr", "skmeans", "tsfknn",'MASS','readr','tibble','dplyr','stringr','mice','caret','ggcorrplot','GGally','DiscriMiner','psych','ggrepel','gridExtra','glmnet','xgboost','ggplot2','gridExtra','fastDummies')
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)



library(tseries)
library(lubridate)
library(xts)
library(forecast)
library(tseries)
library(ggplot2)
library(urca)
library(tsoutliers)
library(fpp2)
library(timeSeries)
library(KFAS)
library(tidyverse)
library(glue)
library(forcats)
library(timetk)
library(tidyquant)
library(tibbletime)
library(cowplot)
library(recipes)
library(rsample)
library(yardstick) 
library(keras)
library(forecast)
library(dplyr)
library(skmeans)
library(MASS)
library(readr)
library(tibble)
library(dplyr)
library(stringr)
library(mice)
library(caret)
library(ggcorrplot)
library(GGally) #Per il ggcorr()
library(DiscriMiner) # Per il correlation ratio
library(psych)
library(ggrepel)
library(gridExtra)
library(glmnet)
library(xgboost)
library(ggplot2)
library(gridExtra)

#importo il dataset
df <- read.csv("/Users/michelegazzola/Desktop/DS Lab/dataset/serie-storiche-ecommerce.csv", sep=";",header=TRUE)


unique(df$data)
unique(df$fatturato)
unique(df$settore)

str(df$data)
today <- Sys.Date()


library(tidyr)
library(dplyr)

df1<-df%>%mutate(data=as.Date(data, "%d/%m/%y"),
                 fatturato=as.numeric(gsub(".", ".", gsub("\\.", "", fatturato))),
                 settore=as.character(settore))%>%
  mutate(fatturato=as.numeric(fatturato),
         data_bis=data)%>% 
  separate(data_bis, into = c("Year", "Month", "Day"))%>%
  mutate(Month = month.abb[as.numeric(Month)])




df2<-df1[order(df1$data),]
min<-min(df2$data)
max<-max(df2$data)



fatturato.ts<-ts(df2$fatturato,start=c(2013,2), end=c(2022,4), frequency=12)
head(fatturato.ts)
plot(fatturato.ts)


#in scala logaritmica
#non sembra costante
log.fatturato.ts <- log(fatturato.ts)
plot.ts(log.fatturato.ts) 



#creo un dataset con dentro le variabili dummy dei vari settori
results <- fastDummies::dummy_cols(df2, select_columns = "settore")
knitr::kable(results)

unique(df1$settore)
colnames(results)

df3<- results%>%filter(settore_Casual==1)
summary(df3)

mean(df3$fatturato)













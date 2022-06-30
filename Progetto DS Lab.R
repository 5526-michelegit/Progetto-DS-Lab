
#importo le librerie

list.of.packages <- c("xts", "forecast", "tseries", "ggplot2", "urca", "tsoutliers", "fpp2", "timeSeries", "KFAS", "tidyverse", "glue", "forcats", "timetk", "tidyquant", "tibbletime", "cowplot", "recipes", "rsample", "yardstick", "keras", "dplyr", "skmeans", "tsfknn",'MASS','readr','tibble','dplyr','stringr','mice','caret','ggcorrplot','GGally','DiscriMiner','psych','ggrepel','gridExtra','glmnet','xgboost','ggplot2','gridExtra')
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
data_path <- "/Users/michelegazzola/Desktop/data science lab/dataset/serie-storiche-ecommerce.csv"
e_commerce <- read.csv(data_path, sep = ';')
head(data.frame(e_commerce))



e_commerce_ts<-e_commerce$data,order.by = e_commerce$data, e_commerce$fatturato, frequency = 7), main = 'fatturato e-commerce')


#FASE DI PULIZIA DEL DATASET E PREPROCESSING

#sistemo gli attributi cambiando i formati
e_commerce<-e_commerce%>%mutate(data=as.Date(data, '%d/%m/%y'),
                                fatturato=as.numeric(fatturato),
                                settore=as.character(settore))%>%mutate(data_sort=arrange(data))



#eseguo un plot per analizzare l'andamento
plot(xts(e_commerce$data,order.by = e_commerce$data, e_commerce$fatturato, frequency = 7), main = 'fatturato e-commerce')
plot.ts(e_commerce)
is.ts(e_commerce)
class(e_commerce$data)


#controllo i missing values
md.pattern(e_commerce, rotate.names=TRUE) #nessun missing value è presente nel dataset

#controllo gli outliers

summary(e_commerce_num)

boxplot(e_commerce$data)
boxplot(e_commerce$fatturato)
#sistemo il fatturato tramite trasformazione logaritmica visto che gli outliers si trovanp tutti sul baffo superiore
boxplot(log10(e_commerce$fatturato)












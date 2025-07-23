getwd()
setwd("C:/Users/abby/OneDrive - Michigan State University/Field Based Work/BGC_results")

library(tidyverse)
library(corrr)
library(ggcorrplot)
library(FactoMineR)
library(factoextra)
library(data.table)

g<-read.csv('gasfield.csv')

g2<-select(g,"pN2O", "Temp", "pH", "Spc", "DO", "DOC", "TN", "DIC", "pCO2", "pCH4")

g3<-na.omit(g2)

g4<-scale(g3)

g_pca <- princomp(g4)
summary(g_pca)

a<-g_pca$loadings[,1:10]

aa<-as.data.table(a)

fviz_eig(g_pca, addlabels = TRUE)

fviz_pca_var(g_pca, col.var = "black")


###

f<-read.csv('cdom_plot.csv')

f$suva<-f$X254/f$doc

f2<-select(f,"X250.350.nm", "X290.350.nm", "X275.295.nm", "X350.400.nm", "sr", "X254", 
           "X250", "X365", "X250.365", "X440", "X350", "n2o", "tn", "cdom", "suva")

f3<-na.omit(f2)

f4<-scale(f3)

f_pca <- princomp(f4)
summary(f_pca)

a<-f_pca$loadings[,1:10]

aa<-as.data.table(a)

fviz_eig(f_pca, addlabels = TRUE)

fviz_pca_var(f_pca, col.var = "black")


###

h<-read.csv('chla_plot.csv')

h2<-select(h,"chla", "pheo", "Chl", "pN2O")

h3<-na.omit(h2)

h4<-scale(h3)

h_pca <- princomp(h4)
summary(h_pca)

a<-h_pca$loadings[,1:10]

aa<-as.data.table(a)

fviz_eig(h_pca, addlabels = TRUE)

fviz_pca_var(h_pca, col.var = "black")


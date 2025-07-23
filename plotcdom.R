getwd()
setwd("C:/Users/abby/OneDrive - Michigan State University/Field Based Work/CDOMChla_processing")
g<-read.csv("cdom_plot.csv")
g$suva<-g$X254/g$doc

library(ggplot2)
library(GGally)

ggplot(data=g, aes(x=n2o, y=X350))+geom_point()


model1 <- lm(n2o ~ X350, data = g)
summary(model1)$r.squared


x11()

ggpairs(g,cardinality_threshold = 25 )

#350-400 .26
#sr .19
#365 .24
#250.365 .21
#440 .31
#350 .25

h<-read.csv("chla_plot.csv")

ggplot(data=h, aes(x=pN2O, y=Chl))+geom_point()
model2 <- lm(pN2O ~ Chl, data = h)
summary(model2)$r.squared

#chla .12

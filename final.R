---
  runtime: shiny
title: ""
author: ""
---
  
  ```{r setup, include=FALSE}
library(flexdashboard)
library(htmltools)
library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(shinyWidgets)
library(leaflet)
library(WDI)
library(bslib)
library(plotly)
library(ggplot2)
library(data.table)
library(leaflet)
library(geojsonio)
library(rstudioapi)
```
library(readxl)
library(corrplot)

FINAL <- read_excel("FINAL.xlsx")
#1
summary(FINAL$Age)

#2
hist(FINAL$Spending_on_food_UAH)

#3
M = cor(FINAL)
corrplot.mixed(M, order = 'AOE')

#4
spending<- FINAL$Spending_on_food_UAH
income<- FINAL$IncomeSelfAssessment

boxplot(spending, income,
        main = "Multiple boxplots",
        col = c("orange","red")
)

#5
 
fif <- FINAL %>% group_by(IncomeSelfAssessment)
mean1 <- fif %>% summarise(median = mean(Spending_on_food_UAH ))

#6

mean2 %>%
  geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
  coord_flip() +
  xlab("") +
  theme_bw()

#7
mean2 <- fif %>% summarise(n = n())

#8

ggplot(mean2, aes(x=IncomeSelfAssessment, y = n)) + 
  geom_bar(stat = "identity")+
  theme_classic()







---
title       : Urban Population Growth
subtitle    : Project presentation
author      : Justin Rice
job         : System Developer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

This presentation is being used used as a part of my analysis of World Bank's Climate Change Data. The analysis is a rather simple one. It allows the user to use sliders to filter the data.
The app can be found here:

https://ricej2.shinyapps.io/UrbanGrowth/

--- .class #id 

## App Layout
The app has a tabular panel which has 2 sub panels. The first sub panel is simply the data as a table. The second panel shows the summary of the Urban Growth according to the current filters.

---

## Data Sample

Here is a sample of what the data looks like:

```r
growthData <- read.csv("../ClimateIndicators.csv")
str(growthData[,2:9])
```

```
## 'data.frame':	238 obs. of  8 variables:
##  $ Country.Name                           : Factor w/ 238 levels "Afghanistan",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ Access.to.electricity....of.population.: num  41 100 99.3 55.8 100 ...
##  $ Agricultural.land....of.land.area.     : num  58.1 43.8 17.4 24.5 42.8 ...
##  $ Forest.area....of.land.area.           : num  2.068 28.321 0.805 90 34.043 ...
##  $ Population.growth..annual...           : num  2.737 -0.496 1.776 -1.055 -1.242 ...
##  $ Urban.population....of.total.          : num  24.7 52.2 67.5 87.6 87.8 ...
##  $ Urban.population.growth..annual...     : num  4.27 1.61 2.82 -1.17 -1.85 ...
##  $ Urban.Growth                           : logi  TRUE TRUE TRUE FALSE FALSE TRUE ...
```


---

## Frequencies

Here we can see that the data is pretty skewed.

```r
table(growthData[,9])
```

```
## 
## FALSE  TRUE 
##    27   211
```

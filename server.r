# Developing Data Products - Population percentage

# server.R file for the shiny app

# This app was developed to help visualize how I have massaged the climate change data that
# was taken from the world bank's data catalog.

library(shiny)
library(dplyr)
library(plyr)
library(datasets)

growthData <- read.csv("ClimateIndicators.csv")
names <- colnames(growthData)


data <- transmute(growthData, Country = Country.Name
                  , ElectricityAccess= growthData[, names[3]]
                  , ArgiculturalLand = growthData[, names[4]]
                  , ForestArea = growthData[, names[5]]
                  , PopulationGrowth = growthData[, names[6]]
                  , UrbanPopulation = growthData[, names[7]]
                  , UrbanPopulationGrowth = growthData[, names[8]]
                  , UrbanGrowthIndicator =  growthData[, names[9]])



shinyServer(function(input, output) {
  
  # Show the cars that correspond to the filters
  output$table <- renderDataTable({
    
    data <- filter(data, ElectricityAccess >= input$elec[1], ElectricityAccess <= input$elec[2]
                   ,ArgiculturalLand >= input$agri[1], ArgiculturalLand <= input$agri[2]
                   ,ForestArea >= input$forest[1], ForestArea <= input$forest[2]
                   ,PopulationGrowth >= input$pop[1], PopulationGrowth <= input$pop[2]
                   ,UrbanPopulation >= input$urbanPop[1], UrbanPopulation <= input$urbanPop[2]
                   ,UrbanPopulationGrowth >= input$UrbanGrowth[1], UrbanPopulationGrowth <= input$UrbanGrowth[2]
                   ,UrbanGrowthIndicator %in% input$Growth ) 
                      
    data
  },  options = list(lengthMenu = c(10, 50, 100), pageLength = 100))
  
  
  output$table2 <- renderDataTable({
    
    data2 <- data
    data2 <- filter(data, ElectricityAccess >= input$elec[1], ElectricityAccess <= input$elec[2]
                   ,ArgiculturalLand >= input$agri[1], ArgiculturalLand <= input$agri[2]
                   ,ForestArea >= input$forest[1], ForestArea <= input$forest[2]
                   ,PopulationGrowth >= input$pop[1], PopulationGrowth <= input$pop[2]
                   ,UrbanPopulation >= input$urbanPop[1], UrbanPopulation <= input$urbanPop[2]
                   ,UrbanPopulationGrowth >= input$UrbanGrowth[1], UrbanPopulationGrowth <= input$UrbanGrowth[2]
                   ,UrbanGrowthIndicator %in% input$Growth
    )
    UrbanPopulationGrowthSummary <- data.frame(ddply(data2, c("UrbanGrowthIndicator"), function(x) summary(x$UrbanPopulationGrowth)))
    UrbanPopulationGrowthSummary
    
  })
})
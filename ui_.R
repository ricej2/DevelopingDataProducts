# Developing Data Products - Population percentage

# ui.R file for the shiny app

# This app was developed to help visualize how I have massaged the climate change data that
# was taken from the world bank's data catalog.

library(markdown)

shinyUI(navbarPage("Explore popuation and land ratios",
                   tabPanel("Table Data",
                            
                            # Sidebar
                              sidebarPanel(
                                helpText("Use the sliders below to filter:"),
                                sliderInput('elec', 'Access to electricity (% of population)', min=0, max=100, value=c(0,100), step=5),
                                sliderInput('agri', 'Agricultural land (% of land area)', min=0, max=100, value=c(20,80), step=5),
                                sliderInput('forest', 'Forest area (% of land area)', min=0, max=100, value=c(0,100), step=5),
                                sliderInput('pop', 'Population growth (annual %)', min=-3, max=11, value=c(-3,11), step=0.5),
                                sliderInput('urbanPop', 'Urban population (% of total)', min=0, max=100, value=c(0,100), step=5),
                                sliderInput('UrbanGrowth', 'Urban population growth (annual %)', min=-3, max=11, value=c(-3,11), step=0.5),
                                checkboxGroupInput('Growth', 'Urban Growth:', c("TRUE"='TRUE', "FALSE"='FALSE'), selected = c(TRUE,FALSE))
                              ),
                              
                              
                            mainPanel(
                              tabsetPanel(
                                # Data 
                                tabPanel(p(icon("table"), "Dataset"),
                                         dataTableOutput('table')
                                ) # end of "Dataset" tab panel
                                
                                
                              )
                              
                            )  
                            
                   ),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.md")
                            )
                   )
)
)  
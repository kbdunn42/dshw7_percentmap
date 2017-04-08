# server.R
library(shiny)
source("helpers.R")
counties <- readRDS("counties.rds")
library(maps)
library(mapproj)
shinyServer( function(input, output) {
    
    output$map <- renderPlot({
      data <- switch(input$var,
       "Percent White" = counties$white,
       "Percent Black" = counties$black,
       "Percent Hispanic" = counties$hispanic,
       "Percent Asian" = counties$asian)
      
      title <- switch(input$var,
         "Percent White" = "Percent White",
         "Percent Black" = "Percent Black",
         "Percent Hispanic" = "Percent Hispanic",
         "Percent Asian" = "Percent Asian")
      
      c <- switch(input$var,
        "Percent White" = "darkgreen",
        "Percent Black" = "darkred",
        "Percent Hispanic" = "darkblue",
        "Percent Asian" = "black")
      
      percent_map(var = data, color = c, legend.title = title, max=input$range[2], min=input$range[1])
    })
      
})
    
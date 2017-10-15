#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
exchange <- rbind.data.frame(euro, euro.cross)
exchange$EUR <- c(1, 1/euro)
row.names(exchange)[1] <- "EUR"
currencies <- list("EUR" = "European Euro",
                   "ATS" = "Austrian Schilling",
                   "DEM" = "German Mark",
                   "ESP" = "Spanish Peseta",
                   "FIM" = "Finnish Markka",
                   "FRF" = "French Franc",
                   "IEP" = "Irish Pound",
                   "ITL" = "Italian Lira",
                   "LUF" = "Luxembourgian Franc",
                   "NLG" = "Dutch Guilder",
                   "PTE" = "Portuguese escudo",
                   "BEF" = "Belgian Franc",
                   "CYP" = "Cypriot Pound",
                   "EEK" = "Estonian Kroon",
                   "GRD" = "Greek Drachma",
                   "SIT" = "Slovenian Tolar")
# Define server logic required to draw a histogram
  shinyServer(
    function(input, output) {
      output$oid1 <- renderPrint({input$variable})
      output$oid2 <- renderPrint({input$variable2})
      output$amount <- reactive({
        curr1 <- names(currencies[currencies %in% input$variable])
        curr2 <- names(currencies[currencies %in% input$variable2])
        input$num*exchange[curr1, curr2]
      })
    }
  )

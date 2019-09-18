library(shiny)
library(ggplot2)
library(quantmod)
library(DT)
library(dplyr)
library(magrittr)

function(input, output, session) {
  nasdaq_names = stockSymbols(exchange = "NASDAQ")
  nyse_names = stockSymbols(exchange = "NYSE")
  amex_names = stockSymbols(exchange = "AMEX")
  df = rbind(nasdaq_names,nyse_names,amex_names)
  
  #Convert all values into millions
  idx = grep("B",df$MarketCap)
  x = df$MarketCap; df$MarketCap = as.numeric(substr(x,2,nchar(x)-1))
  df$MarketCap[idx] = df$MarketCap[idx]*1000 #For the billion cases
  idx = which(df$MarketCap>0)
  df = df[idx,]
  Finance = df %>% filter(Sector=="Finance")
  
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(Finance[, input$show_vars, drop = FALSE])
  })
  
}


library(shiny)
library(ggplot2)
library(quantmod)
library(DT)
library(dplyr)
library(magrittr)

fluidPage(
  title = 'Financial Firms Data',
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.dataset == "Finance"',
        checkboxGroupInput('show_vars', 'Choose data elements:',
                           names(Finance), selected = names(Finance))
      )
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel('Finance', DT::dataTableOutput('mytable1'))
      )
    )
  )
)
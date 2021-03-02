#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinydashboard)

UC_admit <- readr::read_csv("data/UC_admit.csv")

UC_admit$Academic_Yr <- as.factor(UC_admit$Academic_Yr)


ui <- dashboardPage(
    dashboardHeader(title = "UC Campus Admissions by Year and Ethnicity"),
    dashboardSidebar(),
    dashboardBody(
        fluidRow(
            box(title = "Plot Options", width = 3,
                selectInput("x", "Select Campus", choices = c("Davis", "Irvine", "Irvine", "Los_Angeles", "Merced","Berkeley", "Riverside", "San_Diego", "Santa_Barbara", "Santa_Cruz"),
                            selected = "San_Diego"),
                selectInput("z", "Select Admit Category", choices = c("Applicants", "Admits", "Enrollees"),
                            selected = "Applicants"),
                radioButtons("y", "Select Ethnicity", choices = c("International", "Unknown", "White", "Asian", "Chicano/Latino", "American Indian", "African American"),
                             selected = "International")
            ), # close the first box
            box(title = "UC Admissions", width = 7,
                plotOutput("plot", width = "600px", height = "500px")
            ) # close the second box
        ) # close the row
    ) # close the dashboard body
) # close the ui
server <- function(input, output, session) { 
    
    output$plot <- renderPlot({
        UC_admit %>% 
            filter(Campus==input$x & Ethnicity==input$y & Category==input$z) %>% 
            ggplot(aes(x=Academic_Yr, y=FilteredCountFR)) + 
            geom_col(color="black", fill="steelblue", alpha=0.75) +
            theme_light(base_size = 18) +
            theme(axis.text.x = element_text(angle = 60, hjust = 1))+
            labs(x = "Year", y = "Enrollment")
    })
    
    # stop the app when we close it
    session$onSessionEnded(stopApp)
}
shinyApp(ui, server)
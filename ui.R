#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("US Arrest Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            varSelectInput("event","Type of Crime:",USArrests),
            radioButtons("region","Select US Geographic Region",choices=c("West","South","Northeast","Midwest","All"),selected=c("All")),
            sliderInput("binno","Number of Histogram Bins",min=2,max=12,value=6,step=1),
            h2("Instructions:",align="left"),
            h4("Pick the crime you're interested in from the drop-down menu",align="left"),
            h4("Select the region of the United States you're interested in",align="left"),
            h4("For the histogram, drag the slider to select how many bins you'd like",align="left"),
            h4("Crimes are recorded for each of the 50 US States (USArrests package in R)",align="left"),
            h4("The x-axis is given in crimes per 100,000 population.",align="left"),
            h5("Exception being UrbanProp, which isn't really a crime but rather the percentage of population living in urban areas",align="left"),
            h5("I still find this to be an interesting parameter, though.",align="left")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("boxyPlot"),
            plotOutput("histyPlot")
        )
    )
))

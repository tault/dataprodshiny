#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    data("USArrests")
    WestIndex<-c("Alaska","Arizona","California","Colorado","Hawaii","Idaho","Montana","Nevada","New Mexico","Oregon","Utah","Washington","Wyoming")
    SouthIndex<-c("Alabama","Arkansas","Florida","Georgia","Kentucky","Louisiana","Mississippi","North Carolina","Oklahoma","South Carolina","Tennessee","Texas","Virginia","West Virginia")
    NortheastIndex<-c("Connecticut","Delaware","Maine","Maryland","Massachusetts","New Hampshire","New Jersey","New York","Pennsylvania","Rhode Island","Vermont")
    MidwestIndex<-c("Illinois","Indiana","Iowa","Kansas","Michigan","Minnesota","Missouri","Nebraska","North Dakota","Ohio","South Dakota","Wisconsin")
        ArrestsReactive<-eventReactive(c(input$region),{
            if(input$region=="West"){USArrests[rownames(USArrests) %in% WestIndex,]}
            else if(input$region=="South"){USArrests[rownames(USArrests) %in% SouthIndex,]}
            else if(input$region=="Northeast"){USArrests[rownames(USArrests) %in% NortheastIndex,]}
            else if(input$region=="Midwest"){USArrests[rownames(USArrests) %in% MidwestIndex,]}
            else if(input$region=="All"){USArrests}
        })
        
    output$boxyPlot <- renderPlot({
        Arrests<-ArrestsReactive()
        # generate bins based on input$bins from ui.R
        ggplot(Arrests, aes(!!input$event)) + geom_boxplot(fill="magenta")+ggtitle("Boxplot")+labs(x="Number of Crimes per 100,000 people, or percent urban population")
        
    })
    
    output$histyPlot <- renderPlot({
        Arrests<-ArrestsReactive()
        # generate bins based on input$bins from ui.R
        ggplot(Arrests, aes(!!input$event)) + geom_histogram(color="black",fill="green",bins=input$binno)+ggtitle("Histogram")+labs(x="Number of Crimes per 100,000 people, or percent urban population")
        
    })
    
})

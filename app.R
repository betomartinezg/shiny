#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Distribuciónnormal"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sliderInput(inputId = "num", 
                    label = "numero de intervalos",
                    min = 1,
                    max = 100,
                    value = 25,
        
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("hist"), 
            verbatimTextOutput("stats")
        )
    )
)

# Define server logic required to draw a histogram and table
server <- function(input, output) {
    data <- reactive({
        rnorm(input$num)
    })
    output$hist<-renderPlot({
        hist(data(), col = "grey", border = "black",
             main = "Histograma de distribucion normal")
    }) 
    
    output$stats<-renderPrint({
        summary(data())
    })
}   


# Run the application 
shinyApp(ui = ui, server = server)

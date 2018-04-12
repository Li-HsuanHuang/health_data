
library(shiny)
library(DT)
# Define UI for application that plots expected time spent in each state 
#before reaching absorbing block.

ui <- fluidPage(
  
  # Application title
  titlePanel("Expected Time Spent in Each State \n 
             Before Absorption in State N or Prior"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      fileInput(inputId = 'file','Import a csv file'),
      selectInput('choice','Row or column',c('row','column'),selected = 'column'),
      sliderInput('N','Number of first absorbing states:',
                  min = 1,
                  max = 39,
                  value = 1),
      submitButton('Submit'),
      width = 3
    ),
  
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel('Plot',plotOutput('plot')),
        tabPanel('Table',DT::dataTableOutput('table'))
    )
    )
 )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
    output$plot = renderPlot({
      data = read.csv(input$file$datapath)
      dat = data[,-1]
      if (input$choice=='column'){
        plot(x=1:40,y=dat[,input$N],col='purple',pch=20,cex=2,xlab='State',
             ylab='Days')
      }
      else {
        plot(x=1:40,y=dat[input$N,],col='purple',pch=20,cex=2,xlab='State',
             ylab='Days')
      }
    })
    output$table = DT::renderDataTable({
      data = read.csv(input$file$datapath)
      dat = data[,-1]
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


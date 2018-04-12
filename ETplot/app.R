#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that plots binomial and Poisson distributions.
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
      h3('Plot'),
      plotOutput('plot'),
      tableOutput('table'),
      width = 9
    )
 )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
    output$plot = renderPlot({
      data = read.csv(input$file$datapath)
      dat = data[,-1]
      if (input$choice=='column'){
        plot(x=1:40,y=dat[,input$N],col='purple',pch=20,xlab='State',
             ylab='Days')
      }
      else {
        plot(x=1:40,y=dat[input$N,],col='purple',pch=20,xlab='State',
             ylab='Days')
      }
    })
    output$table = renderTable({
      data = read.csv(input$file$datapath)
      dat = data[,-1]
      head(dat)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


# Plot expected time spent in each state before absorption in state N and prior.
# N can be chosen by the user.

library(shiny)

# Define UI for application that plots binomial and Poisson distributions.
ui <- fluidPage(
  
  # Application title
  titlePanel("Expected Time Spent in Each State \n 
             Before Absorption in State N or Prior"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput('choice','Row or column',c('row','column'),selected = 'column'),
      sliderInput('N','Number of first absorbing states:',
                  min = 1,
                  max = 39,
                  value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Plot'),
      plotOutput('plot')
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    data = read.csv('expected_time.csv')
    dat = data[,-1]
    output$plot = renderPlot({
      if (input$choice=='column'){
        plot(x=1:40,y=dat[,input$N],col='purple',pch=20,xlab='State',
             ylab='Days')
      }
      else {
        plot(x=1:40,y=dat[input$N,],col='purple',pch=20,xlab='State',
             ylab='Days')
      }
    }) 
}

# Run the application 
shinyApp(ui = ui, server = server)


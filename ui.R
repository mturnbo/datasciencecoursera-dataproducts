shinyUI(pageWithSidebar(
  headerPanel("Exponential Distribution and the Central Limit Theorem"),
  sidebarPanel(
    
    
    
    sliderInput('lambda', 'Set Lambda',value = 0.2, min = 0.1, max = 0.8, step = 0.05,),
    sliderInput('avgExps', 'Set Number of Average Exponentials',value = 40, min = 20, max = 100, step = 5,)
  ),
  mainPanel(
    p("Use this tool to explore exponential distribution and compare it with the Central Limit Theorem.  
      The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter.   
      For the simulation choose a lambda value and number of exponentials with the sliders on the left."),
    tags$hr(),
    p("Histogram of the distribution with the theoretical mean in blue and the sample mean in red."),
    plotOutput('expDist'),
    tags$hr(),
    p("Histogram of the distribution of averages with the theoretical mean in blue and the sample mean in red."),
    plotOutput('avgExpDist'),
    tags$hr(),
    p("Confidence Interval:"),
    textOutput('confInterval')
  )
))


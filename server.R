library(shiny)
set.seed(1)
n <- 1000

shinyServer(
  function(input, output) {
    
    output$expDist <- renderPlot({
      lambda = input$lambda
      simExpDist <- rexp(n, lambda)
      meanT = 1/lambda
      meanS = mean(simExpDist)
      varT = (1/lambda)^2
      varS = var(simExpDist)
      hist(simExpDist, main="Exponential Distribution", xlab="Values", freq=FALSE)
      abline(v=meanT, col="blue", lwd=2)
      abline(v=meanS, col="red", lwd=2)      
    })
    
    output$avgExpDist <- renderPlot({
      lambda = input$lambda
      obs <- input$avgExps
      simMeanExpDist = NULL
      for (i in 1:1000) simMeanExpDist = c(simMeanExpDist, mean(rexp(obs, lambda)))
      meanT = 1/lambda
      meanS = mean(simMeanExpDist)
      varS = obs * var(simMeanExpDist)
      hist(simMeanExpDist, main="Distribution of Average of Exponentials", xlab="Values", freq=FALSE)
      abline(v=meanT, col="blue", lwd=2)
      abline(v=meanS, col="red", lwd=2)
    })
    
    output$confInterval <- renderText({
      lambda = input$lambda
      obs <- input$avgExps
      simMeanExpDist = NULL
      for (i in 1:1000) simMeanExpDist = c(simMeanExpDist, mean(rexp(obs, lambda)))
      meanT = 1/lambda
      meanS = mean(simMeanExpDist)
      ci <- meanS + c(-1,1) * qt(.975, 1000) * (5/sqrt(obs)) 
      ci
    })
    
  }
)


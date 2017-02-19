plotUI <- function(id) {
    
    ns <- NS(id)
    
    plotlyOutput(ns('plot'))
}

plotServer <- function(input, output, session, userInputData, OutputData) {
    
    output$plot <- renderPlotly({
        
        df <- data.frame(
            Month = 1:(userInputData$years.w*12),
            Savings = OutputData()[[1]],
            Rate = .07/12)
        
        plotdata <- df %>% 
            mutate(Savings.by.Month = (Savings * ((1 + Rate) ^ Month))) %>%
            mutate(cum.savings = cumsum(Savings.by.Month))
        
        
        p <- plot_ly(data = plotdata, x = ~Month, y = ~cum.savings) %>% 
            layout(title = "Cumulative Savings by Month", xaxis = list(title = "Month"), yaxis = list(title = "Cumulative Savings"))
        
        p
        
    })
    
}

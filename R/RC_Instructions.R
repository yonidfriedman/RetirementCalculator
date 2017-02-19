InstructionUI <- function(id) {
    
    ns <- NS(id)
    
    textOutput(ns('Instructions'))
}

InstructionServer <- function(input, output, session) {
    output$Instructions <- renderText({
        "I hope you'll find the Retirement Calculator useful. To use it, 
input your personal estimations on the sliders and numeric inputs on the left. The text above each 
        input should make it clear what information to include. Calculations assume an inflation rate of 2.5%, 
        a nominal rate of return of 7% until retirement (when you might have a riskier investment portfolio) 
        and a 4% rate of return in retirement (with a more risk-averse portfolio mix)."
    })
}



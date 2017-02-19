userInput <- function(id) {
    
    ns <- NS(id)
    
    tagList(
    sliderInput(ns("years.w"),
                "Select Number of Years Till Retirement",
                min = 15,
                max = 50,
                value = 30,
                step = 1),
    sliderInput(ns("years.r"),
                "Select Number of Years in Retirement",
                min = 15,
                max = 30,
                value = 25,
                step = 1),
    sliderInput(ns("current.income"),
                "Input Current Income",
                min = 40000,
                max = 150000,
                value = 75000,
                step = 1000),
    sliderInput(ns("income.replacement"),
                "Expected Income Replacement Rate",
                min = .5,
                max = 1,
                value = .7,
                step = .05),
    numericInput(ns("current.savings"),
                 "Current Amount in Savings",
                 value = 0,
                 min = 0,
                 max = 50000000)
    )
}

userInputServer <- function(input, output, session) {
    
    input
    
}
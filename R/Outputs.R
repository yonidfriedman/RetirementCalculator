OutputsUI <- function(id) {
    
    ns <- NS(id)
    tagList(
        fluidRow(
            column(width = 6,
               wellPanel(
                   h4("Total savings needed at retirement"),
                   verbatimTextOutput(ns('retirement'))
               )),
        column(width = 6,
               wellPanel(
                   h4("Amount to save each month"),
                   verbatimTextOutput(ns("monthly.saving"))
               ))
                )
            )
}

OutputServer <- function(input, output, session, userInputData) {
    
savings <- reactive({

    income.in.retirement <- (userInputData$current.income * (1.025 ^ userInputData$years.w) * userInputData$income.replacement)
    retirement.requirement <- pv(r = .04, n = userInputData$years.r, pmt = income.in.retirement, type = 1)
    monthly.savings <- pmt(r = .07/12, n = (userInputData$years.w*12), pv = userInputData$current.savings, fv = retirement.requirement, type = 1)
    savings <- list(monthly.savings, -retirement.requirement)
    savings

})

output$monthly.saving <- renderText({

    paste0('$',round(savings()[[1]]))
    

})

output$retirement <- renderText({

    paste0('$',round(savings()[[2]]))
    
})


return(savings)
    
}
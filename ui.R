
shinyUI(fluidPage(
    
    titlePanel("Retirement Savings Estimator"),
    
    fluidRow(column(width = 10,
        InstructionUI('instructions'))),
    
    sidebarLayout(
            sidebarPanel(
                userInput('userInputs')
            ),
      
    mainPanel(
       
    OutputsUI('Outputs'),
           
    plotUI("savings.plot")
      
    )
  )))



shinyServer(function(input, output) {
   
        userInputData <- callModule(
            userInputServer,
            'userInputs'
        )
        
        OutputData <-callModule(
            OutputServer,
            'Outputs',
            userInputData
        )
   
        
        callModule(InstructionServer,
                   'instructions'
                   )
        
        
        callModule(plotServer,
                    "savings.plot",
                    userInputData,
                    OutputData
        )

        

  })

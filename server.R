library(shiny) 

BMI <- function(weight,height) {
    weight/(height^2)
}

diagnostic_f<-function(weight,height){
    BMI_value<-weight/(height^2)
    ifelse(BMI_value<18.5,"underweight",ifelse(BMI_value<25,"normal weight",ifelse(BMI_value<30,"overweight","obesity")))
}

shinyServer(
    function(input, output) {
        weight = reactive({
            return(ifelse(input$tabs == 1, input$weight_kg, input$weight_pound))
            })
        
        height = reactive({
            return(ifelse(input$tabs == 1, input$height_m, input$height_feet*12 + input$height_inch))
        })

        weightUnit = reactive({
            if(input$tabs == 1) 
                return("kg")
            return ("lbs")
        })
        
        heightUnit = reactive({
            if(input$tabs == 1) 
                return("m")
            return ("in")
        })
        
        output$inputweightvalue <- renderPrint({cat(weight(), weightUnit())})
        output$inputheightvalue <- renderPrint({cat(height(), heightUnit())})
        
        weight_adjust = reactive({
            return(ifelse(input$tabs == 1, input$weight_kg, input$weight_pound*704.5))
        })

        output$estimation <- renderPrint({BMI(weight_adjust(),height())})
        output$diagnostic <- renderPrint({diagnostic_f(weight_adjust(),height())})
    } 
)
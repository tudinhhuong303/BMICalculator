library(shiny)
shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Body Mass Index (BMI) Calculator"),
        
        sidebarPanel(
            tabsetPanel(
                id = 'tabs',
                tabPanel("Metric",
                         h3('Weight'),
                         numericInput('weight_kg', 'kilograms', 70, width = 200),
                         h3('Height'),
                         numericInput('height_m', 'meters', 1.70, min = 0.2, max = 3, step = 0.01, width = 200),
                         value = 1),
                tabPanel("Imperial",
                         h3('Weight'),
                         numericInput('weight_pound', 'pounds', 140, width = 200),
                         h3('Height'),
                         div(style="display:inline-block", numericInput('height_feet', 'feets', 5, min = 0, step = 1, width = 100)),
                         div(style="display:inline-block", numericInput('height_inch', 'inches', 5, min = 0, max = 11, step = 1, width = 100)),
                         value = 2)
            ),
            submitButton('Calculate your BMI')
        ), 
        mainPanel(
            p('The Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'),
            p('Regarding the BMI measure, the World Health Organization (WHO) proposes the following classification:'),
            
            tags$div(
                tags$ul(
                    tags$li('BMI <18.5       : Underweight'),
                    tags$li('BMI [18.5-24.9] : Normal'),
                    tags$li('BMI [25-29.9]   : Overweight'),
                    tags$li('BMI >=30        : Obese')
                )
            ),
            
            h4('Your input'), 
            p('weight:'), verbatimTextOutput("inputweightvalue"),
            p('height:'), verbatimTextOutput("inputheightvalue"),
            h4('Your BMI is:'),
            verbatimTextOutput("estimation"),
            p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
            
            
        )
        
    )   
)
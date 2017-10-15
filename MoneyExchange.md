Money Exchange Shiny App
========================================================
author: Alexander Wu
date: 10/13/2017
autosize: true

Introduction
========================================================

European Money Exchange

- Utilizing euro.cross and euro data 

- Allows users to quickly compute the desire amount of money exchange

Data
========================================================


```
             ATS         BEF         DEM         ESP         FIM
ATS  1.000000000  2.93161486 0.142135709  12.0917422 0.432093050
BEF  0.341108927  1.00000000 0.048483759   4.1246012 0.147390797
DEM  7.035529673 20.62546336 1.000000000  85.0718109 3.040003477
ESP  0.082701069  0.24244768 0.011754775   1.0000000 0.035734557
FIM  2.314316324  6.78468413 0.328946992  27.9841163 1.000000000
FRF  2.097744212  6.14977811 0.298164361  25.3653822 0.906420695
IEP 17.471976881 51.22110711 2.483391826 211.2666399 7.549519785
ITL  0.007106602  0.02083382 0.001010102   0.0859312 0.003070713
LUF  0.341108927  1.00000000 0.048483759   4.1246012 0.147390797
NLG  6.244151907 18.30544854 0.887516960  75.5026750 2.698054644
PTE  0.068636087  0.20121457 0.009755639   0.8299299 0.029657176
            FRF          IEP         ITL         LUF         NLG
ATS 0.476702543 0.0572345080  140.714229  2.93161486 0.160149851
BEF 0.162607493 0.0195232016   47.998880  1.00000000 0.054628544
DEM 3.353854885 0.4026750791  989.999131 20.62546336 1.126739032
ESP 0.039423810 0.0047333550   11.637217  0.24244768 0.013244564
FIM 1.103240477 0.1324587561  325.657236  6.78468413 0.370637415
FRF 1.000000000 0.1200633578  295.182459  6.14977811 0.335953424
IEP 8.328935807 1.0000000000 2458.555749 51.22110711 2.798134501
ITL 0.003387735 0.0004067429    1.000000  0.02083382 0.001138121
LUF 0.162607493 0.0195232016   47.998880  1.00000000 0.054628544
NLG 2.976603092 0.3573809621  878.641019 18.30544854 1.000000000
PTE 0.032718997 0.0039283527    9.658074  0.20121457 0.010992059
            PTE
ATS  14.5695951
BEF   4.9698190
DEM 102.5048189
ESP   1.2049211
FIM  33.7186519
FRF  30.5632839
IEP 254.5596294
ITL   0.1035403
LUF   4.9698190
NLG  90.9747653
PTE   1.0000000
```

Step by Step
========================================================

1. Select the desire exchange monetary units from the drop down bars

2. Enter the desire amount of money you would like to transfer from the first unit and press CONFIRM

3. On the right side, you will see the amount that will be exchanged to the resulting selected unit

Slide With Code
========================================================

Server.R

```r
library(shiny)
 shinyServer(
    function(input, output) {
      output$oid1 <- renderPrint({input$variable})
      output$oid2 <- renderPrint({input$variable2})
      output$amount <- reactive({
        curr1 <- names(currencies[currencies %in% input$variable])
        curr2 <- names(currencies[currencies %in% input$variable2])
        input$num*exchange[curr1, curr2]
      })
    }
  )
```



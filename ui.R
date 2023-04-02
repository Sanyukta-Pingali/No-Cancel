
library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    title = "No-Cancel", skin = 'black',
    
    dashboardHeader(
      title = "NO-CANCEL",
      
      dropdownMenu(type = "message",
                   messageItem(from = "Welcome", 
                               message = "I hope you enjoy my project!", 
                               time = "22:27"
                   )
      ),
      dropdownMenu(type = "notification",
                   headerText = strong("Data"), 
                   icon = icon("pen-to-square"), 
                   badgeStatus = NULL,
                   notificationItem(
                     text = "Find Data on Kaggle",
                     icon = icon("external-link"),
                     href = "https://www.kaggle.com/datasets/ahsan81/hotel-reservations-classification-dataset"
                   )
      ),
      dropdownMenu(type = "notification",
                   headerText = strong("LinkedIN"), 
                   icon = icon("bell"), 
                   badgeStatus = NULL,
                   notificationItem(
                     text = "Linkedin",
                     icon = icon("external-link"),
                     href = "https://www.linkedin.com/in/sanyukta-pingali-a61b5a130/"
                   ))
      
    ),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("Home", tabName = "Dashboard", icon = icon("home")),
        menuItem("Overview", tabName = "Dash", icon = icon("database")), 
        menuItem("Analysis", tabName = "Dash1", icon = icon("chart-bar")),
        menuItem("Summary", tabName = "Dash3", icon = icon("briefcase"))
        
      ),
      selectInput("Market", "Choose a Market Segment", choices = c("Aviation", "Complementary", "Corporate", "Offline", "Online"))
    ),
    
    dashboardBody(
     tabItems( 
      tabItem(tabName = "Dashboard",
              fluidRow(
                column(width = 6,
                       tags$img(src="pexels-vincent-rivaud-2227774.jpg", width = "100%")
                ),
                column(width = 6,
                       h1("Stop Unexpected Cancellations with NO-CANCEL!"),
                       br(),
                       br(),
                       h2("Hello! This dashboard was created to help users understand why cancellations happen, so they can recognise the early signs and take precautions."),
                        br(),
                       br(),
                       
                       p("You can navigate through the dashboard using the links in the side panel"),
                       p("The Overview page gives the breakdown and statistics of the data to make it easier to understand and give preliminary insights. The graphs contain a very large amount of data and might take some time to load. Feel free to click between the tabs. "),
                       p("The Analysis page contains correlational data to affirm how much a certain factor affects reservations and cancelations."),
                       p("The summary page explains the insights from the data"),
                       
                       br(),
                       br(),
                       
                       box(radioButtons("Book", "What's your booking status?", choices = c("Canceled", "Not_Canceled")))
                )
              )
      ),
      
      tabItem(tabName = "Dash3",
              h1("Summary"),
              fluidRow(
                infoBox("Lead Time", paste0("Long lead time has Slight increase in Cancellations "),icon = icon("thumbs-down")),
                infoBox("Special Requests", paste0("Special Requests cause significant increase in Successful Bookings"),icon = icon("thumbs-up")),
                infoBox("Price", paste0("Expensive rooms and rooms that are cheaper than average have the highest likelihood of cancelling "),icon = icon("dollar")),
                infoBox("Previous Bookings", paste0("Previous successful bookings will yield more successful bookings, however previous cancellations do not affect future bookings"), icon = icon("handshake")),
                infoBox("Number of Nights", paste0("Long stays have higher chance of cancellations"), icon = icon("warning"))
              )
          
              ),
      
      
      tabItem(tabName = "Dash",
              h1("Overview"),
              fluidRow(
                  tabBox(width = 150,
                  tabPanel(title = "Lead Time Distribution", status = "primary", solidHeader = TRUE, background = "light-blue", plotOutput("graph1"), box(sliderInput("bins", "Number of breaks", 0,500,250))),
                  tabPanel(title = "Data Summary", status = "primary", solidHeader = TRUE, background = "light-blue", verbatimTextOutput("summary")), 
                  tabPanel(title = "Data Structure", status = "primary", solidHeader = TRUE, background = "light-blue", verbatimTextOutput("structure")),
                  tabPanel(title = "Data Table", status = "primary", solidHeader = TRUE, background = "light-blue", dataTableOutput("dataTable")),
                  
                  tabPanel(title = "Type of Meal Plan Distribution", status = "primary", solidHeader = TRUE, background = "light-blue", plotlyOutput("g1")),
                  tabPanel(title = "Most Popular Months", status = "primary", solidHeader = TRUE, background = "light-blue", plotlyOutput("g3")),
                  tabPanel(title = "Most Popular Days", status = "primary", solidHeader = TRUE, background = "light-blue", plotlyOutput("g4")),
                  tabPanel(title = "Reservation Result Metrics", status = "primary", solidHeader = TRUE, background = "light-blue", plotlyOutput("g5")),
                  tabPanel(title = "Booking Source", status = "primary", solidHeader = TRUE, background = "light-blue", plotlyOutput("g6")),
                  tabPanel(title = "Room Type", status = "primary", solidHeader = TRUE, background = "light-blue", plotlyOutput("g7"))
                  ),
                
              )),
      
      tabItem(tabName = "Dash1",
              h1("Correlations with Booking Status"),
              fluidRow(
              tabBox(
      
              tabPanel(title = "Lead time", value = "Distribution", (plotlyOutput("scattered", height = "350px"))),
              tabPanel(title = "Special Requests", value = "Distribution", (plotlyOutput("scattered1", height = "350px"))),
              tabPanel(title = "Price", value = "Distribution", (plotlyOutput("scattered2", height = "350px"))),
              tabPanel(title = "Previous Successful Bookings", value = "Distribution", (plotlyOutput("scattered3", height = "350px"))),
              tabPanel(title = "Previous Cancellations", value = "Distribution", (plotlyOutput("scattered4", height = "350px"))),
              tabPanel(title = "Week Nights", value = "Distribution", (plotlyOutput("scattered11", height = "350px"))),
              tabPanel(title = "Weekend Nights", value = "Distribution", (plotlyOutput("scattered12", height = "350px"))),
              tabPanel(title = "No. of Children", value = "Distribution", (plotlyOutput("scattered13", height = "350px")))
              
              
              )
              
              
              
                          
                       ))
     
     ))
  ) )

      
      

      

                    
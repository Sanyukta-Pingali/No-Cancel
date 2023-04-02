library(DT)
library(shiny)
library(shinydashboard)
library(ggcorrplot)

shinyServer(function(input,output){
  
  output$Booking <- {(
    renderPlotly(input$Book)
  )}
  
  output$Market <- {(
    renderText(input$Market)
  )}
  
  output$graph1 <- renderPlot({
    hist(Hotel_Reservations$lead_time, breaks = input$bins)
    
    output$structure <- renderPrint(
      my_data %>%
        str()
      )
   
    output$summary <- renderPrint(
        my_data %>%
          summary()
    )
    
    output$g8 <- renderPlotly({
      g8 = my_data %>%
        plot_ly() %>%
        add_histogram(x=~get(input$Input)) %>%
        layout(xaxis = list(title = paste(input$Input)))
    })
    
    output$dataTable <- renderDataTable(
      my_data
    )
    
    
    output$g1 <- renderPlotly({
      g1 = my_data %>%
        plot_ly() %>%
        add_histogram(~type_of_meal_plan)
    }
      
    
  )
  
    
    
    output$g3 <- renderPlotly({
      g3 = my_data %>%
        plot_ly() %>%
        add_histogram(~arrival_month)
      
    }
      
      
    )
    
    output$g4 <- renderPlotly({
      g4 = my_data %>%
        plot_ly() %>%
        add_histogram(~arrival_date)
    }
      
      
    )
    
    output$g5 <- renderPlotly({
      g5 = my_data %>%
        plot_ly() %>%
        add_histogram(~booking_status)
    }
      
      
    )
    
    output$g6 <- renderPlotly({
      g6 = my_data %>%
        plot_ly() %>%
        add_histogram(~market_segment_type)
    }
      
      
    )
    
    output$g7 <- renderPlotly({
      g7 = my_data %>%
        plot_ly() %>%
        add_histogram(~room_type_reserved)
    }
      
      
    )
    
    output$scattered <- renderPlotly({
      g9 = my_data%>%
        ggplot(aes(x = booking_status, y = lead_time)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and lead time",
           x = "booking_status",
           y = "lead_time")
      ggplotly(g9)
    })
    
    output$scattered1 <- renderPlotly({
      g10 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_special_requests)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Special Requests",
           x = "booking_status",
           y = "Requests")
      ggplotly(g10)
    })
  
    output$scattered2 <- renderPlotly({
      g11 = my_data%>%
        ggplot(aes(x = booking_status, y = avg_price_per_room)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Room Price",
           x = "booking_status",
           y = "Price")
      ggplotly(g11)
    })  
    
    output$scattered3 <- renderPlotly({
      g12 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_previous_bookings_not_canceled)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Previous Sccessful Bookings",
           x = "booking_status",
           y = "Past Successful Bookings")
      ggplotly(g12)
    })
    
    output$scattered4 <- renderPlotly({
      g13 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_previous_cancellations)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Previous Cancellations",
           x = "booking_status",
           y = "Cancellations")
      ggplotly(g13)
    })
    
    output$scattered5 <- renderPlotly({
      g14 = my_data%>%
        ggplot(aes(x = booking_status, y = repeated_guest)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Repeat visitors",
           x = "booking_status",
           y = "Repeat visits")
      ggplotly(g14)
    })
    
    output$scattered6 <- renderPlotly({
      g15 = my_data%>%
        ggplot(aes(x = booking_status, y = market_segment_type)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Market Segment",
           x = "booking_status",
           y = "Segment")
      ggplotly(g15)
    })
    
    output$scattered7 <- renderPlotly({
      g16 = my_data%>%
        ggplot(aes(x = booking_status, y = arrival_date)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and date arrived",
           x = "booking_status",
           y = "Day of the month")
      ggplotly(g16)
    })
    
    output$scattered8 <- renderPlotly({
      g17 = my_data%>%
        ggplot(aes(x = booking_status, y = arrival_month)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Month",
           x = "booking_status",
           y = "Month")
      ggplotly(g17)
    })
    
    output$scattered9 <- renderPlotly({
      g18 = my_data%>%
        ggplot(aes(x = booking_status, y = room_type_reserved)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Room Type",
           x = "booking_status",
           y = "Room Type")
      ggplotly(g18)
    })
    
    output$scattered10 <- renderPlotly({
      g19 = my_data%>%
        ggplot(aes(x = booking_status, y = type_of_meal_plan)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Meal Plan",
           x = "booking_status",
           y = "Meal Plan")
      ggplotly(g19)
    })
    
    output$scattered11 <- renderPlotly({
      g20 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_week_nights)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Special Requests",
           x = "booking_status",
           y = "Week nights booked")
      ggplotly(g20)
    })
    
    output$scattered12 <- renderPlotly({
      g21 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_weekend_nights)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Weekend nights",
           x = "booking_status",
           y = "Weekend nights")
      ggplotly(g21)
    })
    
    output$scattered13 <- renderPlotly({
      g22 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_children)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Children",
           x = "booking_status",
           y = "Children")
      ggplotly(g22)
    })
    
    output$scattered14 <- renderPlotly({
      g23 = my_data%>%
        ggplot(aes(x = booking_status, y = no_of_adults)) +
        geom_point() +
        geom_smooth()
      labs(title = "Relation between booking status and Number of Adults",
           x = "booking_status",
           y = "Number of guests")
      ggplotly(g23)
    })
        
    }
    
  )
  }
  )

  
  

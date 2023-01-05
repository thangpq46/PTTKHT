
workspace {
    model {
        
        User = person "Student"  "Students reserve parking spaces online"
        softwareSystem = softwareSystem "Parking reservation management system"  "Manage registration of parking spaces and cars for students."{
            webapp = container "Web Application" "Provide functionality and content to the system" "Java and Spring MVC"{
                pay = component "Payment" "Allow students to make payments"" "Java"
                catalog = component "Parking area" "Allow students to view parking spaces " "Java"
                intro = component "Homepage" "Allow students to view introduction information about the system" "Java"
                central = component "Controller" "central controller allows connection to services" "Java"
            }
            spa = container "Single-Page Application" "offer reservation functionality through their browser" "JavaScript and ReactJs"
            api = container "Api Application" "provide functionality through JSON/HTTPS " "Java and Spring MVC"{
                regis = component "Register" "Allow students to register for parking " "Spring,REST"
                about = component "Home page" "Allow students to view referral information" "Spring, REST"
                request = component "Requests " "Allow students to submit request information about bookings" "Spring,REST"
                product = component "Parking area" "Allow students to view parking spaces" "Spring,REST"
                veri = component "Verification" "User authorization and authentication" "Spring"
                noti = component "Notification model" "Send Notification to Students" "Java"
                ct = component "Payment" "Allow students to pay "Java"
                pro = component "Status parking" "Allows to see parking status, " "Java"
            }
            database = container "Database" "store the sender's registered license plate information" "Mysql"
        }
        notification = softwareSystem "notification" "Notification to students"{
            server = container "Mail Server" "Receive and send notifications" "Java"
            notiapi = container "Notifications Api" "Send notifications to subscribers" "Java and Spring MVC"
notidb = container "Notification Database" "Archive student notices"
        }
        HtndSystem = softwareSystem "License plate recognition system""Identification of vehicle license plate data for reservation"

        thanhtoanSystem = softwareSystem "Payment" "Can pay in person or pay online" 


        User -> softwareSystem "Need to register for a parking space"
        softwareSystem -> notification "send notifications"
        softwareSystem -> HtndSystem "vehicle data recording"
        softwareSystem -> thanhtoanSystem "payment"

        User -> webapp "Access the system using https" "Https"
        spa -> api "Call API to" "Json/Https"
        api -> database "Read and write to CSDL" "JDBC"
        webapp -> spa "provide a browser for students"
        api -> notification "Sends notifications to"
        notification -> User "send notification to students"

softwareSystem -> server "send notifications using"
        spa -> regis "Call API to" "Json/Https"
        spa -> about "Call API to" "Json/Https"
        spa -> request "Call API to" "Json/Https"
        spa -> product "Call API to" "Json/Https"
        regis -> veri "Uses"
        request -> noti "Uses"
        product -> pro "Uses"
        veri -> database "Read and write to" "JDBC"
        pro -> database "Read and write to" "JDBC"
        about -> database "Read and write to" "JDBC"
        spa -> ct "call API to"""
        noti -> notification "Sends notification"
        
        
        server -> User "Send notifications to"
        server -> notiapi "Call api" "http + json"
        notiapi -> notidb "Read and write to CSDL" "JDBC"
        
        User -> catalog "access the system by https" "Https"
        User -> intro "access the system by htpps" "Https"
        catalog -> central ""
        intro -> central ""
        central -> pay ""
        central -> spa "Provide for student browsing"
    }
    
    views {
        systemContext softwareSystem "SystemContext" {
            include *
            animation {
            softwareSystem
            User
            HtndSystem
        }
        
        }
        
        container softwareSystem "Containers"{
            include *
            animation {
            webapp
            spa
            api
            database

        }
        
        }
        container notification "Container"{
            include *
}
        component api "Component"{
            include *
        }
    component webapp "Components"{
            include *
        }
        
        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            
            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
    }
}

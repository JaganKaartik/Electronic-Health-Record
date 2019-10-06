<%-- 
    Document   : Admin
    Created on : Sep 30, 2019, 4:52:29 PM
    Author     : jagankaartik58
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Admin Page</title>

        <!-- BootStrap Framework -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js" ></script>

        <!-- Materialize Front End Framework -->

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> 

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> 

        <!-- JQuery -->
        <script src=' https://code.jquery.com/jquery-3.4.1.min.js'></script>

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/admin.css" type="text/css">

    </head>
    <style type="text/css">
        #form1 {
        display:none;
        }
    </style>
    <body>

        <!-- CHECK IF THE ADMIN IS LOGGIN IN OR NOT USING SESSION TRACKING -->
        <!-- HTTP Session Management -->

        <%

            if(session.getAttribute("uname")==null)
            {
                response.sendRedirect("index.html");
            }

        %>

        <nav>
            <div class="nav-wrapper  green darken-2">
                <!-- HREF TO ABOUT.HTML -->
                <a href="#" class="brand-logo left">HygeaHealth+</a>
                <a href="#" class="brand-logo center">Admin Dashboard</a>
                <!-- <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href="http://localhost:8080/ElectronicHealthRecord/registerpatient.html">Register Patient</a></li>
                <li><a href="#">Billing/Discharge</a></li>
                <li><a href="http://localhost:8080/ElectronicHealthRecord/ViewPatient.jsp">View Patients</a></li>
                <li><a href="#">View Doctors</a></li>
                <li><a href="#">Schedule Appointment</a></li>
                </ul> -->
            </div>
        </nav>


        <div class = "container">
            <div class = "darken-4 row">
                <div class ="card-panel green darken-3 col s6">
                    <button type="button" class="btn btn-primary" id="formButton">Add User</button>

                    <form id="form1" onSubmit = "return checkPassword(this)" method="post" action="signup">
                        <input type="text" name="user" placeholder="Username"/>
                        <input type="text" name="role" placeholder="Role"/>
                        <input type="password" name="p1" placeholder="Password"/>
                        <input type="password" name="p2" placeholder="Confirm Password"/>
                        <button type="button" class="btn btn-warning">Submit to DB</button>
                    </form>
                </div>
            </div>
        </div>
       <!-- <%
            out.println("Admin.JSP Page Admin Login Verified");
        %> -->
        <script type="text/javascript">
            $("#formButton").click(function(){$("#form1").toggle();});
        </script>
    </body>
</html>

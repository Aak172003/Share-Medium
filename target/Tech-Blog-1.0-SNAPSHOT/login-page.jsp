<%-- 
    Document   : login-page
    Created on : 20-Oct-2023, 5:57:07 pm
    Author     : Aakash Prajapati
--%>

<%@page import="com.tech.blog.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <!--  Botstrap CSS CDN Link  --> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="cssInside/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 72% 100%, 48% 94%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>

        <!-- Include Navbar--> 
        <%@include file="navbar.jsp" %>


        <main class="d-flex align-items-center primary-background banner-background" style="height: 90vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">

                            <div class="card-header  text-center text-black">
                                <span class="fa fa-user fa-3x"></span>
                                <h1>Login Here</h1>
                            </div>

                            <%
                                message m = (message) session.getAttribute("msg");
                                if (m != null) {
                            %>

                            
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                            </div>
                            
                            <%      // remove for not seeing again and again message 
                                    session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">

                                <form action="LoginServlet" method="post">
                                    
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <br>

                                    <!--<div class=" container text-center">-->
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <!--</div>-->
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>



        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->

        <script 
            src="https://code.jquery.com/jquery-3.7.1.min.js" 
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
            crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>

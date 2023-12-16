
<!--Import Helper Fun for java database Connectivity--> 
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<!--Import Java SQL --> 
<%@page import= "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech-Blog</title>

        <!--  Botstrap CSS CDN   --> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--My Css Link-->
        <link rel="stylesheet" type="text/css" href="cssInside/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 72% 100%, 48% 94%, 0 100%, 0 0);
            }
        </style>
        
    </head>
    <body>



        <%
            
            // TODO code application logic here
            Connection c = ConnectionProvider.getConnection();
            
            if (c.isClosed()) {
                System.out.println("Connection is Still Closed ");
            } else {
                System.out.println("Connection Successfully Created  .....");
            }
            
            System.out.println("connection id is : " + c);

            // Create A Query
            // String q = "create table Aakash(tId int(20) primary key auto_increment, tName varchar(200) not null , tCity varchar(400))";

            // Create a Statement
            // Statement stmt = c.createStatement();
            // stmt.executeUpdate(q);
            // System.out.println("Table created succesfully in DB");
        %>


        <!-- Include Nav-bar --> 
        <%@include file="navbar.jsp" %>

<!--        <h1>
            <%= c%>
            This is Connection
        </h1>-->

        <!--Banner Page--> 

        <div class="container-fluid p-0 m-0">

            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-4">Welcome to Tech-blog </h3>

                    <p>
                        A programming language is a system of notation for writing computer programs. Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>
                    <p>
                        The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language.
                    </p>


                    <button class="btn btn-outline-light btn-lg">
                        <span class="fa fa-user-plus"></span>
                        Start! It's Free
                    </button>


                    <a href="login-page.jsp"  class="btn btn-outline-light btn-lg" >
                        <span class="fa fa-user "></span>
                        Login
                    </a>

                </div>
            </div>


        </div>

        <!--Cards--> 

        <div class="container">

            <div class="row mb-3">
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title">Java Programming Languages </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more ...</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title">Java Programming Languages </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more ...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title">Java Programming Languages </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more ...</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row ">
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title">Java Programming Languages </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more ...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title">Java Programming Languages </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more ...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title">Java Programming Languages </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read more ...</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->

        <script 
            src="https://code.jquery.com/jquery-3.7.1.min.js" 
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
            crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <!--// J-query--> 

        <!--                <script>
                                $(document).ready(function () {
                                    alert("Page is Ready ...");
                                });
                        </script>-->

    </body>
</html>

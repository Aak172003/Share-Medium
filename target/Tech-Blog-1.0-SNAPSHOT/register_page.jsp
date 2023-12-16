<%-- 
    Document   : register_page
    Created on : 20-Oct-2023, 6:27:49 pm
    Author     : Aakash Prajapati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Register Page</title>

        <!--  Botstrap CSS CDN Link  --> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="cssInside/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 66% 100%, 29% 97%, 1% 100%, 0 0);
            }
        </style>
    </head>
    <body>

        <!-- Include Navbar--> 
        <%@include file="navbar.jsp" %>

        <main class=" primary-background banner-background " style="padding-bottom: 30px; " >
            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <div class="card-header text-center text-black">
                            <span class="fa fa-3x fa-user-circle"></span>
                            
                            <h2>Register Here</h2>
                        </div>

                        <div class="card-body">

                            <!-- Servlet Call-->

                            <form id="reg-form" action="RegisterServlet" method="POST">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="gender" name="gender" value="Male" >Male
                                    <input type="radio" id="gender" name="gender" value="Female" >Female
                                </div>



                                <div class="form-group">

                                    <textarea name="about" class="form-control" id="" rows="4" placeholder="Enter something About yourself ...."></textarea>
                                </div>  

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Accept terms and Conditions</label>
                                </div>

                                <br>

                                <div class="container text-center " id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>

                                    <h4>Please Wait ......</h4>
                                </div>
                                <br><!-- comment -->


                                <button id="btn" type="submit" class="btn btn-primary">Submit</button>

                            </form>
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

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        
        <!--   AJAX Bases Implemenetation   --> 
        <script>
                $(document).ready(function () {

                    console.log("Loaded in Console .....");

                    $('#reg-form').on('submit', function (event) {

                        // responsible for not going to servlet 
                        event.preventDefault();

                        // this means is current form ka data
                        let form = new FormData(this);

                        $('#btn').hide();
                        $('#loader').show();

                        // send to register Servlet 
                        $.ajax({
                            url: "RegisterServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                $('#btn').show();
                                $('#loader').hide();


                                if (data.trim() === "done")
                                {
                                    // sweet Alert 
                                    swal("Register Successfull....we are redirecting to Login page ")
                                            .then((value) => {
                                                window.location = "login-page.jsp";
                                            });
                                } else {
                                    swal(data);
                                }

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR);
                                $('#btn').show();
                                $('#loader').hide();
                                swal("Error .... ");

                            },

                            // false proces data 
                            processData: false,
                            contentType: false
                        });
                    });
                });
        </script>
    </body>
</html>

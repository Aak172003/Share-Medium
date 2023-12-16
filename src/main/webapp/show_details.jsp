


<%@page import="com.tech.blog.dataAccessObj.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dataAccessObj.userDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.dataAccessObj.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    // Extract User by session , and type Cast into User 

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    } else {
        System.out.println("Hii");
    }

%>


<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> </title>


        <!--  Botstrap CSS CDN Link  --> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="cssInside/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>



            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;

            }

            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                /*background:url(img/bg.jpeg);*/
                background-size: cover;
                background-attachment: fixed;
            }

        </style>

        <!--        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="7aJvRMzj"></script>-->

    </head>

    <body>


        <!--        <h1>Hello World!</h1>
                <h4 class="post-title"><%= p.getpTitle()%></h4>
        -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background text-center">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-book  "></span>Tech-Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <ul class="navbar-nav mr-auto">

                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="	fa fa-bell-o"></span> Go To Blog's <span class="sr-only">(current)</span></a>
                    </li>


                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Languages</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure </a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">

                            Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-model"  >

                            Do Post</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-center">
                    <li class="nav-item">

                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-model" ><span class="fa fa-user-circle"></span>
                            <%= user.getName()%>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>

                </ul>
            </div>
        </nav>



        <!--Main Content Of Body--> 

        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-center  text-white">
                            <h4 class="post-title"><%= p.getpTitle()%></h4>
                        </div>

                        <div class="card-body">
                            <img class="card-img-top my-2 " width="400" height="600" src="picks/<%= p.getpPic()%>" alt="Card image cap" />

                            <div class="row my-3 row-user">
                                <div class="col-md-8">

                                    <% userDao ud = new userDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"><a href="#">  
                                            <%--<%= ud.getUserByUserId(p.getUserId()).getName() %>--%>
                                        </a>Posted on : </p>

                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                            </div>

                            <p class="post-content">
                                <%=p.getpContent()%>
                                <br>
                                <br>
                            </p>   
                            <div class="post-code">
                                <pre>
                                    <%=p.getpCode()%>
                                </pre>
                            </div>



                        </div>

                        <div class="card-footer primary-background ">

                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                            %>

                            <a href="#" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm "><i class="fa fa-thumbs-o-up"></i>
                                <span class="like-counter"> 

                                    <%= ld.CountLikePost(p.getPid())%>
                                </span>
                            </a>


                            <!--                        <a href="#" class="btn btn-outline-light btn-sm "><i class="fa fa-commenting-o"></i><span> 20</span></a>-->

                        </div>

                        <!--                        <div class="card-footer">
                                            
                                                    <div class="fb-comments" data-href="https://localhost:9494/Tech-Blog/show_details.jsp?post_id=51" data-width="10" data-numposts="1"></div> 
                                                </div>-->

                    </div>
                </div>
            </div>
        </div>



        <!--Start Profile Model--> 


        <!-- Modal -->
        <div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document">

                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Tech-Blog</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>

                    <div class="modal-body">

                        <div class="container text-center">
                            <%--<%= user.getProfile() %>--%>


                            <img src="picks/<%= user.getProfile()%>" class="img-fluid" style=" max-width: 150px">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--*************************************************************************************-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id : </th>
                                            <td> <%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Status : </th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Register on : </th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--End Profile Model-->

                            <!--*************************************************************************************-->

                            <!--Start Profile Edit--> 

                            <div id="profile-edit" style="display: none">

                                <h2>Please Edit ! CareFully </h2>

                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id : </td>
                                            <td> <%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name : </td>
                                            <td> <input type="text" name="user_name" class="form-control" value="<%= user.getName()%>" /></td>
                                        </tr>
                                        <tr>
                                            <td>Email : </td>
                                            <td> <input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>" /></td>
                                        </tr>

                                        <tr>
                                            <td>Password : </td>
                                            <td> 
                                                <div class="input-group">
                                                    <input type="password" name="user_password" id="passwordField" class="form-control" value="<%= user.getPassword()%>" />
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">
                                                            <i class="fa fa-eye" id="togglePassword"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>About : </td>
                                            <td> <input type="text" name="user_about" class="form-control" value="<%= user.getAbout()%>" /></td>
                                        </tr>

                                        <tr>
                                            <td>New Profile Pick : </td>
                                            <td> <input type="file" name="image" class="form-control"/></td>
                                        </tr>

                                    </table>

                                    <div>
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>
                            </div>

                            <!--End Profile Edit--> 

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Start Post Model-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document">

                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="AddBlogServlet" method="post" id="add-post-form" enctype="multipart/form-data">

                            <div class="form-group">

                                <!--provide name for fetching data--> 
                                <select class="form-control" name="cid">
                                    <option selected disabled>Select Category</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<category> list = postd.getCategories();

                                        for (category c : list) {
                                    %>

                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>                         
                                    <%
                                        }
                                    %>

                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title " class="form-control" />

                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px" placeholder="Enter your Content"></textarea>

                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px" placeholder="Enter your Program ( if any )"></textarea>

                            </div>

                            <div class="form-group">
                                <label>Select Your Pic</label>
                                <br>
                                <input name="pic" type="file"  />

                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!--End post model--> 


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


        <!--// Toggle between two things using J-Query--> 

        <script>
                                $(document).ready(function () {

                                    let editStatus = false;

                                    // alert("Testing");
                                    $('#edit-profile-btn').click(function () {
                                        // alert("Button Clicked ");

                                        if (editStatus === false)
                                        {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            $('#edit-profile-btn').text('Back');

                                            editStatus = true;
                                        } else {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            $('#edit-profile-btn').text('Edit');

                                            editStatus = false;
                                        }

                                        // Target Password Eye Icon

                                        $('#togglePassword').click(function () {
                                            var passwordField = $('#passwordField');
                                            var fieldType = passwordField.attr('type');

                                            if (fieldType === 'password') {
                                                passwordField.attr('type', 'text');
                                                $('#togglePassword').removeClass('fa-eye').addClass('fa-eye-slash');
                                            } else {
                                                passwordField.attr('type', 'password');
                                                $('#togglePassword').removeClass('fa-eye-slash').addClass('fa-eye');
                                            }
                                        });
                                    });
                                });
        </script>

        <!--now add post.js--> 

        <script>
            $(document).ready(function () {
                $("#add-post-form").on('submit', function (event) {

                    // responsible for not going to servlet 
                    event.preventDefault();

                    // this means is current form ka data
                    let form = new FormData(this);

                    // send to register Servlet 
                    $.ajax({
                        url: "AddBlogServlet",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {

                            //                            console.log(data);

                            if (data.trim() === "done") {
                                swal("Succesfully save data in DataBase ", "Good job!", "success");
                            } else {
                                swal("SomeThing Went wrong ! PLease Try Again", "You clicked the button!", "error");
                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            // error 
                        },

                        // false proces data 
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>





        <script 
            src="https://code.jquery.com/jquery-3.7.1.min.js" 
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
            crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="javaScript/myJavascript.js" type="text/javascript"></script>




    </body>
</html>

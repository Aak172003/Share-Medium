<%-- 
    Document   : error_page
    Created on : 25-Oct-2023, 6:12:17 pm
    Author     : Aakash Prajapati
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page </title>

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
        <div class="container text-center" style="padding: 20px;">
            <img src="img/error.png" width="600" height="500" class="img-fluid" />
            <h3 class="display-4">Sorry Something Wrong ....</h3>
            
            
            <%--<%= exception %>--%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
            
        </div>

    </body>
</html>

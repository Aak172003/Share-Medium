
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dataAccessObj.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dataAccessObj.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<div class="row">

    <%
        
        // User uu = (User) session.getAttribute("currentUser") ;

        // Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> postList = null;

        if (cid == 0) {
            postList = d.getAllPosts();
        } else {
            postList = d.getPostByCatId(cid);
        }

        if (postList.size() == 0) {
    %>
    <div class="container text-center mt-10 d-flex justify-content-center align-items-center">
        <img src="img/nopost.png" width="600" height="500" class="img-fluid" />
    </div>
    <%
        return;
        }
        for (Post p : postList) {
    %>

    <div class="col-md-6 mt-3">
        <div class="card">

            <div class="card-body">
                
                <img class="card-img-top" src="picks/<%= p.getpPic()%>" alt="Card image cap" />
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>

                <pre><%= p.getpCode()%></pre>
            </div>
            
            <div class="card-footer text-center primary-background">
              

                <!--<a href="#" class="btn btn-outline-light btn-sm "><i class="fa fa-thumbs-o-up"></i><span> 10</span></a>-->
                <a href="show_details.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm"> Read More ...</a>
                <!--<a href="#" class="btn btn-outline-light btn-sm "><i class="fa fa-commenting-o"></i><span> 20</span></a>-->
            
            </div>
            
        </div>


    </div>



    <%
        }

    %>
</div>

 <script src="javaScript/myJavascript.js" type="text/javascript"></script>

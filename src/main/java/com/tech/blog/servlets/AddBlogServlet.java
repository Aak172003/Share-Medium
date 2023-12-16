/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dataAccessObj.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

//This take input as image as well

@MultipartConfig
public class AddBlogServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            int cid = Integer.parseInt(request.getParameter("cid"));

            String pTitle = request.getParameter("pTitle");

            String pContent = request.getParameter("pContent");

            String pCode = request.getParameter("pCode");

            Part part = request.getPart("pic");

            // getting User id 
            HttpSession s = request.getSession();

            // extract cuurent user from sesion ,
            // because user ko login krate time uska saara data maine session me store kia hai 
            User user = (User) s.getAttribute("currentUser");

//            out.println("User name is : " + user.getName());
//            out.println("User Email is : " + user.getEmail());
            // Make post Object 
            Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());

            PostDao dao = new PostDao(ConnectionProvider.getConnection());

            if (dao.savePost(post)) {
                out.println("done");

                // already created function inside helper 
                String path = request.getServletContext().getRealPath("/") + "picks" + File.separator + part.getSubmittedFileName();

                helper.saveFile(part.getInputStream(), path);

            } else {
                out.println("error");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
// </editor-fold>

}

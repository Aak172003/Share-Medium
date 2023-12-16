package com.tech.blog.servlets;

import com.tech.blog.dataAccessObj.userDao;

import com.tech.blog.entities.User;

import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// with this server can accept , any type of Data 
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // out.println("<h1>This is User Servlet </h1>");
            // All basis on check , which is mentioed in register_page 
            String check = request.getParameter("check");

            if (check == null) {
                out.println("Box not checked ");
            } else {

                // Fetch all form Data 
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");

                //  out.println("<h2> Name : " + name + "</h2>");
                //  out.println("<h2> Name : " + email + "</h2>");
                //  out.println("<h2> Name : " + password + "</h2>");
                //  out.println("<h2> Name : " + gender + "</h2>");
                //  out.println("<h2> Name : " + about + "</h2>");
                
                // create user Object to set All data to that object
                User user = new User(name, email, password, gender, about);

                // create a user dao Object
                userDao dao = new userDao(ConnectionProvider.getConnection());

                // user has name , email , password , gender , about 
                if (dao.saveUser(user)) {
                    out.println("done");
                } else {
                    out.println("Error.....");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

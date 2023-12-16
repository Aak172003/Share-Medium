/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dataAccessObj.userDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.message;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Aakash Prajapati
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Fetch all form Data 
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            
            // out.println("<h2> Email : " + userEmail + "</h2>");
            // out.println("<h2> Password  : " + userPassword + "</h2>");
            
            userDao dao = new userDao(ConnectionProvider.getConnection());
            
            // neacuse this return an user 
            User u = dao.getUserByEmailAndPassword(userEmail, userPassword);

            if (u == null) {
                // login false 
                out.println("Invalid Details ... Try Again");
                message msg = new message("Invalid Details ! Try again", "error", "alert-danger");

                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                // if wrong details enter , so it redirect to again home page 
                response.sendRedirect("login-page.jsp");

            } else {
                // login success
                // session me store , jb tk user login hai tb tk store 

                HttpSession s = request.getSession();

                // currentUser naam se cookies me store krdia 
                s.setAttribute("currentUser", u );

                response.sendRedirect("profile.jsp");
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

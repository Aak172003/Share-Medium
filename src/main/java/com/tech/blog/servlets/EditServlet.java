
package com.tech.blog.servlets;

import com.tech.blog.dataAccessObj.userDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.message;
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

/**
 *
 * @author Aakash Prajapati
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     
            
            // Fetch all details given by User 
            String newName = request.getParameter("user_name");
            String newEmail = request.getParameter("user_email");
            String newPassword = request.getParameter("user_password");
            String newAbout = request.getParameter("user_about");

            // way to extract Image from User Input given 
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            HttpSession s = request.getSession();

            // extract cuurent user from sesion ,
            // because user ko login krate time uska saara data maine session me store kia hai 
            User user = (User) s.getAttribute("currentUser");

            user.setEmail(newEmail);
            user.setName(newName);
            user.setPassword(newPassword);
            user.setAbout(newAbout);

            // delete krne se phle usko oldfile me save krlia hai 
            String oldFile = user.getProfile();

            user.setProfile(imageName);

            // Update in database as well 
            userDao newUser = new userDao(ConnectionProvider.getConnection());

            boolean ans = newUser.updateUser(user);

            if (ans) {
                out.println("updated to DB");

                String path = request.getServletContext().getRealPath("/") + "picks" + File.separator + user.getProfile();

                // delete file
                String pathOld = request.getServletContext().getRealPath("/") + "picks" + File.separator + oldFile;

                if (!oldFile.equals("default.jpeg")) {
                    helper.deleteFile(pathOld);
                }

                if (helper.saveFile(part.getInputStream(), path)) {
                    out.println(" Profile Photo updated to DB");

                    message msg = new message("Profile Photo updated to DB", "success", "alert-success");

                    s.setAttribute("msg", msg);

                } else {
                    out.println(" Profile Photo failed to update to DB");

                    message msg = new message("Something Went wrong ! Try again", "error", "alert-danger");

                    s.setAttribute("msg", msg);
                }

            } else {
                out.println("Not Updated....");
                message msg = new message("Something Went wrong ! Try again", "error", "alert-danger");

                s.setAttribute("msg", msg);
            }

            response.sendRedirect("profile.jsp");

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

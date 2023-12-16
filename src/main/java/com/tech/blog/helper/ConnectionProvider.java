package com.tech.blog.helper;

import java.sql.*;

//   Or 
//import jakarta.jms.Connection;
//import java.sql.DriverManager;
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {
            
            if (con == null) {

                // Load the Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tech-blog", "root", "93104");

                System.out.println(con);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}

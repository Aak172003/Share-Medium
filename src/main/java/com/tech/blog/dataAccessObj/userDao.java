// this Dao is responsible for inserting Data into databases 
package com.tech.blog.dataAccessObj;

import com.tech.blog.entities.User;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class userDao {

    private final Connection con;

    //  constructor 
    public userDao(Connection con) {
        this.con = con;
    }

    // method to insert data into Databases 
    public boolean saveUser(User user) {

        boolean f = false;
        try {

            // User to -> Database 
            // user has name , email , password , gender , about 
            String q = "insert into user(name, email, password ,gender, about) values (?, ?, ?, ?, ?)";

            // Create a OPrepared Statement
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;

            System.out.println("Items Inserted Succesfully ..... ");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // get user by Emaildid and Password 
    public User getUserByEmailAndPassword(String email, String password) {
        
        // user ke email id se i woukd return full user 
        User user = null;

        try {

            String q = "select * from user where email =? and password=?";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            // if it has any row 
            if (set.next()) {

                // Create new User 
                user = new User();

                // extract from db
                String name = set.getString("name");
                // set to user Object 
                user.setName(name);
                // extract from db
                user.setId(set.getInt("id"));
                // extract from db
                user.setEmail(set.getString("email"));
                // extract from db
                user.setPassword(set.getString("password"));
                // extract from db
                user.setGender(set.getString("gender"));
                // extract from db
                user.setAbout(set.getString("about"));

                // extract from db
                user.setDateTime(set.getTimestamp("rdate"));

                // extract from db
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    ;
    
    
    public boolean updateUser(User user) {
        boolean f = false;

        try {

            String q = " update user set name=? , email=?,password=?,about=?,profile=? where id =?";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAbout());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
    public User getUserByUserId(Integer userId){
        User user = null ; 
         String q = "select * from user where id=?";
         
        try {
            PreparedStatement ps = this.con.prepareStatement(q);
            
            ps.setInt(1, userId);
            
              ResultSet set = ps.executeQuery();
              
              if(set.next()){
                  
                // Create new User 
                user = new User();

                // extract from db
                String name = set.getString("name");
                // set to user Object 
                user.setName(name);
                // extract from db
                user.setId(set.getInt("id"));
                // extract from db
                user.setEmail(set.getString("email"));
                // extract from db
                user.setPassword(set.getString("password"));
                // extract from db
                user.setGender(set.getString("gender"));
                // extract from db
                user.setAbout(set.getString("about"));

                // extract from db
                user.setDateTime(set.getTimestamp("rdate"));

                // extract from db
                user.setProfile(set.getString("profile"));

              }

            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

         
        
        return user ;
        
    }
}

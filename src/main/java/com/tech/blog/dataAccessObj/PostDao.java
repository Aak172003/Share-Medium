/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dataAccessObj;

import com.tech.blog.entities.Post;
import com.tech.blog.entities.category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<category> getCategories() {

        ArrayList<category> list = new ArrayList<>();

        try {

            String q = "select * from categories";

            // Create a OPrepared Statement
            Statement st = this.con.createStatement();

            ResultSet set = st.executeQuery(q);

            while (set.next()) {

                int cid = set.getInt("cid");
                String name = set.getString("name");

                String description = set.getString("description");

                category c = new category(cid, name, description);

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {

            String q = "insert into posts(pTitle , pContent, pCode, pPic , catId, userId) values(?,?,?,?,?,?)";

            // Create a OPrepared Statement
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    ;

    
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        // fetch All the Post 

        try {

            String q = "select * from posts order by pid desc ";
            PreparedStatement pstmt = con.prepareStatement(q);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");

                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userid = set.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userid);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    ;
    
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();

        // get All by post by CatId
        try {

            String q = "select * from posts where catId=?";
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setInt(1, catId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");

                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userid = set.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userid);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) {

        Post post = null;

        try {
            String query = "SELECT * FROM posts WHERE pid=?";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, postId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int pid = resultSet.getInt("pid");
                String pTitle = resultSet.getString("pTitle");
                String pContent = resultSet.getString("pContent");
                String pCode = resultSet.getString("pCode");
                String pPic = resultSet.getString("pPic");
                Timestamp date = resultSet.getTimestamp("pDate");
                int cid = resultSet.getInt("catId");
                int userId = resultSet.getInt("userId");

                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
     
        return post;
    }
}

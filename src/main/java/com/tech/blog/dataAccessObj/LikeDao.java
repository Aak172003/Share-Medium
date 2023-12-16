package com.tech.blog.dataAccessObj;

import java.sql.Connection;
import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean InsertLike(int pid, int uid) {

        boolean f = false;
        try {

            String q = "insert into liked(pid , uid)values(? , ?)";

            // Create a OPrepared Statement
            PreparedStatement pstmt = con.prepareStatement(q);

            // values Set ..... 
            // 1st and 2nd Question Mark .....
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int CountLikePost(int pid) {
        int count = 0;

        try {
            String q = "select count(*) from liked where pid=?";

            // Create a OPrepared Statement
            PreparedStatement pstmt = con.prepareStatement(q);

            // values Set ..... 
            pstmt.setInt(1, pid);

            pstmt.executeQuery();

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                count = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    //    Check is liked or not 
    public boolean CheckLikedOrNot(int pid, int uid) {
        boolean f = false;
        try {

            String q = "select * from liked where pid=? and uid=?";

            // Create a OPrepared Statement
            PreparedStatement pstmt = con.prepareStatement(q);

            // values Set ..... 
            // 1st and 2nd Question Mark .....
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            pstmt.executeQuery();

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //    Check is liked or not 
    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {

            String q = "delete from liked where pid=? and uid=?";

            // Create a OPrepared Statement
            PreparedStatement pstmt = con.prepareStatement(q);

            // values Set ..... 
            // 1st and 2nd Question Mark .....
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            pstmt.executeUpdate();
            
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}

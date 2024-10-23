/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shubh
 */
public class RegisterUtil {

    static Connection conn = null;

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookdb";
            conn = DriverManager.getConnection(url, "root", "");
            System.out.println("Connection ==========> ");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conn;
    }

    public static void insertUser(Connection conn, User u) {
        String sql = "insert into user values(?,?,?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.uEmail);
            ps.setString(2, u.uName);
            ps.setString(3, u.uPassword);
            ps.setString(4, u.uPhone);

            ps.executeUpdate();

            System.out.println("========> Data Inserted Successfully <========");
        } catch (SQLException ex) {
            Logger.getLogger(RegisterUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static User checkValid(Connection conn, String uEmail, String uPassword) {
        User user = null;

        try {

            String query = "select * from user where uEmail=? AND uPassword=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, uEmail);
            ps.setString(2, uPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println(rs.getString("uEmail"));
                user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            } else {
                user = null;
                System.out.println("User NUll ========> NULL USER");
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegisterUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }
}

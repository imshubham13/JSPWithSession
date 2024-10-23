package CRUD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBCUtil {

    public static Connection getConnection() {
        Connection conn = null;
        try {

            //Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookdb";
            //Database connection create
            conn = DriverManager.getConnection(url, "root", "");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(JDBCUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }

    // Insert Data
    public static void insertData(Connection conn, Book b) {

        String sql = "insert into book values(?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, b.getBookId());
            ps.setString(2, b.getBookTitle());
            ps.setInt(3, b.getBookPrice());

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Display Data
    public static List displayData(Connection conn) {

        List<Book> lst = new ArrayList<>();

        String sql = "select * from book";

        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book book = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3));
                lst.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lst;
    }

    // Delete Data
    public static void deleteData(Connection conn, int bookId) {

        String sql = "delete from book where bookId=?";

        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Update Data
    public static void updateData(Connection conn,int bookId,String bookTitle,int bookPrice)
    {
        try {
            String sql = "update book set bookTitle=?, bookPrice=? where bookId=?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookTitle);
            ps.setInt(2, bookPrice);
            ps.setInt(3, bookId);
            
            ps.executeUpdate();
            
            System.out.println("Data Updated Successfully ==========>");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

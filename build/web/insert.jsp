<%-- 
    Document   : insert
    Created on : 13 Oct, 2024, 9:37:50 AM
    Author     : shubh
--%>

<%@page import="CRUD.Book"%>
<%@page import="CRUD.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
        <h1>Insert Data</h1>

        <%
            Connection conn = JDBCUtil.getConnection();

            String action = request.getParameter("action");

            if (action != null && action.equals("insert")) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                String bookTitle = request.getParameter("bookTitle");
                int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));

                Book b = new Book(bookId, bookTitle, bookPrice);

                JDBCUtil.insertData(conn, b);

                request.getRequestDispatcher("display.jsp").forward(request, response);
        %>
        <p>Data Inserted</p>        
        <%
        } else {
        %>
        <p>Nothing yet</p>
        <%
            }
        %>
        <form action="insert.jsp?action=insert" method="post">
            <input type="hidden" name="action" value="insert"/>
            <table>
                <tr>
                    <td>Book Id : </td>
                    <td><input type="text" placeholder="Enter ID" name="bookId"/> </td>
                </tr>
                <tr>
                    <td>Book Title : </td>
                    <td><input type="text" placeholder="Enter Title" name="bookTitle"/> </td>
                </tr>
                <tr>
                    <td>Book Price : </td>
                    <td><input type="text" placeholder="Enter Price" name="bookPrice"/> </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="Insert"/> </td>
                </tr>
            </table>
        </form>
    </body>
</html>

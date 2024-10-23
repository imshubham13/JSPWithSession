<%-- 
    Document   : display
    Created on : 13 Oct, 2024, 9:44:07 AM
    Author     : shubh
--%>

<%@page import="java.sql.Connection"%>
<%@page import="CRUD.JDBCUtil"%>
<%@page import="CRUD.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Page</title>
    </head>
    <body>
        <%
            Connection conn = JDBCUtil.getConnection();
            System.out.println("Connection Successfully ==================>");
        %>

        <%
            String actionDelete = request.getParameter("action");
            if (actionDelete != null && actionDelete.equals("delete")) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                JDBCUtil.deleteData(conn, bookId);
            }
        %>
        <h1>Display Data</h1>

        <a href="insert.jsp">Add Record</a>
        <br>
        <br>
        <table cellspacing="0" cellpadding="10" border="1">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Book Title</th>
                    <th>Book Price</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Book> blist = JDBCUtil.displayData(conn);

                    for (Book b : blist) {
                %>
                <tr>
                    <td><%= b.getBookId()%></td>
                    <td><%= b.getBookTitle()%></td>
                    <td><%= b.getBookPrice()%></td>
                    <td><a href="update.jsp?action=update&bookId=<%= b.getBookId()%>&bookTitle=<%=b.getBookTitle()%>&bookPrice=<%=b.getBookPrice()%>">Edit</a></td>
                    <td><a href="display.jsp?action=delete&bookId=<%= b.getBookId()%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>

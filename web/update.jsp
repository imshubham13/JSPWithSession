<%-- 
    Document   : update
    Created on : 14 Oct, 2024, 7:06:25 PM
    Author     : shubh
--%>

<%@page import="CRUD.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1>Update Record</h1>

        <%
            Connection conn = JDBCUtil.getConnection();
            String action = request.getParameter("action");

            if (action != null && action.equals("update")) {

                int bookId = Integer.parseInt(request.getParameter("bookId"));
                String bookTitle = request.getParameter("bookTitle");
                int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));

                JDBCUtil.updateData(conn, bookId, bookTitle, bookPrice);
                
//                request.getRequestDispatcher("display.jsp").forward(request, response);
        %>
        <p>Updated Successfully</p>
        <%  } else { %>
        <p>Not yet Done</p>
        <%
            }
        %>


        <form action="update.jsp?action=update" method="post">
            <input type="hidden" name="action" value="update"/>
            <table>
                <tr>
                    <td>Book Id : </td>
                    <td><input type="text" name="bookId" value="<%= request.getParameter("bookId")%>"/> </td>
                </tr>
                <tr>
                    <td>Book Title : </td>
                    <td><input type="text" name="bookTitle" value="<%= request.getParameter("bookTitle")%>"/> </td>
                </tr>
                <tr>
                    <td>Book Price : </td>
                    <td><input type="text" name="bookPrice" value="<%=  request.getParameter("bookPrice")%>"/> </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="Update"/> </td>
                </tr>
            </table>
        </form>
    </body>
</html>

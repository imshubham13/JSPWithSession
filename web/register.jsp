<%-- 
    Document   : register
    Created on : 13 Oct, 2024, 9:57:14 AM
    Author     : shubh
--%>

<%@page import="Register.User"%>
<%@page import="Register.RegisterUtil"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <%
            Connection conn = RegisterUtil.getConnection();

            String action = request.getParameter("action");

            if (action != null && action.equals("insert")) {
                String uEmail = request.getParameter("uEmail");
                String uName = request.getParameter("uName");
                String uPassword = request.getParameter("uPassword");
                String uPhone = request.getParameter("uPhone");

                User user = new User(uEmail, uName, uPassword, uPhone);

                RegisterUtil.insertUser(conn, user);

                request.getRequestDispatcher("login.jsp").forward(request, response);
        %>
        <p>Record Inserted</p>
        <%         } else {
        %>
        <p>Something Wrong</p>
        <%
            }
        %>
        <h1>Registration Form</h1>
        <form action="register.jsp?action=insert" method="post">
            <input type="hidden" name="action" value="register"/>
            <table>
                <tr>
                    <td>Enter Email : </td>
                    <td><input type="email" placeholder="Enter Email" name="uEmail"/> </td>
                </tr>
                <tr>
                    <td>Enter Name : </td>
                    <td><input type="text" placeholder="Enter Name" name="uName"/> </td>
                </tr>
                <tr>
                    <td>Enter Password : </td>
                    <td><input type="password" placeholder="Enter Password" name="uPassword"/> </td>
                </tr>
                <tr>
                    <td>Enter Phone No. : </td>
                    <td><input type="text" placeholder="Enter Phone Number" name="uPhone"/> </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="Register"/> </td>
                </tr>
            </table>
        </form>
    </body>
</html>

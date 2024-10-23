<%-- 
    Document   : login
    Created on : 13 Oct, 2024, 9:52:20 AM
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
        <title>Login Page</title>
    </head>
    <body>
        <%
            Connection conn = RegisterUtil.getConnection();

            String action = request.getParameter("action");
            
            if (action != null) {
                if (action.equals("login")) {
                    String email = request.getParameter("uEmail");
                    String password = request.getParameter("uPassword");

                    User user = RegisterUtil.checkValid(conn, email, password);

                    if (user != null) {
                        session.setAttribute("uEmail", email);
                        session.setAttribute("uPassword", password);

                        request.getRequestDispatcher("display.jsp").forward(request, response);
        %>
            <%
                } else {
            %>
                <p>Please Enter Valid Email and Password</p>
                
        <%
                        System.out.println(" ===========> No user Found <==========");
                }
                } else if (action.equals("logout")) {
                    session.removeAttribute("uEmail");
                    session.removeAttribute("uPassword");
                }
            }   
        %>

        <%= "Session ID " + session.getId() + " " + session.getAttribute("uEmail")%>
        
        <h1>Log In</h1>
        <form action="login.jsp?action=login" method="post">
            <input type="hidden" name="action" value="login"/>
            <table>
                <tr>
                    <td>Enter Email : </td>
                    <td><input type="email" placeholder="Enter Email" name="uEmail"/> </td>
                </tr>
                <tr>
                    <td>Enter Password : </td>
                    <td><input type="password" placeholder="Enter Password" name="uPassword"/> </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="Login"/> </td>
                </tr>
            </table>
        </form>
        Not a register? <a href="./register.jsp">Register</a>
    </body>
</html>

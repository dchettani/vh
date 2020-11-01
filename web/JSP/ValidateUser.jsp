<%-- 
    Document   : ValidateUser
    Created on : 17/10/2020, 09:20:32 AM
    Author     : Aldo Cardenas Toledo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Usuario where User='" + userid + "' and Password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("User", userid);
         response.sendRedirect("../Principal.html");
    } else {
       //response.sendRedirect("errorLogin.jsp");      
        out.println("<center><h1>Vuelva a Ingresar</h1></center>");
         out.println("<center><a href='../Login.html'>Ir a Login</a></center>");
    }
    %>
    </body>
</html>


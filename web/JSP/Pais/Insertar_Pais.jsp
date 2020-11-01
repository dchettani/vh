<%-- 
    Document   : Insertar_Pais
    Created on : 17/10/2020, 10:30:19 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Agregar Datos de Usuario</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../../CSS/EstiloListadoPais.css"/>
</head>

<body>
<center>
<%
  String Codigo=request.getParameter("Codigo");
  String Nombre=request.getParameter("Nombre");
   ResultSet tabla= null;
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();

//OJO: Todo en una Fila !!!
 String Consulta="Insert Pais (IdPais,Nombre)" +  "Values ('" + Codigo + "','" + Nombre + "')";
  
            int res = st.executeUpdate(Consulta);

              if (res == 1) {
              response.sendRedirect("Listado_Pais.jsp");
              } else {
                 out.println("error");
    }
 
   cn.close();

}catch(SQLException ex){
   response.sendRedirect("JspError.jsp");
   out.println("<h2>No se tuvo exito en la Grabación ! </h2>");
  
    while (ex!=null){
         out.println("Número de Error de SQL <h3>" + ex.getErrorCode() + "<p></h3>");
         out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "</h3>");
         ex=ex.getNextException();
   }//fin de while
  
  
}catch(Exception e){
   out.println("<h2>Error, consulte con el Administrador del Sitio Web ! </h2>" + e.getMessage());
}
%>

<p><a href="../index.html">Volver a Menú Principal </a>
</center>
</html>



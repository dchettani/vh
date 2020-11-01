<%-- 
    Document   : Listado_Reserva
    Created on : 17/10/2020, 10:30:19 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../CSS/EstiloListadoPasajero.css"/>
    </head>
    <body>
         <%
              ResultSet tabla=null;
  
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
                 Statement st=cn.createStatement();

       out.println("<h1 align=\"center\"><font color='Black'>Listado de Reserva</font></h1>");
       out.println("<center>");
        out.println("<form>'");
        tabla=st.executeQuery("Select * from Reserva");
	out.println("<table border=0 name='Tablas'>");
	out.println("<tr><th bgcolor=#8258FA><font color=white>Codigo</font></th><th bgcolor=#8258FA>"
                + "<font color=white>Costo</font></th><th bgcolor=#8258FA><font color=white>Observacion</font></th>"
                + "<th bgcolor=#FE9A2E><font color=white>MODIFICAR</font></th>"
                + "<th bgcolor=#FE9A2E><font color=white>ELIMINAR</font></th>"
                + "</tr>");
 
	while(tabla.next()) {
		out.println("<tr class='Todo'><td >" + tabla.getString("IdReserva") + "</td><td>" + tabla.getString("Costo") + "</td>"
                        + "<td >" + tabla.getString("Observacion") + "</td>"
                        + "<td Class='Miguel'>" + "<a href=Actualizar_Reserva.jsp?Codigo=" + tabla.getString("IdReserva")+ " class='Enlace3'>" + "<img src='../../IMG/Modificar.png' width=40>"+ "</a>"+"</td>"
                        + "<td Class='Miguel'>" + "<a href=Eliminar_Reserva.jsp?Codigo=" + tabla.getString("IdReserva")+ " class='Enlace3'>" + "<img src='../../IMG/Eliminar.png' width=40>"+ "</a>"+"</td></tr>");
	}
        
        out.println("</table>");
    
         //ResultSet rs=st.executeQuery("Select DISTINCT '" + Nombre + "' from Productos");
        out.println("</form>'");
        out.println("</center>");
                 cn.close();

            }catch(SQLException ex){
                response.sendRedirect("JspError.jsp");
                out.println("<h2>No se tuvo exito en la Grabación ! </h2>");
  
                 while (ex!=null){
                 out.println("Número de Error de SQL <h3>" + ex.getErrorCode() + "<p></h3>");
                 out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "</h3>");
                 ex=ex.getNextException();
                 }
   
            }catch(Exception e){
                 out.println("<h2>Error, consulte con el Administrador del Sitio Web ! </h2>" + e.getMessage());
            }
            %>
    </body>
     <center>
        <a href="../../Reserva.html" class="EnlaceReserva">Volver al Menu Principal </a>
     </center>
</html>

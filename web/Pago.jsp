<%-- 
    Document   : Pago
    Created on : 17/10/2020, 10:20:30 AM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/EstiloPago.css"/>
    </head>
    <body>
        <% 
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_Vuelos","root","root");
                Statement st=cn.createStatement();
                
                out.println("<center><h1 class='Letra'><font color=orange>Formulario Pago</font></h1></center>");
                
                out.println("<div class='container'>");
                out.println("<form class='form__reg' name='Formulario' action='JSP/Pago/Insertar_Pago.jsp'>");
                
                out.println("<label for='apellido'>Reserva</label>");
                ResultSet rs=st.executeQuery("Select * from Reserva");
                out.println("<SELECT NAME='NombreReserva' class='input'>");
                String n="";
                String s="";
                    while(rs.next()) {
                     n=rs.getString("IdReserva");   
                     s=rs.getString("Observacion");
                     out.println("<OPTION VALUE='" + n + "'>" + s);
                 } 

                out.println("</Select>"); 
            
                out.println("<label for='apellido'>Fecha</label>");
                out.println("<input class='input' type=date name='Fecha'  placeholder='Ingrese la Fecha del Pago' required>");
                
                                out.println("<label for='apellido'>Pasajero</label>");
                ResultSet rs1=st.executeQuery("Select * from Pasajero");
                out.println("<SELECT NAME='NombrePasajero' class='input'>");
                String n1="";
                String s1="";
                    while(rs1.next()) {
                     n1=rs1.getString("IdPasajero");   
                     s1=rs1.getString("Nombre");
                     out.println("<OPTION VALUE='" + n1 + "'>" + s1);
                 } 
                out.println("</Select>");
    
                out.println("<label for='num'>Monto</label>");
                out.println("<input class='input' type=text name='monto'  placeholder='Ingrese el Monto' required>");
           
                out.println("<label for='fecha'>Tipo Comprobante</label>");
                out.println("<input class='input' type=text name='TipoC' placeholder='Ingrese el Tipo Comprobante' required>");
                
                out.println("<label for='telefono'>Numero Comprobante</label>");
                out.println("<input class='input' type=text name='NumC' placeholder='Ingrese el Numero Comprobante' required>");
           
                out.println("<div class='btn__form'>");
                out.println("<input class='btn__submit' type=submit value='Insertar Datos'>");
                out.println("</div>");
                out.println("</form>"); 
                out.println("</div>");
     
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
</html>

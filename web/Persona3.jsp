<%-- 
    Document   : Persona3
    Created on : 17/10/2020, 10:30:28 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/estiloPasajeros.css"/>
    </head>
    <body >
        <% 
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
                Statement st=cn.createStatement();
                
                out.println("<center><h1 class='Letra'><font color=orange>Formulario Pasajero</font></h1></center>");
                
                out.println("<div class='container'>");
                out.println("<form class='form__reg' name='Formulario' action='JSP/Pasajeros/InsertarPasajeros.jsp'>");
        
                out.println("<label for='nombre'>Nombre</label>");
                out.println("<input class='input' type=text name='Nombre' placeholder='Ingrese el Nombre' onclick='document.Formulario.enviar.disabled=!document.Formulario.enviar.disabled' required autofocus>");
            
                out.println("<label for='apellido'>Apellido</label>");
                out.println("<input class='input' type=text name='Apellido' placeholder='Ingrese el Apellido' required >");
            
                out.println("<label for='apellido'>Tipo de Documento</label>");
                out.println("<select class='input' name='Tipo'>");
                out.println("<option>DNI</option>");
                out.println(" <option>Carnet de Extranjeria</option>");
                out.println(" <option>Reg.Unico de Contribuyentes</option>");
                out.println("<option>Pasaporte</option>");
                out.println("<option>Part. de Nacimiento-Edentidad</option>");
                out.println("</select>");
    
                out.println("<label for='num'>Numero Documento</label>");
                out.println("<input class='input' type=text name='Numero'  placeholder='Ingrese el Numero de Documento' required>");
           
                out.println("<label for='fecha'>Fecha de Nacimiento</label>");
                out.println("<input class='input' type=date name='Fecha' step='1' min='2016-01-01' max='2016-12-31'>");

                out.println("<label for='fecha'>Nacionalidad</label>");
                ResultSet rs=st.executeQuery("Select * from Pais");
                out.println("<SELECT class='input' NAME='NombrePais'>");
                String n="";
                String s="";
                    while(rs.next()) {
                     n=rs.getString("IdPais");   
                     s=rs.getString("Nombre");
                     out.println("<OPTION VALUE='" + n + "'>" + s);
                 } 

                out.println("</Select>"); 
                out.println("<label for='telefono'>Telefono</label>");
                out.println("<input class='input' type=text name='Telefono' placeholder='Ingrese el Numero de Telefono' required>");
           
                out.println("<label for='correo'>Correo</label>");
                out.println("<input class='input' type=text name='Correo' placeholder='Ingrese el Correo' required>");
           
                out.println("<div class='btn__form'>");
                out.println("<input class='btn__submit' type=submit value='Insertar Datos'>");
                out.println("</div>");
                out.println("</form>"); 
                out.println("</div>");
    
                cn.close();

                }catch(SQLException ex){
                  /*  response.sendRedirect("JspError.jsp");
                      out.println("<h2>No se tuvo exito en la Grabación ! </h2>");
  
                      while (ex!=null){
                      out.println("Número de Error de SQL <h3>" + ex.getErrorCode() + "<p></h3>");
                      out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "</h3>");
                      ex=ex.getNextException();
                }
  */
                }catch(Exception e){
                 out.println("<h2>Error, consulte con el Administrador del Sitio Web ! </h2>" + e.getMessage());
                }
            
        %>
        </body>
</html>

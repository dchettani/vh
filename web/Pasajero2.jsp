<%-- 
    Document   : Pasajero2
    Created on : 17/10/2020, 10:30:01 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/estiloPasajeros.css"/>
        <title>JSP Page</title>
    </head>
    <body>
      
        <h1 class="Letra">Formulario Pasajero</h1>
        <form action="Pasajero2.jsp" method="post" >
                     
            <label for="nombre">Nombre</label>
            <input type="text" name="Nombre" placeholder="Ingrese el Nombre" required autofocus>
            
            <label for="apellido">Apellido</label>
            <input type="text" name="Apellido" placeholder="Ingrese el Apellido" required >
            
            <label>Tipo de Documento</label>
            <select name="Tipo">
                <option>DNI</option>
                <option>Carnet de Extranjeria</option>
                <option>Reg.Unico de Contribuyentes</option>
                <option>Pasaporte</option>
                <option>Part. de Nacimiento-Edentidad</option>
            </select>
            
            <label for="num">Numero Documento</label>
            <input type="text" name="Numero"  placeholder="Ingrese el Numero de Documento" required>
           
            <label for="fecha">Fecha de Nacimiento</label>
            <input type="date" name="Fecha" step="1" min="2016-01-01" max="2016-12-31" value="<?php echo date('Y-m-d');?>" required>
            
        <%
             
                  try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
                Statement st=cn.createStatement();

                ResultSet rs=st.executeQuery("Select * from Pais");
                out.println("Seleccione Pais   <SELECT NAME='NombrePais'>");
                String s="";
                    while(rs.next()) {
                     s=rs.getString("IdPais");
                     out.println("<OPTION VALUE='" + s + "'>" + s);
                 } //fin while

                out.println("</Select>");          
                
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
    <label for="telefono">Telefono</label>
            <input type="text" name="Telefono" placeholder="Ingrese el Numero de Telefono" required>
           
            <label for="correo">Correo</label>
            <input type="text" name="Correo"  placeholder="Ingrese el Correo" required>
           
            <input type="submit" value="Insertar Datos" >
        </form>
     <%
             
                  try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agencia_vuelos","root","123");
                Statement st=cn.createStatement();
       
            String Codigo=request.getParameter("Codigo");
            String Nombre=request.getParameter("Nombre");
            String Apellido=request.getParameter("Apellido");
            String Tipo=request.getParameter("Tipo");
            String Numero=request.getParameter("Numero");
            String Fecha=request.getParameter("Fecha");
            String Pais=request.getParameter("NombrePais");
            String Telefono=request.getParameter("Telefono");
            String Correo=request.getParameter("Correo");
            
            st.execute("insert into Pasajero (Nombre,Apellido,Tipo_Documento,Num_Documento,Fecha_Nacimiento,IdPais,Telefono,Email)" + 
                         "values ('" + Nombre + "','" + Apellido + "','" + Tipo + "','" + Numero + "','" + Fecha + "','" + Pais + "','" + Telefono + "','" + Correo + "') ");

                 out.println("<h2>Se grabaron los Datos con Exito ! </h2>");
                
                cn.close();

                }catch(SQLException ex){
                   /* response.sendRedirect("JspError.jsp");
                    out.println("<h2>No se tuvo exito en la Grabación ! </h2>");
  
                while (ex!=null){
                out.println("Número de Error de SQL <h3>" + ex.getErrorCode() + "<p></h3>");
                 out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "</h3>");
                ex=ex.getNextException();
                }//fin de while
  
  */
                }catch(Exception e){
                 out.println("<h2>Error, consulte con el Administrador del Sitio Web ! </h2>" + e.getMessage());
                }
            
        %>
        </body>
</html>

<%-- 
    Document   : Actualizar_Pasajero1
    Created on : 17/10/2020, 10:30:19 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../CSS/estiloPasajeros.css"/>
    </head>
    <body>
       <%
   String Codigo=request.getParameter("Codigo");
  ResultSet tabla=null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();
    
     tabla=st.executeQuery("Select * from pasajero where IdPasajero= '" + Codigo + "'");

     while(tabla.next()){
         %>
         <center><h1 class='Letra'>Actualizar Datos del Pasajeros</h1></center>
         <div class='container'>
         <form class='form__reg' action="Actualizar_Pasajero2.jsp" style="margin: auto;">
            
            <input type="hidden" name="Codigo" value=<%out.println(tabla.getString("IdPasajero"));%>>
            
        
                <label for='nombre'>Nombre</label>
                <input class='input' type=text name='Nombre' placeholder='Ingrese el Nombre' value=<%out.println(tabla.getString("Nombre"));%> required >
            
                <label for='apellido'>Apellido</label>
                <input class='input' type=text name='Apellido' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Apellido"));%> required >
            
                <label for='apellido'>Tipo de Documento</label>
                <select  name='Tipo' class='input'>
                <option><%out.println(tabla.getString("Tipo_Documento"));%></option>
                <option>DNI</option>
                <option>Carnet de Extranjeria</option>
                <option>Reg.Unico de Contribuyentes</option>
                <option>Pasaporte</option>
                <option>Part. de Nacimiento-Edentidad</option>
                </select>
    
                <label for='num'>Numero Documento</label>
                <input class='input' type=text name='Numero'  placeholder='Ingrese el Numero de Documento' value=<%out.println(tabla.getString("Num_Documento"));%> required>
           
                <label for='fecha'>Fecha de Nacimiento</label>
                <input class='input' type=date name='Fecha' step='1' min='2016-01-01' max='2016-12-31' value=<%out.println(tabla.getString("Fecha_Nacimiento"));%>>

                 <label for='telefono'>Telefono</label>
                <input class='input' type=text name='Telefono' placeholder='Ingrese el Numero de Telefono' value=<%out.println(tabla.getString("Telefono"));%> required>
           
                <label for='correo'>Correo</label>
                <input class='input' type=text name='Correo' placeholder='Ingrese el Correo' value=<%out.println(tabla.getString("Email"));%> required>
                
                <div class='btn__form'>
                <input class='btn__submit' type="submit" value="Actualizar Datos" style="font-size: 12pt;">
                </div>
                </form>
                </div>
           
           <%
               }
               tabla.close();

    cn.close();
}
catch(SQLException ex){
/*
   out.println("<h2> No se tuvo exito en la Actualización por: </h2>");

   while (ex!=null){

         out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "<p></h3>");
         ex=ex.getNextException();
   }//fin de while
*/
} //fin catch

catch(Exception e){
     out.println("<h2>Error en la Actualización de Datos! </h2>" + e.getMessage());
}

%>
    </body>
      <center>
          <a href="Listado_Pasajero.jsp" class="Enlace2">Volver al Menu Principal</a>
     </center>
</html>


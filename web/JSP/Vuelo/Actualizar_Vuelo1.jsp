<%-- 
    Document   : Actualizar_Vuelo1
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
        <link rel="stylesheet" href="../../CSS/EstiloVuelo.css"/>
    </head>
    <body>
        <%
   String Codigo=request.getParameter("Codigo");
  ResultSet tabla=null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();
    
     tabla=st.executeQuery("Select * from Vuelo where IdAvion= '" + Codigo + "'");

     while(tabla.next()){
         %>
           <form action="Actualizar_Vuelo2.jsp" style="margin: auto;">
            
            <input type="hidden" name="Codigo" value=<%out.println(tabla.getString("IdAvion"));%>>
            
        
                <label for='nombre'>Reserva</label>
                <input type=text name='Reserva' placeholder='Ingrese el Codigo Reserva' value=<%out.println(tabla.getString("IdReserva"));%> required >
            
                <label for='apellido'>Nombre Aeropuerto</label>
                <input type=text name='Nombre' placeholder='Ingrese el Nombre' value=<%out.println(tabla.getString("Nombre_Aeropuerto"));%> required >

                <label for='apellido'>Pais Aeropuerto</label>
                <input type=text name='Pais' placeholder='Ingrese el Pais' value=<%out.println(tabla.getString("Pais_Aeropuerto"));%> required >

                <label for='apellido'>Tarifa</label>
                <input type=text name='Tarifa' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Tarifa"));%> required >

                <label for='apellido'>Asiento</label>
                <input type=text name='Asiento' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Asiento"));%> required >

                <input type="submit" value="Actualizar Datos" style="font-size: 12pt;">
                </form>
           
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
</html>

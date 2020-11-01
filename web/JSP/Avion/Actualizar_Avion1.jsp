<%-- 
    Document   : Actualizar_Avion1
    Created on : 17/10/2020, 10:30:08 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../CSS/EstiloAvion.css"/>
    </head>
    <body>
        <%
   String Codigo=request.getParameter("Codigo");
  ResultSet tabla=null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();
    
     tabla=st.executeQuery("Select * from Avion where IdAvion= '" + Codigo + "'");

     while(tabla.next()){
         %>
         
         <center><h1>Actualizar Datos</h1></center>
         <div class="container">
         <form class="form__reg" action="Actualizar_Avion2.jsp" style="margin: auto;">
            
            <input type="hidden" name="Codigo" value=<%out.println(tabla.getString("IdAvion"));%>>
            
        
                <label for='nombre'>Costo</label>
                <input class="input" type=text name='Aerolinea' placeholder='Ingrese el Nombre' value=<%out.println(tabla.getString("Aerolinea"));%> required >
            
                <label for='apellido'>Observacion</label>
                <input class="input" type=text name='Tipo' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Tipo"));%> required >

                <label for='apellido'>Observacion</label>
                <input class="input" type=text name='Capacidad' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Capacidad"));%> required >
                
                <div class="btn__form">
            	<input class="btn__submit" type="submit" value="Actualizar Datos">            		
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
</html>

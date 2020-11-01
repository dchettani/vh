<%-- 
    Document   : Actualizar_Usuario
    Created on : 17/10/2020, 10:30:19 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../CSS/EstiloUsuario.css"/>
    </head>
    <body>
        <%
   String Codigo=request.getParameter("Codigo");
  ResultSet tabla=null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();
    
     tabla=st.executeQuery("Select * from Usuario where IdUsuario= '" + Codigo + "'");

     while(tabla.next()){
         %>
               <center><h1 class="Titulo">Actualizar Datos del Usuario</h1></center>
        <div class="container">
	
         
        <form class="form__reg" action="Actualizar_Usuario2.jsp">
            
        <input type="hidden" name="Codigo" placeholder="Ingrese el Codigo" class="input" required value=<%out.println(tabla.getString("IdUsuario"));%>>
        
        <label>Nombres</label>
        <input type="text" name="Nombre" placeholder="Ingrese los Nombres" class="input" autofocus required value=<%out.println(tabla.getString("Nombres"));%>>
        
        <label>Apellidos</label>
        <input type="text" name="Apellido" placeholder="Ingrese los Apellidos" class="input" required value=<%out.println(tabla.getString("Apellidos"));%>>

        <label>Fecha_Nacimiento</label>
        <input type="date" name="Fecha" class="input" required value=<%out.println(tabla.getString("Fecha_Nacimiento"));%>>
        
        <label>Direccion</label>
        <input type="text" name="Direccion" placeholder="Ingrese la Direccion" class="input" required value=<%out.println(tabla.getString("Direccion"));%>>
         
        <label>Telefono</label>
        <input type="text" name="Telefono" placeholder="Ingrese el Telefono" class="input" required value=<%out.println(tabla.getString("Telefono"));%>>
        
        <label>Usuario</label>
        <input type="text" name="Usuario" placeholder="Ingrese el Logeo Usuario" class="input" required value=<%out.println(tabla.getString("User"));%>>
        
        <label>Contraseña</label>
        <input type="text" name="Password" placeholder="Ingrese el Logeo Contraseña" class="input" required value=<%out.println(tabla.getString("Password"));%>>
                
       <div class="btn__form">
            	<input class="btn__submit" type="submit" value="ACTUALIZAR DATOS">            		
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

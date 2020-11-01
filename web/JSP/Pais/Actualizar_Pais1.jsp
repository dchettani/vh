<%-- 
    Document   : Actualizar_Pais1
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
        <link rel="stylesheet" href="../../CSS/estilo.css"/>
    </head>
    <body>
        <%
   String Codigo=request.getParameter("Codigo");
  ResultSet tabla=null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();
    
     tabla=st.executeQuery("Select * from pais where IdPais= '" + Codigo + "'");



     while(tabla.next()){
         %>
         
    <center><h1>Actualizar Pais</h1></center>
           <form action="Actualizar_Pais.jsp" style="margin: auto;">
            <input type="hidden" name="Codigo" value=<%out.println(tabla.getString("IdPais"));%>/>
           <!-- <input type="text" name="Codigo" id="nombre" placeholder="Ingrese el Codigo" 
                   autofocus required>-->          
            <label for="nombre">Nombre</label>
            <input style="font-size: 12pt;" type="text" name="Nombre" id="nombre" value=<%out.println(tabla.getString("Nombre"));%>>
            <br><p>
             <input type="submit" value="Actualizar Datos" style="font-size: 12pt;">
        </form>
           
           <%
               }
               tabla.close();

    cn.close();
}
catch(SQLException ex){
   out.println("<h2> No se tuvo exito en la Actualización por: </h2>");

   while (ex!=null){

         out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "<p></h3>");
         ex=ex.getNextException();
   }//fin de while

} //fin catch

catch(Exception e){
     out.println("<h2>Error en la Actualización de Datos! </h2>" + e.getMessage());
}

%>
    </body>
</html>

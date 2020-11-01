<%-- 
    Document   : Actualizar_Pago1
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
        <link rel="stylesheet" href="../../CSS/EstiloPago.css"/>
    </head>
    <body>
         <%
   String Codigo=request.getParameter("Codigo");
  ResultSet tabla=null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();
    
     tabla=st.executeQuery("Select * from Pago where IdPago= '" + Codigo + "'");

     while(tabla.next()){
         %>
          <center><h1>Actualizar Pago</h1></center>
         <div class="container">
         <form class="form__reg" action="Actualizar_Pago2.jsp" style="margin: auto;">
            
            <input type="hidden" name="Codigo" value=<%out.println(tabla.getString("IdPago"));%>>    
        
                <label for='nombre'>Reserva</label>
                <input class="input" type=text name="Reserva" placeholder='Ingrese el Nombre' value=<%out.println(tabla.getString("IdReserva"));%> required >
            
                <label for='apellido'>Fecha</label>
                <input class="input" type=text name='fecha' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Fecha"));%> required >

                <label for='apellido'>Pasajero</label>
                <input class="input" type=text name='Pasajero' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("IdPasajero"));%> required >

                <label for='apellido'>Monto</label>
                <input class="input" type=text name='Monto' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Monto"));%> required >

                <label for='apellido'>Tipo Comprobante</label>
                <input class="input" type=text name='Tipo' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Tipo_Comprobante"));%> required >

                <label for='apellido'>Numero Comprobante</label>
                <input class="input" type=text name='Numero' placeholder='Ingrese el Apellido' value=<%out.println(tabla.getString("Num_Comprobante"));%> required >

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

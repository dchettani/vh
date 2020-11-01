<%-- 
    Document   : Actualizar_Pasajero2
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
    </head>
    <body>
        <%
   String Codigo=request.getParameter("Codigo");
  String Nombre=request.getParameter("Nombre");
  String Apellido=request.getParameter("Apellido");
  String Tipo=request.getParameter("Tipo");
  String Numero=request.getParameter("Numero");
  String Fecha=request.getParameter("Fecha");
  String Pais =request.getParameter("NombrePais");
  String Telefono=request.getParameter("Telefono");
  String Correo=request.getParameter("Correo");
  

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
    Statement st=cn.createStatement();

    String Consulta="UPDATE Pasajero SET Nombre= '" + Nombre + "', Apellido= '" + Apellido + "', Tipo_Documento= '" + Tipo + "', Num_Documento= '" + Numero + "',Fecha_Nacimiento= '" + Fecha + "',Telefono= '" + Telefono + "',Email= '" + Correo + "' WHERE IdPasajero=" + Codigo;

              int res = st.executeUpdate(Consulta);

              if (res == 1) {
                  response.sendRedirect("Listado_Pasajero.jsp");
              //out.println("<script>alert('El registro se modifico correctamente')</script>");
                    //out.println("<meta http-equiv='refresh' content='0;url=tabla.jsp'");
              } else {
                 out.println("error");
    }
    
  
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

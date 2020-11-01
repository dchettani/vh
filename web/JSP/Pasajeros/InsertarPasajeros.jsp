<%-- 
    Document   : InsertarPasajeros
    Created on : 17/10/2020, 10:30:19 PM
    Author     : Aldo Cardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%

            String Codigo=request.getParameter("Codigo");
            String Nombre=request.getParameter("Nombre");
            String Apellido=request.getParameter("Apellido");
            String Tipo=request.getParameter("Tipo");
            String Numero=request.getParameter("Numero");
            String Fecha=request.getParameter("Fecha");
            String Pais=request.getParameter("NombrePais");
            String Telefono=request.getParameter("Telefono");
            String Correo=request.getParameter("Correo");
            ResultSet tabla=null;
  
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vuelos_humanitarios?useTimezone=true&serverTimezone=UTC&characterEncoding=utf8","root","root");
                 Statement st=cn.createStatement();

                 String Consulta ="insert into Pasajero (Nombre,Apellido,Tipo_Documento,Num_Documento," + "Fecha_Nacimiento,"
                         + "IdPais,Telefono,Email)" + "values ('" + Nombre + "','" + Apellido + "','" + Tipo + "','" + Numero
                         + "'," + "'" + Fecha + "','" + Pais + "','" + Telefono + "','" + Correo + "')";
                int res = st.executeUpdate(Consulta);
              if (res == 1) {                 
              //out.println("<script>alert('El registro se modifico correctamente')</script>");
                    //out.println("<meta http-equiv='refresh' content='0;url=tabla.jsp'");
                    response.sendRedirect("Listado_Pasajero.jsp");
              } else {
                 out.println("error");
    }
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

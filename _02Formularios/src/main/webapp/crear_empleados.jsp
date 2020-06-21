<%-- 
    Document   : crear_empleados
    Created on : 21-jun-2020, 11:51:26
    Author     : Randy
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Crear-Empleados</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                </div>
            </div>
            <div class="row">
                <div class="col col-sm">
                    <form action="crear_empleados.jsp" method="get">

                        <div class="form-group">
                            <label for="inputEmail4">Nombre</label>
                            <input type="text" class="form-control" id="inputEmail4" name="nombre" placeholder="Nombre Apellido" required="required">
                        </div>

                        <div class="form-group">
                            <label for="inputAddress">Dirección</label>
                            <input type="text" class="form-control" id="inputAddress" name="direccion" placeholder="Calle Nombre, Número">
                        </div>
                        <div class="form-group">
                            <label for="inputCity">Teléfono</label>
                            <input type="text" class="form-control" id="inputCity" name="telefono">
                        </div>
                        <button onclick="hola();" class="btn btn-primary" name="guardar"><i class="fa fa-floppy-o" aria-hidden="true"></i>
                            Guardar</button>
                    </form>
                </div>
            </div>
             
        </div>
        <%
            if (request.getParameter("guardar") != null) {
                request.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                String nombre = new String(request.getParameter("nombre").getBytes("iso-8859-1"),"utf-8");                
                String direccion = new String(request.getParameter("direccion").getBytes("iso-8859-1"),"utf-8");
                String telefono = new String(request.getParameter("telefono").getBytes("iso-8859-1"),"utf-8");
                Connection con = null;
                Statement st = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/pronovato_jsp_2020?user=root&password=");
                    st = con.createStatement();
                    String sql = ("INSERT INTO empleados (nombre,direccion,telefono) values ('" + nombre + "','" + direccion + "','" + telefono + "');");

                    st.execute(sql);
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                request.getRequestDispatcher("empleados.jsp").forward(request, response);
            }
        %>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</html>
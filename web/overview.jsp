<%-- 
    Document   : overview
    Created on : Jun 1, 2023, 2:08:21 PM
    Author     : duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if (session != null && session.getAttribute("email") != null) {%>


    <% } else { %>
    <% response.sendRedirect("login.jsp"); %>
    <% }%>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

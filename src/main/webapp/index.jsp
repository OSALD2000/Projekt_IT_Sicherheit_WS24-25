<%@ page import="Model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Startseite</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container">
    <h1>Willkommen auf der Homepage</h1>
    <%
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) {
    %>
    <p>Bitte loggen Sie sich ein oder registrieren Sie sich, um fortzufahren.</p>
    <a href="login.jsp">Zum Login / Registrierung</a>
    <%
     } else {
    %>
    <p>Hallo <%= user.getUsername()%></p>
    <%
        }
    %>
</div>
</body>
</html>

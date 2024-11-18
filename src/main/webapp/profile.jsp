<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Model.User" %>
<%@ page import="Model.UserArray" %>


<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container profile">
    <% User user = (User) session.getAttribute("loggedUser"); %>

    <h2>Willkommen, <%= user.getUsername() %>!</h2>

    <h3>Profilbild ändern</h3>
    <form action="uploadImageServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="profileImage" accept="image/*" required />
        <button type="submit">Hochladen</button>
    </form>

    <div class="profile-info">
        <img src="<%= request.getContextPath() + "/images/" + user.getProfileImage() %>" alt="Profilbild" class="profile-img">

        <p>Benutzername: <%= user.getUsername() %></p>
        <p><%= user.getEmail() %></p>
    </div>
    <a href="logoutServlet">Logout</a>
</div>
</body>
</html>

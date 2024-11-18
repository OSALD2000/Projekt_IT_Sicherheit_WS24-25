<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Registrierung</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form action="loginServlet" method="post">
        <div class="form-group">
            <label for="username">Benutzername:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Passwort:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Anmelden</button>
    </form>

    <h2>Oder Registrieren</h2>
    <form action="registerServlet" method="post">
        <div class="form-group">
            <label for="new_username">Benutzername:</label>
            <input type="text" id="new_username" name="new_username" required>
        </div>
        <div class="form-group">
            <label for="new_email">Email:</label>
            <input type="email" id="new_email" name="new_email" required>
        </div>
        <div class="form-group">
            <label for="new_password">Passwort:</label>
            <input type="password" id="new_password" name="new_password" required>
        </div>
        <button type="submit">Registrieren</button>
    </form>
</div>
</body>
</html>

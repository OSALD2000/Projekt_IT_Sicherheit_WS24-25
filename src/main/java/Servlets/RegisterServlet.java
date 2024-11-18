package Servlets;

import Model.User;
import Model.UserArray;

import java.io.*;
import javax.servlet.http.*;
import java.util.UUID;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException
    {
        String newUsername = request.getParameter("new_username");
        String newPassword = request.getParameter("new_password");
        String new_email = request.getParameter("new_email");

        User newUser = new User();
        newUser.setUsername(newUsername);
        newUser.setPassword(newPassword);
        newUser.setEmail(new_email);
        newUser.setProfileImage("non.jpg");
        newUser.setId(UUID.randomUUID().toString());

        UserArray.getUsers().add(newUser);

        response.sendRedirect("login.jsp");
    }
}

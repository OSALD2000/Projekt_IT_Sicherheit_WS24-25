package Servlets;

import Model.User;
import Model.UserArray;

import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        session.setAttribute("loggedUser", null);

        if (UserArray.isUser(username, password))
        {
            User user = UserArray.getUser(username, password);
            session.setAttribute("loggedUser", user);
            session.setAttribute("time", new Date().toString());
            session.setMaxInactiveInterval(10*60);
            request.setAttribute("id", user.getId());
            response.sendRedirect("profile.jsp");
        }
        else
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}

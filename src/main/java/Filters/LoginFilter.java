package Filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;


@WebFilter("/*")
public class LoginFilter implements Filter
{
    private static  final String[] protectedURL = {
        "profile.jsp", "/uploadImageServlet"
    };

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        boolean authenticated = (session != null && session.getAttribute("loggedUser") != null);
        String login = req.getContextPath() + "/login.jsp";

        boolean loginReq = req.getRequestURI().equals(login);
        boolean loginPag = req.getRequestURI().endsWith(login);

        if (!authenticated && protectedURL(req))
        {
            String page = "login.jsp";
            RequestDispatcher dispatcher = req.getRequestDispatcher(page);
            dispatcher.forward(request, response);
        } else if (authenticated && (loginReq || loginPag))
        {
            String page = "profile.jsp";
            RequestDispatcher dispatcher = req.getRequestDispatcher(page);
            dispatcher.forward(request, response);
        } else
        {
            chain.doFilter(request, response);
        }
    }

    private boolean protectedURL(HttpServletRequest req)
    {
        return Arrays.stream(protectedURL).sequential().anyMatch(url -> req.getRequestURI().endsWith(url));
    }
}

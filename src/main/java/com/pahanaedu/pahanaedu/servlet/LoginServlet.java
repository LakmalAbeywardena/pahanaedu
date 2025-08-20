package com.pahanaedu.pahanaedu.servlet;
import com.pahanaedu.pahanaedu.model.Customer;
import com.pahanaedu.pahanaedu.service.AuthService;
import com.pahanaedu.pahanaedu.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.*;
import javax.servlet.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private AuthService authService;

    @Override
    public void init() throws ServletException {
        try {
            authService = new AuthService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check if user is already logged in
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            // User already logged in, redirect to home
            resp.sendRedirect("home");
            return;
        }
        // Show login form
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        // Basic validation
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {
            req.setAttribute("error", "All fields are required");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        try {
            User authenticatedUser = authService.authenticate(username, password, role);

            if (authenticatedUser != null) {
                // Authentication successful
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userRole", authenticatedUser.getRole());
                session.setAttribute("isAdmin", "admin".equalsIgnoreCase(authenticatedUser.getRole()));

                // Redirect to home page
                resp.sendRedirect("home");
            } else {
                req.setAttribute("error", "Invalid username, password, or role");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "System error. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
    private void ListUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
// Example: Dummy data list
        List<String> UsersLst = new ArrayList<>();
        UsersLst.add("Amal");
        UsersLst.add("Kamal");
        UsersLst.add("hj");
        UsersLst.add("Sunil");

        // send list to JSP
        request.setAttribute("UsrList", UsersLst);

        // forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
}
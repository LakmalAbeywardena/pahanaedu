package com.pahanaedu.pahanaedu.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check if user is logged in
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            // User not logged in, redirect to login
            resp.sendRedirect("login");
            return;
        }

        // User is logged in, show home page
        String username = (String) session.getAttribute("username");
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        String userRole = (String) session.getAttribute("userRole");

        req.setAttribute("username", username);
        req.setAttribute("isAdmin", isAdmin);
        req.setAttribute("userRole", userRole);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("logout".equals(action)) {
            // Handle logout
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect("login");
        } else {
            // Default to GET behavior
            doGet(req, resp);
        }
    }
}
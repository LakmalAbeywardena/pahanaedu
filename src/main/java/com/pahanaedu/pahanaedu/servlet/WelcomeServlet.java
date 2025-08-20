package com.pahanaedu.pahanaedu.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "WelcomeServlet", value = "")
public class WelcomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check if user is already logged in
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            // User is logged in, redirect to main app
            resp.sendRedirect("CustomerServlet");
        } else {
            // User not logged in, show welcome page
            req.getRequestDispatcher("welcome.jsp").forward(req, resp);
        }
    }
}
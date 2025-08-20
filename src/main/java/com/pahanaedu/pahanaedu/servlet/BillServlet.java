package com.pahanaedu.pahanaedu.servlet;

import com.pahanaedu.pahanaedu.service.BillingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "BillServlet", value = "/BillServlet")
//@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
    private BillingService billingService;

    @Override
    public void init() throws ServletException {
        try {
            billingService = new BillingService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountStr = req.getParameter("accountNumber");
        if (accountStr == null || accountStr.isEmpty()) {
            req.setAttribute("error", "Account Number is required");
            req.getRequestDispatcher("bill.jsp").forward(req, resp);
            return;
        }

        try {
            int accountNumber = Integer.parseInt(accountStr);
            double totalBill = billingService.calculateBill(accountNumber);
            req.setAttribute("totalBill", totalBill);
            req.setAttribute("accountNumber", accountNumber);
            req.getRequestDispatcher("bill.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("bill.jsp").forward(req, resp);
        }
    }
}

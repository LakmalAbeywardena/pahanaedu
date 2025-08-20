package com.pahanaedu.pahanaedu.servlet;

import com.pahanaedu.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.pahanaedu.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
//@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        try {
            customerDAO = new CustomerDAO();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null) action = "list";

            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                default:
                    listCustomers(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumberStr = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String unitsStr = request.getParameter("unitsConsumed");

        String errorMsg = null;

        // Basic validation
        if (name == null || name.trim().isEmpty()) {
            errorMsg = "Name is required";
        } else if (unitsStr == null || !unitsStr.matches("\\d+")) {
            errorMsg = "Units Consumed must be a number";
        }

        if (errorMsg != null) {
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("customer_form.jsp").forward(request, response);
            return;
        }

        int unitsConsumed = Integer.parseInt(unitsStr);

        try {
            if (accountNumberStr == null || accountNumberStr.isEmpty()) {
                // New customer
                Customer newCustomer = new Customer();
                newCustomer.setName(name);
                newCustomer.setAddress(address);
                newCustomer.setTelephone(telephone);
                newCustomer.setUnitsConsumed(unitsConsumed);
                customerDAO.addCustomer(newCustomer);
            } else {
                // Update existing
                int accountNumber = Integer.parseInt(accountNumberStr);
                Customer customer = new Customer(accountNumber, name, address, telephone, unitsConsumed);
                customerDAO.updateCustomer(customer);
            }
            response.sendRedirect("CustomerServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Customer> list = customerDAO.getAllCustomers();
        request.setAttribute("customerList", list);
        request.getRequestDispatcher("customer_list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("customer_form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer existingCustomer = customerDAO.getCustomerById(id);
        request.setAttribute("customer", existingCustomer);
        request.getRequestDispatcher("customer_form.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        // Implement delete method in DAO if needed
        // customerDAO.deleteCustomer(id);
        response.sendRedirect("CustomerServlet");
    }
}

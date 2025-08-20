package com.pahanaedu.pahanaedu.service;

import com.pahanaedu.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.pahanaedu.model.Customer;

public class BillingService {
    private static final double UNIT_PRICE = 10.0; // example: Rs. 10 per unit

    private CustomerDAO customerDAO;

    public BillingService() throws Exception {
        customerDAO = new CustomerDAO();
    }

    public double calculateBill(int accountNumber) throws Exception {
        Customer customer = customerDAO.getCustomerById(accountNumber);
        if (customer == null) {
            throw new Exception("Customer not found");
        }
        int units = customer.getUnitsConsumed();
        return units * UNIT_PRICE;
    }
}

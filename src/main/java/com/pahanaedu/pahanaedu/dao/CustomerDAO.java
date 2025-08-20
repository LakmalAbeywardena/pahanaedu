package com.pahanaedu.pahanaedu.dao;

import com.pahanaedu.pahanaedu.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    private Connection conn;

    public CustomerDAO() throws SQLException, ClassNotFoundException {
        conn = DBConnection.getInstance().getConnection();
    }

    public boolean addCustomer(Customer customer) throws SQLException {
        String sql = "INSERT INTO customers (name, address, telephone, units_consumed) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, customer.getName());
        ps.setString(2, customer.getAddress());
        ps.setString(3, customer.getTelephone());
        ps.setInt(4, customer.getUnitsConsumed());
        return ps.executeUpdate() > 0;
    }

    public boolean updateCustomer(Customer customer) throws SQLException {
        String sql = "UPDATE customers SET name=?, address=?, telephone=?, units_consumed=? WHERE account_number=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, customer.getName());
        ps.setString(2, customer.getAddress());
        ps.setString(3, customer.getTelephone());
        ps.setInt(4, customer.getUnitsConsumed());
        ps.setInt(5, customer.getAccountNumber());
        return ps.executeUpdate() > 0;
    }

    public Customer getCustomerById(int accountNumber) throws SQLException {
        String sql = "SELECT * FROM customers WHERE account_number=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, accountNumber);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Customer(
                    rs.getInt("account_number"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getInt("units_consumed")
            );
        }
        return null;
    }

    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customers";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            customers.add(new Customer(
                    rs.getInt("account_number"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getInt("units_consumed")
            ));
        }
        return customers;
    }
}

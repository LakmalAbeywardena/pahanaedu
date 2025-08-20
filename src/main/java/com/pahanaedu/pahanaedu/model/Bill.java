package com.pahanaedu.pahanaedu.model;

import java.util.Date;

public class Bill {
    private int billId;
    private int accountNumber;
    private Date billDate;
    private double totalAmount;

    public Bill() {}

    public Bill(int billId, int accountNumber, Date billDate, double totalAmount) {
        this.billId = billId;
        this.accountNumber = accountNumber;
        this.billDate = billDate;
        this.totalAmount = totalAmount;
    }

    // getters and setters
    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }
    public int getAccountNumber() { return accountNumber; }
    public void setAccountNumber(int accountNumber) { this.accountNumber = accountNumber; }
    public Date getBillDate() { return billDate; }
    public void setBillDate(Date billDate) { this.billDate = billDate; }
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}

package com.example.pttk.model;

import java.util.Date;

public class Order {
    private int idOrder;
    private int idCustomer;
    private Date orderDate;
    private double totalAmount;

    public Order() {
    }

    public Order(int idOrder, int idCustomer, Date orderDate, double totalAmount) {
        this.idOrder = idOrder;
        this.idCustomer = idCustomer;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Order{" +
                "idOrder=" + idOrder +
                ", idCustomer=" + idCustomer +
                ", orderDate=" + orderDate +
                ", totalAmount=" + totalAmount +
                '}';
    }
}

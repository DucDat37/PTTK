package com.example.pttk.model;

import java.util.Date;

public class Invoice {

    private int id;
    private Date date;
    private Order order;
    private SalesStaff salesStaff;

    public Invoice() {
    }

    public Invoice(int id, Date date, Order order, SalesStaff salesStaff) {
        this.id = id;
        this.date = date;
        this.order = order;
        this.salesStaff = salesStaff;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public SalesStaff getSalesStaff() {
        return salesStaff;
    }

    public void setSalesStaff(SalesStaff salesStaff) {
        this.salesStaff = salesStaff;
    }
}


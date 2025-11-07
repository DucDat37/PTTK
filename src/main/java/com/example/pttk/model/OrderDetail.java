package com.example.pttk.model;

public class OrderDetail {

    private int id;
    private int quantity;
    private float price;
    private Order order;
    private Item item;

    public OrderDetail() {
    }

    public OrderDetail(int id, int quantity, float price, Order order, Item item) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.order = order;
        this.item = item;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}


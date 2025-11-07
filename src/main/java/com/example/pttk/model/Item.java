package com.example.pttk.model;

public class Item {

    private int id;
    private String name;
    private float price;
    private String quantity;
    private String note;

    public Item() {
    }

    public Item(int id, String name, float price, String quantity, String note) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}


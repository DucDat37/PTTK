package com.example.pttk.model;

public class Supplier {

    private int id;
    private String phone;
    private String address;
    private String note;

    public Supplier() {
    }

    public Supplier(int id, String phone, String address, String note) {
        this.id = id;
        this.phone = phone;
        this.address = address;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}


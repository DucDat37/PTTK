package com.example.pttk.model;

public class Customer extends Member {

    public Customer() {
        super();
    }

    public Customer(int idMember, String fullName, String gender, String dob, String phone,
                    String email, String address, String password) {
        super(idMember, fullName, gender, dob, phone, email, address, password);
    }

    public Customer(String fullName, String gender, String dob, String phone,
                    String email, String address, String password) {
        super(fullName, gender, dob, phone, email, address, password);
    }
}


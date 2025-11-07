package com.example.pttk.model;

public class Manager extends Staff {

    public Manager() {
        super();
    }

    public Manager(String fullName, String gender, String dob, String phone,
                   String email, String address, String password, String role) {
        super(fullName, gender, dob, phone, email, address, password, role);
    }

    public Manager(int idMember, String fullName, String gender, String dob, String phone,
                   String email, String address, String password, String role) {
        super(idMember, fullName, gender, dob, phone, email, address, password, role);
    }
}


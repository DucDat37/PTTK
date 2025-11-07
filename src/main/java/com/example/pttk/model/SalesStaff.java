package com.example.pttk.model;

public class SalesStaff extends Staff {

    public SalesStaff() {
        super();
    }

    public SalesStaff(String fullName, String gender, String dob, String phone,
                      String email, String address, String password, String role) {
        super(fullName, gender, dob, phone, email, address, password, role);
    }

    public SalesStaff(int idMember, String fullName, String gender, String dob, String phone,
                      String email, String address, String password, String role) {
        super(idMember, fullName, gender, dob, phone, email, address, password, role);
    }
}


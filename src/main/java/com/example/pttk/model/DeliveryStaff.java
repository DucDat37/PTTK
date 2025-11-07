package com.example.pttk.model;

public class DeliveryStaff extends Staff {

    public DeliveryStaff() {
        super();
    }

    public DeliveryStaff(String fullName, String gender, String dob, String phone,
                         String email, String address, String password, String role) {
        super(fullName, gender, dob, phone, email, address, password, role);
    }

    public DeliveryStaff(int idMember, String fullName, String gender, String dob, String phone,
                         String email, String address, String password, String role) {
        super(idMember, fullName, gender, dob, phone, email, address, password, role);
    }
}


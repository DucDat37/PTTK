package com.example.pttk.model;

public class WarehouseStaff extends Staff {

    public WarehouseStaff() {
        super();
    }

    public WarehouseStaff(String fullName, String gender, String dob, String phone,
                          String email, String address, String password, String role) {
        super(fullName, gender, dob, phone, email, address, password, role);
    }

    public WarehouseStaff(int idMember, String fullName, String gender, String dob, String phone,
                          String email, String address, String password, String role) {
        super(idMember, fullName, gender, dob, phone, email, address, password, role);
    }
}


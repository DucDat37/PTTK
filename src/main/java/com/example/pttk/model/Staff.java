package com.example.pttk.model;

public class Staff extends Member {

    private String role;

    public Staff() {
        super();
    }

    public Staff(String fullName, String gender, String dob, String phone,
                 String email, String address, String password, String role) {
        super(fullName, gender, dob, phone, email, address, password);
        this.role = role;
    }

    public Staff(int idMember, String fullName, String gender, String dob, String phone,
                 String email, String address, String password, String role) {
        super(idMember, fullName, gender, dob, phone, email, address, password);
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}


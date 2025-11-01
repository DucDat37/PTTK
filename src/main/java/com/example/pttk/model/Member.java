package com.example.pttk.model;

public class Member {
    private int idMember;
    private String fullName;
    private String gender;
    private String dob;
    private String phone;
    private String email;
    private String address;
    private String password;

    public Member(String fullName, String gender, String dob, String phone,
                  String email, String address, String password) {
        this.fullName = fullName;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.password = password;
    }

    public Member(int idMember, String fullName, String gender, String dob, String phone,
                  String email, String address, String password) {
        this.idMember = idMember;
        this.fullName = fullName;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.password = password;
    }

    // --- Constructor rỗng (bắt buộc cho JavaBean)
    public Member() {}

    // Getter & Setter
    public int getIdMember() { return idMember; }
    public void setIdMember(int idMember) { this.idMember = idMember; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}

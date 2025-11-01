package com.example.pttk.model;

public class CustomerStatistic {
    private int idCustomer;
    private String customerName;
    private String email;
    private String phone;
    private float totalRevenue;

    public CustomerStatistic() {}

    public CustomerStatistic(int idCustomer, String customerName, String email, String phone, float totalRevenue) {
        this.idCustomer = idCustomer;
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.totalRevenue = totalRevenue;
    }

    // --- Getter và Setter ---
    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(float totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "CustomerStatistic{" +
                "idCustomer=" + idCustomer +
                ", customerName='" + customerName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", totalRevenue=" + totalRevenue +
                '}';
    }
}

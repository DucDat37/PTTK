package com.example.pttk.model;

import java.util.Date;

public class DeliveryInvoice {

    private int id;
    private Date date;
    private DeliveryStaff deliveryStaff;
    private WarehouseStaff warehouseStaff;

    public DeliveryInvoice() {
    }

    public DeliveryInvoice(int id, Date date, DeliveryStaff deliveryStaff, WarehouseStaff warehouseStaff) {
        this.id = id;
        this.date = date;
        this.deliveryStaff = deliveryStaff;
        this.warehouseStaff = warehouseStaff;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public DeliveryStaff getDeliveryStaff() {
        return deliveryStaff;
    }

    public void setDeliveryStaff(DeliveryStaff deliveryStaff) {
        this.deliveryStaff = deliveryStaff;
    }

    public WarehouseStaff getWarehouseStaff() {
        return warehouseStaff;
    }

    public void setWarehouseStaff(WarehouseStaff warehouseStaff) {
        this.warehouseStaff = warehouseStaff;
    }
}


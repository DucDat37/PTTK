package com.example.pttk.model;

import java.util.Date;

public class ImportInvoice {

    private int id;
    private Date date;
    private Supplier supplier;
    private WarehouseStaff warehouseStaff;

    public ImportInvoice() {
    }

    public ImportInvoice(int id, Date date, Supplier supplier, WarehouseStaff warehouseStaff) {
        this.id = id;
        this.date = date;
        this.supplier = supplier;
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

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public WarehouseStaff getWarehouseStaff() {
        return warehouseStaff;
    }

    public void setWarehouseStaff(WarehouseStaff warehouseStaff) {
        this.warehouseStaff = warehouseStaff;
    }
}


package com.example.pttk.model;

public class ImportInvoiceDetail {

    private int id;
    private int quantity;
    private Item item;
    private ImportInvoice importInvoice;

    public ImportInvoiceDetail() {
    }

    public ImportInvoiceDetail(int id, int quantity, Item item, ImportInvoice importInvoice) {
        this.id = id;
        this.quantity = quantity;
        this.item = item;
        this.importInvoice = importInvoice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public ImportInvoice getImportInvoice() {
        return importInvoice;
    }

    public void setImportInvoice(ImportInvoice importInvoice) {
        this.importInvoice = importInvoice;
    }
}


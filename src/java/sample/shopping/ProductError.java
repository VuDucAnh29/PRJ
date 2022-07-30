/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author Admin
 */
public class ProductError {
    private String productID;
    private String productName;
    private String categoryID;
    private double price;
    private int quantity;
    private String imageLink;
    private String importDate;
    private String usingDate;

    public ProductError() {
        this.productID = "";
        this.productName = "";
        this.categoryID = "";
        this.price = 0;
        this.quantity = 0;
        this.imageLink = "";
        this.importDate = "";
        this.usingDate = "";
    }

    public ProductError(String productID, String productName, String categoryID, double price, int quantity, String imageLink, String importDate, String usingDate) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
        this.imageLink = imageLink;
        this.importDate = importDate;
        this.usingDate = usingDate;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }
    
    
}

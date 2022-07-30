/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Order {
    private String orderID;
    private String orderDate;
    private String userID;
    private float total;

    public Order() {
        this.orderID = LocalDateTime.now().toString();
        this.orderDate = LocalDate.now().toString();
        this.userID = "";
        this.total = 0;
    }

    public Order( String userID, float total) {
        this.orderID = LocalDateTime.now().toString();
        this.orderDate = LocalDate.now().toString();
        this.userID = userID;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}

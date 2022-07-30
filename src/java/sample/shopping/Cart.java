/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart {
    private Map<String, Product> cart;

    public Cart() {
    }

    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }
    
    public boolean add(Product product){
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(product.getProductID())) {
            int currentQuantity = cart.get(product.getProductID()).getQuantity();
            product.setQuantity(currentQuantity + product.getQuantity());
        }
        cart.put(product.getProductID(), product);
        check = true;
        return check;
    }
    
    public boolean remove(String ID){
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(ID)) {
                this.cart.remove(ID);
            }
        }
        return check;
    }
    
    public boolean edit(String ID, Product product){
        boolean check = false;
        if (this.cart!= null) {
            if (this.cart.containsKey(ID)) {
                this.cart.replace(ID, product);
            }
        }
        return check;
    }
}

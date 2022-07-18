/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Windows 10 TIMT
 */
public class Cart {

    private List<Product> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Product> items) {
        this.items = items;
    }
    
   

    public List<Product> getItems() {
        return items;
    }

    private Product getItemById(int id) {
        for (Product i : items) {
            if (i.getPro_id() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Product t) {
        if (getItemById(t.getPro_id()) == null) {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getPro_id() == id) {
                return i;
            }
        }
        return null;
    }
}

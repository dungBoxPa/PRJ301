/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Windows 10 TIMT
 */
public class Characteristics {

    private int id;
    private String detail;
    private Product product;

    public Characteristics() {
    }

    public Characteristics(int id, String detail) {
        this.id = id;
        this.detail = detail;
    }
    
    public Characteristics(int id, Product product) {
        this.id = id;
        this.product = product;
    }

    public Characteristics(int id, String detail, Product product) {
        this.id = id;
        this.detail = detail;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Characteristics{" + "id=" + id + ", detail=" + detail + ", product=" + product + '}';
    }

    
}

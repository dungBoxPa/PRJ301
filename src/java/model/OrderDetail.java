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
public class OrderDetail {

    private int order_id;
    private Product product;
    private int quantity;
    private double totalPricePerProduct;

    public OrderDetail() {
    }

    public OrderDetail(Product product, int quantity, double totalPricePerProduct) {
        this.product = product;
        this.quantity = quantity;
        this.totalPricePerProduct = totalPricePerProduct;
    }

    public OrderDetail(int order_id, Product product, int quantity, double totalPricePerProduct) {
        this.order_id = order_id;
        this.product = product;
        this.quantity = quantity;
        this.totalPricePerProduct = totalPricePerProduct;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPricePerProduct() {
        return totalPricePerProduct * quantity;
    }

    public void setTotalPricePerProduct(double totalPricePerProduct) {
        this.totalPricePerProduct = totalPricePerProduct;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "order_id=" + order_id + ", product=" + product + ", quantity=" + quantity + ", totalPricePerProduct=" + totalPricePerProduct + '}';
    }

}

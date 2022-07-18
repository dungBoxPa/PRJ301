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
public class Order {

    private int order_id;
    private String date;
    private Member member;
    private OrderDetail orderDetail;

    public Order() {
    }
    
    public Order(String date, Member member, OrderDetail orderDetail) {
        this.date = date;
        this.member = member;
        this.orderDetail = orderDetail;
    }

    public Order(int order_id, String date, Member member, OrderDetail orderDetail) {
        this.order_id = order_id;
        this.date = date;
        this.member = member;
        this.orderDetail = orderDetail;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", date=" + date + ", member=" + member + ", totalPrice=" + orderDetail + '}';
    }

}

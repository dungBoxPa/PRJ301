/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Text.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Member;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class OrderDao {

    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        String sql = "select A.order_id, \n"
                + "A.orderDate, \n"
                + "A.member_id, \n"
                + "B.product_id, \n"
                + "B.quantity, \n"
                + "B.totalPrice \n"
                + "from OrderFromMember A inner join OrderDetail B on A.order_id=B.order_id";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Member member = new Member(rs.getInt("member_id"));
                Product product = new Product(rs.getInt("product_id"));
                OrderDetail od = new OrderDetail(rs.getInt("order_id"),
                        product,
                        rs.getInt("quantity"),
                        rs.getDouble("totalPrice"));
                list.add(new Order(rs.getInt("order_id"), rs.getString("orderDate"), member, od));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Order order, OrderDetail orderDetail) {
        try {
            String sql1 = "insert into OrderFromMember values (?,?)";
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql1);
            ps.setString(1, order.getDate());
            ps.setInt(2, order.getMember().getUser_id());
            ps.executeUpdate();

            String sql2 = "insert into OrderDetail values (?,?,?,?)";
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql2);
            ps.setInt(1, order.getOrderDetail().getOrder_id());
            ps.setInt(2, order.getOrderDetail().getProduct().getPro_id());
            ps.setInt(3, order.getOrderDetail().getQuantity());
            ps.setDouble(4, order.getOrderDetail().getTotalPricePerProduct());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insertOrder(List<Order> list) {
        try {
            String date = "";
            int member_id = 0;
            for (int i = 0; i < list.size(); i++) {
                Order get = list.get(i);
                date = get.getDate();
                member_id = get.getMember().getUser_id();
            }

            String sql1 = "insert into OrderFromMember values (?,?)";
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql1);
            ps.setString(1, date);
            ps.setInt(2, member_id);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertOrderDetail(List<OrderDetail> orderDetails) {
        try {
            int lastOrderId = 0;
            OrderDao dao = new OrderDao();
            List<Order> orders = dao.getAll();
            lastOrderId = orders.get(orders.size() - 1).getOrder_id() + 1;
            for (int i = 0; i < orderDetails.size(); i++) {
                OrderDetail get = orderDetails.get(i);
                String sql2 = "insert into OrderDetail values (?,?,?,?)";
                connection = new DBContext().getConnection();
                ps = connection.prepareStatement(sql2);
                ps.setInt(1, lastOrderId);
                ps.setInt(2, get.getProduct().getPro_id());
                ps.setInt(3, get.getQuantity());
                ps.setDouble(4, get.getTotalPricePerProduct());
                ps.executeUpdate();
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        OrderDao dao = new OrderDao();
        List<Order> orders = dao.getAll();
//        Order order = orders.get(orders.size() - 1);
//        System.out.println(order.toString());
//        System.out.println(orders.get(orders.size() - 1).getOrder_id() + 1);
//        OrderDetail m1 = new OrderDetail(orders.get(orders.size() - 1).getOrder_id(), new Product(1), 2, 45590000);
//        OrderDetail m2 = new OrderDetail(orders.get(orders.size() - 1).getOrder_id(), new Product(2), 3, 33790000);
//        List<OrderDetail> list = new ArrayList<>();
//        list.add(m1);
//        list.add(m2);
//        List<Order> list1 = new ArrayList<>();
//        list1.add(new Order("1900-01-01", new Member(2), m1));
//        list1.add(new Order("1900-01-01", new Member(2), m2));
//        dao.insertOrder(list1);
//        dao.insertOrderDetail(list);
//        List<Order> orders = dao.getAll();
        for (Order order : orders) {
            if (order.getDate().contains("1900")) {
                System.out.println(order.toString());
            }
        }
    }
}

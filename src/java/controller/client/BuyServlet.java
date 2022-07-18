/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import DAO.OrderDao;
import DAO.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Member;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class BuyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        List<Product> list = (ArrayList) session.getAttribute("cart");
        ProductDao dao = new ProductDao();
        String id_raw = request.getParameter("pro_id");
        try {
            int id = Integer.parseInt(id_raw);
            for (int i = 0; i < list.size(); i++) {
                Product get = list.get(i);
                if (get.getPro_id() == id) {
                    list.remove(get);
                }
            }
            response.sendRedirect("cart");
        } catch (NumberFormatException e) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        List<Product> list = (ArrayList<Product>) session.getAttribute("cart");
        Member member = (Member) session.getAttribute("member");
        OrderDetail orderDetail = null;
        Order order = null;
        try (PrintWriter out = response.getWriter()) {
            ProductDao dao1 = new ProductDao();
            OrderDao dao = new OrderDao();
            List<OrderDetail> listOrderDetails = new ArrayList<>();
            List<Order> listOrders = new ArrayList<>();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();
            String date = now.format(dtf).toString();
            String[] number_raw = request.getParameterValues("number");
            if (number_raw!=null) {
                int[] pro_ids = new int[list.size()];
                for (int i = 0; i < list.size(); i++) {
                    Product get = list.get(i);
                    pro_ids[i] = get.getPro_id();
                    int quantity = Integer.parseInt(number_raw[i]);
                    dao1.updateQuantity(get.getPro_id(), get.getQuantity() - quantity);
                    get.setQuantity(get.getQuantity() - quantity);
                    orderDetail = new OrderDetail(get, quantity, get.getPrice() * quantity);
                    listOrderDetails.add(orderDetail);
                }
                for (int i = 0; i < listOrderDetails.size(); i++) {
                    OrderDetail get = listOrderDetails.get(i);
                    order = new Order(date, member, get);
                    listOrders.add(order);
                }
                dao.insertOrder(listOrders);
                dao.insertOrderDetail(listOrderDetails);
                String alert = "Ordered sucessfully!";
                request.setAttribute("alert", alert);
                response.sendRedirect("homelist");
            }else{
                String alert = "Vui lòng nhập số lượng sản phẩm!";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("client/productInfo.jsp").forward(request, response);
            }
        } catch (Exception e) {

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import DAO.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Characteristics;
import model.Member;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class loadSingleProductPageServlet extends HttpServlet {

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
            out.println("<title>Servlet loadSingleProductPageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadSingleProductPageServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);
            Member member = (Member) session.getAttribute("member");
            try {
                if (member != null) {
                    int count = 0;
                    String proId_raw = request.getParameter("pro_id");
                    String edition = request.getParameter("edition");
                    int pro_id = Integer.parseInt(proId_raw);
                    ProductDao dao = new ProductDao();
                    Product product = dao.getProductByID(pro_id);
                    List<Product> list = dao.getAllProduct();
                    List<Product> listPro = new ArrayList<>();
                    List<Product> products = dao.getAllProduct();
                    List<Product> similarProducts = new ArrayList<>();
                    for (Product similarProduct : products) {
                        if(count==5){
                            break;
                        }
                        if(similarProduct.getPrice()<= product.getPrice()+10000000 && similarProduct.getPrice() >= product.getPrice()-10000000){
                            count++;
                            similarProducts.add(similarProduct);
                        }
                    }
                    for (Product product1 : list) {
                        if (product1.getEdition().equalsIgnoreCase(edition)) {
                            listPro.add(product1);
                        }
                    }
                    List<Characteristics> charList = dao.getAllCharacterByProID(pro_id);
                    request.setAttribute("similarProducts", similarProducts);
                    request.setAttribute("listPro", listPro);
                    request.setAttribute("product", product);
                    request.setAttribute("charList", charList);
                    request.getRequestDispatcher("client/productInfo.jsp").forward(request, response);
                } else {
                    String alert = "You need to login first!";
                    request.setAttribute("alert", alert);
                    request.getRequestDispatcher("client/login.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
            }
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
        processRequest(request, response);
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

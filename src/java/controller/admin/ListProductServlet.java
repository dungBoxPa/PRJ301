/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

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
import model.Member;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class ListProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ListProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductServlet at " + request.getContextPath() + "</h1>");
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
        Member member = (Member) session.getAttribute("member");
        if (member != null && member.getAccount().getIsAdmin()) {
            ProductDao dao = new ProductDao();
            List<Product> listPros = dao.getAllProduct();
            int page;
            int numPerPage = 6;
            int size = listPros.size();
            int pagenum = (size % numPerPage == 0 ? (size / numPerPage) : (size / numPerPage + 1));
            String page_raw = request.getParameter("page");
            if (page_raw == null) {
                page = 1;
            } else {
                page = Integer.parseInt(page_raw);
            }
            int start = (page - 1) * numPerPage;
            int end = Math.min(page * numPerPage, size);
            List<Product> listProperPage = dao.getListByPage(listPros, start, end);
            request.setAttribute("pagenum", pagenum);
            request.setAttribute("page", page);
            request.setAttribute("listProperPage", listProperPage);
            request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
        }else if(member.getAccount().getIsAdmin() == false) {
            String alert = "Bạn không có quyền truy cập trang admin!!";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("client/login.jsp").forward(request, response);
        } else if(member == null) {
            String alert = "you need to login first!";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("client/login.jsp").forward(request, response);
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

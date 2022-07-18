/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import DAO.CategoryDao;
import DAO.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Member;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class homeListServlet extends HttpServlet {

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
            List<Product> list = new ArrayList<>();
            int size = 0;
            HttpSession session = request.getSession(true);
            Member member = (Member) session.getAttribute("member");
            CategoryDao dao = new CategoryDao();
            ProductDao dao1 = new ProductDao();
            List<Category> listCat = dao.getAllCategory();
            List<Product> listPro = new ArrayList<>();
            String cate_id_raw = request.getParameter("cate_id");
            if (cate_id_raw != null && Integer.parseInt(cate_id_raw) != 0) {
                listPro = dao1.getAllProductByCategoryID(Integer.parseInt(cate_id_raw));
                request.setAttribute("cate_id", Integer.parseInt(cate_id_raw));
            } else if (cate_id_raw == null || Integer.parseInt(cate_id_raw) == 0) {
                listPro = dao1.getAllProduct();
//                request.setAttribute("cate_id", Integer.parseInt(cate_id_raw));
            }
            if (member != null) {
//                if (price != null || ram != null || rom != null || screen != null || OS != null) {
//                    List<Product> listAfter = new ArrayList<Product>();
//                    if (price.equals("5000000")) {
//                        listAfter = listPro.stream().filter(p -> p.getPrice() < 5000000).collect(Collectors.toList());
//                    } else if (price.equals("10000000")) {
//                        listAfter = listPro.stream().filter(p -> p.getPrice() < 10000000).filter(p -> p.getPrice() >= 5000000).collect(Collectors.toList());
//                    } else if (price.equals("15000000")) {
//                        listAfter = listPro.stream().filter(p -> p.getPrice() < 15000000).filter(p -> p.getPrice() >= 10000000).collect(Collectors.toList());
//                    } else if (price.equals("20000000")) {
//                        listAfter = listPro.stream().filter(p -> p.getPrice() < 20000000).filter(p -> p.getPrice() >= 15000000).collect(Collectors.toList());
//                    } else if (price.equals("100000000")) {
//                        listAfter = listPro.stream().filter(p -> p.getPrice() >= 20000000).collect(Collectors.toList());
//                    }
//
//                    if (OS.equals("Android")) {
//                        listAfter = listPro.stream().filter(p -> p.getOS().contains("Android")).collect(Collectors.toList());
//                    } else if (OS.equals("iOS")) {
//                        listAfter = listPro.stream().filter(p -> p.getOS().contains("iOS")).collect(Collectors.toList());
//                    }
//                    if (rom.equals("3264")) {
//                        listAfter = listPro.stream().filter(p -> p.getInternal_mem().equals("32GB")).filter(p -> p.getInternal_mem().equals("64GB")).collect(Collectors.toList());
//                    } else if (rom.equals("128256")) {
//                        listAfter = listPro.stream().filter(p -> p.getInternal_mem().equals("128GB")).filter(p -> p.getInternal_mem().equals("256GB")).collect(Collectors.toList());
//                    }else if (rom.equals("512")) {
//                        listAfter = listPro.stream().filter(p -> p.getInternal_mem().equals("512GB")).filter(p -> p.getInternal_mem().equals("1T")).collect(Collectors.toList());
//                    }
//                    if (ram.equals("4")) {
//                        listAfter = listPro.stream().filter(p -> p.getRam() < 4).collect(Collectors.toList());
//                    } else if (ram.equals("6")) {
//                        listAfter = listPro.stream().filter(p -> p.getRam() >= 4).filter(p -> p.getRam() <= 6).collect(Collectors.toList());
//                    } else if (ram.equals("12")) {
//                        listAfter = listPro.stream().filter(p -> p.getRam() >= 8).filter(p -> p.getRam() <= 12).collect(Collectors.toList());
//                    } else if (ram.equals("24")) {
//                        listAfter = listPro.stream().filter(p -> p.getRam() >= 12).collect(Collectors.toList());
//                    }
//                    size = listAfter.size();
//                    String xpage = request.getParameter("page");
//                    int page, numberperpage = 10;
//                    int pagenumber = (size % numberperpage == 0 ? (size / numberperpage) : (size / numberperpage + 1));
//                    if (xpage == null) {
//                        page = 1;
//                    } else {
//                        page = Integer.parseInt(xpage);
//                    }
//                    int start, end;
//                    start = (page - 1) * numberperpage;
//                    end = Math.min(page * numberperpage, size);
//                    list = dao1.getListByPage(listAfter, start, end);
//                    request.setAttribute("price", price);
//                    request.setAttribute("list_data", list);
//                    request.setAttribute("page", page);
//                    request.setAttribute("pagenumber", pagenumber);
//                } else {
                size = listPro.size();
                String xpage = request.getParameter("page");
                int page, numberperpage = 10;
                int pagenumber = (size % numberperpage == 0 ? (size / numberperpage) : (size / numberperpage + 1));
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numberperpage;
                end = Math.min(page * numberperpage, size);
                list = dao1.getListByPage(listPro, start, end);
                request.setAttribute("list_data", list);
                request.setAttribute("page", page);
                request.setAttribute("pagenumber", pagenumber);
                request.setAttribute("listCat", listCat);
                request.getRequestDispatcher("client/home.jsp").forward(request, response);
            } else {
                String alert = "You need to login first!";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("client/login.jsp").forward(request, response);
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

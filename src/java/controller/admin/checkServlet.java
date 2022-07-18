/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import DAO.CategoryDao;
import DAO.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Characteristics;
import model.Event;
import model.Member;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class checkServlet extends HttpServlet {

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
            out.println("<title>Servlet checkServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkServlet at " + request.getContextPath() + "</h1>");
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
        ProductDao dao = new ProductDao();
        CategoryDao dao1 = new CategoryDao();
        String action = request.getParameter("action");
        HttpSession session = request.getSession(true);
        Member admin = (Member) session.getAttribute("member");
        if (admin == null) {
            request.setAttribute("error", "You are not allowed to change the data!");
            request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("add")) {
                request.getRequestDispatcher("add").forward(request, response);
            } else if (action.equalsIgnoreCase("update")) {
                String id_update = request.getParameter("pro_id");
                try {
                    int id = Integer.parseInt(id_update);
                    Product s = dao.getProductByID(id);
                    List<Category> list = dao1.getAllCategory();
                    List<Event> evList = dao1.getAllEvent();
                    request.setAttribute("listcate", list);
                    request.setAttribute("evList", evList);
                    request.setAttribute("product", s);
                    request.getRequestDispatcher("admin/update.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            } else if (action.equalsIgnoreCase("delete")) {
                String id_del_raw = request.getParameter("id");
                try {
                    int id_del = Integer.parseInt(id_del_raw);
                    dao.delete(id_del);
                    response.sendRedirect("prolist");
                } catch (IOException | NumberFormatException e) {
                }
            } else if (action.equalsIgnoreCase("statistic")) {
                request.getRequestDispatcher("admin/Statistic.jsp").forward(request, response);
            }else if (action.equalsIgnoreCase("addCharacters")) {
                List<Characteristics> listchar = dao.getAllCharacteristicses();
                request.setAttribute("list", listchar);
                request.getRequestDispatcher("admin/addCharacters.jsp").forward(request, response);
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

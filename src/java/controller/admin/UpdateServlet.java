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
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Event;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class UpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("pro_id");
        Product product = dao.getProductByID(Integer.parseInt(id));
        if (product != null) {
            List< Category> list = dao1.getAllCategory();
            List<Event> evList = dao1.getAllEvent();
            request.setAttribute("listcate", list);
            request.setAttribute("evList", evList);
            request.setAttribute("product", product);
            request.getRequestDispatcher("admin/update.jsp").forward(request, response);
        } else {
            String alert = "Sản phẩm không tồn tại!";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
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
        ProductDao dao = new ProductDao();
        CategoryDao dao1 = new CategoryDao();
        Random rd = new Random();
        try (PrintWriter out = response.getWriter()) {
            String id_raw = request.getParameter("id");
            String productName = request.getParameter("name");
            String edition = request.getParameter("edition");
            String quantity_raw = request.getParameter("quantity");
            String price_raw = request.getParameter("price");
            String discount_raw = request.getParameter("discount");
            String screen_size_raw = request.getParameter("screen_size");
            String screen_tech = request.getParameter("screen_tech");
            String screen_resol = request.getParameter("screen_resol");
            String back_camera = request.getParameter("back_camera");
            String front_camera = request.getParameter("front_camera");
            String chip = request.getParameter("chip");
            String ram_raw = request.getParameter("ram");
            String internal_mem = request.getParameter("internal_mem");
            String pin = request.getParameter("pin");
            String sim = request.getParameter("sim");
            String OS = request.getParameter("OS");
            String size = request.getParameter("size");
            String weight_raw = request.getParameter("weight");
            String bluetooth = request.getParameter("bluetooth");
            String cate_id_raw = request.getParameter("cate_id");
            String event_id_raw = request.getParameter("evList");
            int rating_score = rd.nextInt(5);
            String img_path = request.getParameter("inputfile");
            Integer id = Integer.parseInt(id_raw);
            Integer quantity = Integer.parseInt(quantity_raw);
            Integer price = Integer.parseInt(price_raw);
            Integer discount = Integer.parseInt(discount_raw);
            Double screen_size = Double.parseDouble(screen_size_raw);
            Integer ram = Integer.parseInt(ram_raw);
            Integer weight = Integer.parseInt(weight_raw);
            Integer cate_id = Integer.parseInt(cate_id_raw);
            Integer event_id = Integer.parseInt(event_id_raw);
            String[] full_path = {"static/img/usedImg/iPhone/",
                "static/img/usedImg/Samsung/",
                "static/img/usedImg/Oppo/",
                "static/img/usedImg/Vivo/",
                "static/img/usedImg/Huawei/",
                "static/img/usedImg/Xiaomi/"};
            String full_img_path = "";
            for (int i = 0; i < full_path.length; i++) {
                String string = full_path[i];
                if (cate_id - 1 == i) {
                    full_img_path = string + img_path;
                }
            }
            Product p = new Product(id,
                    productName,
                    quantity, price, discount,
                    edition,
                    screen_size,
                    screen_tech,
                    back_camera,
                    front_camera,
                    chip,
                    ram,
                    internal_mem,
                    pin,
                    sim,
                    OS,
                    screen_resol,
                    size,
                    weight,
                    bluetooth,
                    img_path,
                    rating_score,
                    dao1.existedCategory(cate_id),
                    dao1.checkEvent(event_id));
            dao.update(p);
            response.sendRedirect("prolist");
        } catch (NumberFormatException e) {
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

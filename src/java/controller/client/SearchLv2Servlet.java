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
public class SearchLv2Servlet extends HttpServlet {

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
            out.println("<title>Servlet SearchLv2Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchLv2Servlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        Member member = (Member) session.getAttribute("member");
        if (member != null) {
            List<String> listFilter = (ArrayList<String>) session.getAttribute("listFilter");
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            if (action != null) {
                if (action.equalsIgnoreCase("delete")) {
                    for (int i = 0; i < listFilter.size(); i++) {
                        String get = listFilter.get(i);
                        if (get.equalsIgnoreCase(id)) {
                            listFilter.remove(get);
                        }
                    }
                }
            }
            List<Product> listPro = new ArrayList<>();
            CategoryDao dao = new CategoryDao();
            ProductDao dao1 = new ProductDao();
            String id_raw = request.getParameter("pro_id");
            if (id_raw != null && Integer.parseInt(id_raw) != 0) {
                listPro = dao1.getAllProductByCategoryID(Integer.parseInt(id_raw));
            } else if (id_raw == null) {
                listPro = dao1.getAllProduct();
            }
            List<Category> listCat = dao.getAllCategory();
            request.setAttribute("listPro", listPro);
            request.setAttribute("listCat", listCat);
            request.getRequestDispatcher("client/product.jsp").forward(request, response);
        } else {
            String alert = "You need to login first!";
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        CategoryDao dao = new CategoryDao();
        ProductDao dao1 = new ProductDao();
        HttpSession session = request.getSession(true);
        List<String> filterList = new ArrayList<>();
        List<Product> list = dao1.getAllProduct();
        List<Product> listPro = new ArrayList<>();
        String price = request.getParameter("price");
        String OS = request.getParameter("OS");
        String ram = request.getParameter("ram");
        String rom = request.getParameter("rom");
        String screen = request.getParameter("screen");
        if (price != null || OS != null || ram != null || rom != null || screen != null) {
            if (!price.equalsIgnoreCase("Giá...")) {
                filterList.add(price);
            }
            if (!OS.equalsIgnoreCase("Loại điện thoại")) {
                filterList.add(OS);
            }
            if (!ram.equalsIgnoreCase("Dung lượng RAM")) {
                filterList.add(ram);
            }
            if (!rom.equalsIgnoreCase("Bộ nhớ trong")) {
                filterList.add(rom);
            }
            if (!screen.equalsIgnoreCase("Kích thước màn hình")) {
                filterList.add(screen);
            }
            for (Product product : list) {
                if (price.equalsIgnoreCase("Dưới 5 triệu")) {
                    if (product.getPrice() < 5000000) {
//                        listPro.add(product);
                        if (OS.equalsIgnoreCase("Android")) {
                            if (product.getOS().contains("Android")) {
                                listPro.add(product);
                            }
                        } else if (OS.equalsIgnoreCase("iOS")) {
                            if (product.getOS().contains("iOS")) {
                                listPro.add(product);
                            }
                        }
                    }
                } else if (price.equalsIgnoreCase("5 - 10 triệu")) {
                    if (product.getPrice() >= 5000000 && product.getPrice() < 10000000) {
//                        listPro.add(product);
                        if (OS.equalsIgnoreCase("Android")) {
                            if (product.getOS().contains("Android")) {
                                listPro.add(product);
                            }
                        } else if (OS.equalsIgnoreCase("iOS")) {
                            if (product.getOS().contains("iOS")) {
                                listPro.add(product);
                            }
                        }
                    }
                } else if (price.equalsIgnoreCase("10 - 15 triệu")) {
                    if (product.getPrice() >= 10000000 && product.getPrice() < 15000000) {
//                        listPro.add(product);
                        if (OS.equalsIgnoreCase("Android")) {
                            if (product.getOS().contains("Android")) {
                                listPro.add(product);
                            }
                        } else if (OS.equalsIgnoreCase("iOS")) {
                            if (product.getOS().contains("iOS")) {
                                listPro.add(product);
                            }
                        }
                    }
                } else if (price.equalsIgnoreCase("15 - 20 triệu")) {
                    if (product.getPrice() >= 15000000 && product.getPrice() < 20000000) {
//                        listPro.add(product);
                        if (OS.equalsIgnoreCase("Android")) {
                            if (product.getOS().contains("Android")) {
                                listPro.add(product);
                            }
                        } else if (OS.equalsIgnoreCase("iOS")) {
                            if (product.getOS().contains("iOS")) {
                                listPro.add(product);
                            }
                        }
                    }
                } else if (price.equalsIgnoreCase("trên 20 triệu")) {
                    if (product.getPrice() > 20000000) {
//                        listPro.add(product);
                        if (OS.equalsIgnoreCase("Android")) {
                            if (product.getOS().contains("Android")) {
                                listPro.add(product);
                            }
                        } else if (OS.equalsIgnoreCase("iOS")) {
                            if (product.getOS().contains("iOS")) {
                                listPro.add(product);
                            }
                        }
                    }
                }

            }

//            List<Category> listCat = dao.getAllCategory();
//            request.setAttribute("listPro", listPro);
//            request.setAttribute("listCat", listCat);
//            session.setAttribute("listFilter", filterList);
//            request.getRequestDispatcher("client/product.jsp").forward(request, response);
//            try (PrintWriter out = response.getWriter()) {
//                for (Product product : listPro) {
//                    out.println(product.toString());
//                }
//            }
        }
//        if (OS != null) {
//            if (!OS.equalsIgnoreCase("Loại điện thoại")) {
//                filterList.add(OS);
//            }
//            for (Product product : list) {
//                if (OS.equalsIgnoreCase("Android")) {
//                    if (product.getOS().contains("Android")) {
//                        listPro.add(product);
//                    }
//                } else if (OS.equalsIgnoreCase("iOS")) {
//                    if (product.getOS().contains("iOS")) {
//                        listPro.add(product);
//                    }
//                }
//            }
//        }
//        if (ram != null) {
//            if (!ram.equalsIgnoreCase("Dung lượng RAM")) {
//                filterList.add(ram);
//            }
//
//        }
//        if (rom != null) {
//            if (!rom.equalsIgnoreCase("Bộ nhớ trong")) {
//                filterList.add(rom);
//            }
//        }
//        if (screen != null) {
//            if (!screen.equalsIgnoreCase("Kích thước màn hình")) {
//                filterList.add(screen);
//            }
//        }
        List<Category> listCat = dao.getAllCategory();
        request.setAttribute("listPro", listPro);
        request.setAttribute("listCat", listCat);
        session.setAttribute("listFilter", filterList);
        request.getRequestDispatcher("client/product.jsp").forward(request, response);
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

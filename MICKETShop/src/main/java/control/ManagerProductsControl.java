/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.AccountDTO;
import entity.CategoryDTO;
import entity.ProductsDTO;
import entity.SizeDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ManagerControl", urlPatterns = {"/managerP"})
public class ManagerProductsControl extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        AccountDTO a = null;

        if (session != null) {
            a = (AccountDTO) session.getAttribute("acc");
        }

        log("Debug: " + a);
        if (a == null) {
            log("Debug: Redirect to login page" + a);
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        int id = a.getId();
        DAO dao = new DAO();

        String action = request.getParameter("action");
        String pid = request.getParameter("pid");
        String index = request.getParameter("page");
        double count = dao.getTotalPageByUserID(id);
        int endPage = (int) Math.ceil(count / 5);
        int totalEntries = (int) count;
        int page = (index == null) ? 1 : Integer.parseInt(index);

        if (page != 0) {
            request.setAttribute("entries", totalEntries);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", page);

            if (action == null) {
                List<ProductsDTO> list = dao.getProductByUserID(id, page);
                List<CategoryDTO> listC = dao.getAllCategory();

                request.setAttribute("listCC", listC);
                request.setAttribute("listP", list);

                request.getRequestDispatcher("ManagerProducts.jsp").forward(request, response);

            } else if (action.equals("add")) {

                String p_id = request.getParameter("pid");
                String p_name = request.getParameter("name");
                String p_image = request.getParameter("image");
                String p_title = request.getParameter("title");
                String p_price = request.getParameter("price");
                String p_desc = request.getParameter("description");
                String p_category = request.getParameter("category");

                int u_id = a.getId();

                
                dao.insertProduct(p_name, p_title, p_desc, p_price, p_image, p_category, u_id);
                response.sendRedirect("managerP");

            } else if (action.equals("edit")) {

                if (pid != null) {
                    ProductsDTO p = dao.getProductByID(pid);
                    List<CategoryDTO> listC = dao.getAllCategory();

                    request.setAttribute("detail", p);
                    request.setAttribute("listCC", listC);
                    request.getRequestDispatcher("Edit.jsp").forward(request, response);
                } else {
                    response.sendRedirect("home");
                }

            } else if (action.equals("update")) {
                String p_id = request.getParameter("id");
                String p_name = request.getParameter("name");
                String p_image = request.getParameter("image");
                String p_price =request.getParameter("price");
                String p_title = request.getParameter("title");
                String p_desc = request.getParameter("description");
                String p_category = request.getParameter("category");

                
                dao.updateProduct(p_name, p_title, p_desc, p_price, p_image, p_category, p_id);
                response.sendRedirect("managerP");

            } else if (action.equals("delete")) {

                if (!pid.equals("")) {
                    dao.deleteProduct(pid);
                }

                List<ProductsDTO> list = dao.getProductByUserID(id, page);
                List<CategoryDTO> listC = dao.getAllCategory();

                request.setAttribute("listCC", listC);
                request.setAttribute("listP", list);

                request.getRequestDispatcher("ManagerProducts.jsp").forward(request, response);
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProductsControl.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProductsControl.class.getName()).log(Level.SEVERE, null, ex);
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

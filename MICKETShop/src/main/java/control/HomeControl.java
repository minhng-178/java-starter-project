/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.ProductsDTO;
import entity.CategoryDTO;
import dao.DAO;
import entity.AccountDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class HomeControl extends HttpServlet {

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
        try {
            HttpSession session = request.getSession(true);
            DAO dao = new DAO();
            AccountDTO a = (AccountDTO) session.getAttribute("acc");

            String index = request.getParameter("page");
            double count = dao.getTotalPage();
            int endPage = (int) Math.ceil(count / 12);
            int page = (index == null) ? 1 : Integer.parseInt(index);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", page);

            if (a != null) {
                int totalProduct = dao.getTotalProducts();
                int totalQuantity = dao.getTotalQuantity();
                session.setAttribute("totalProduct", totalProduct);
                session.setAttribute("totalQuantity", totalQuantity);
            }
            List<ProductsDTO> list = dao.getAllProducts(page);
            List<CategoryDTO> listC = dao.getAllCategory();

            request.setAttribute("listP", list);
            request.setAttribute("listCC", listC);

            if (a.getIsAvailable() == 0) {
                request.getRequestDispatcher("403.jsp").forward(request, response);
            }

        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
            Logger.getLogger(HomeControl.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(HomeControl.class.getName()).log(Level.SEVERE, null, ex);
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

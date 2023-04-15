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
@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class ManagerSizeControl extends HttpServlet {

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
        String action = request.getParameter("action");
        String pid = request.getParameter("pid");
        String sid = request.getParameter("sid");

        String size = request.getParameter("size");
        String quantity = request.getParameter("quantity");

        int sizeNum;
        int quantityNum;

        DAO dao = new DAO();
        if (action == null) {
            ProductsDTO p = dao.getProductByID(pid);
            List<CategoryDTO> listC = dao.getAllCategory();
            List<SizeDTO> listS = dao.getProductBySize(pid);
            int totalByPid = dao.getTotalSizeByPid(pid);

            request.setAttribute("detail", p);
            request.setAttribute("totalByPid", totalByPid);
            request.setAttribute("size", listS);
            request.setAttribute("listCC", listC);
            request.getRequestDispatcher("Detail.jsp").forward(request, response);

        } else if (action.equals("add")) {
            try {
                sizeNum = Integer.parseInt(size);
                quantityNum = Integer.parseInt(quantity);

                if (sizeNum < 30 || sizeNum > 50 || quantityNum <= 0) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid input for size/quantity!");
                ProductsDTO p = dao.getProductByID(pid);
                List<CategoryDTO> listC = dao.getAllCategory();
                List<SizeDTO> listS = dao.getProductBySize(pid);
                int totalByPid = dao.getTotalSizeByPid(pid);

                request.setAttribute("detail", p);
                request.setAttribute("totalByPid", totalByPid);
                request.setAttribute("size", listS);
                request.setAttribute("listCC", listC);
                request.getRequestDispatcher("Detail.jsp").forward(request, response);
                return;
            }
            if (pid == null) {
                response.sendRedirect("detail?pid=" + pid);
            } else {
                if (dao.isSizeExist(pid, size)) {
                    request.setAttribute("mess", "Already existed size!");

                    ProductsDTO p = dao.getProductByID(pid);
                    List<CategoryDTO> listC = dao.getAllCategory();
                    List<SizeDTO> listS = dao.getProductBySize(pid);
                    int totalByPid = dao.getTotalSizeByPid(pid);

                    request.setAttribute("detail", p);
                    request.setAttribute("totalByPid", totalByPid);
                    request.setAttribute("size", listS);
                    request.setAttribute("listCC", listC);
                    request.getRequestDispatcher("Detail.jsp").forward(request, response);
                    return;
                } else {
                    dao.addSize(size, pid, quantity);
                    response.sendRedirect("detail?pid=" + pid);
                }
            }
        } else if (action.equals("update")) {
            try {
                sizeNum = Integer.parseInt(size);
                quantityNum = Integer.parseInt(quantity);

                if (sizeNum < 30 || sizeNum > 50 || quantityNum <= 0) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid input for size/quantity!");
                ProductsDTO p = dao.getProductByID(pid);
                List<CategoryDTO> listC = dao.getAllCategory();
                List<SizeDTO> listS = dao.getProductBySize(pid);
                int totalByPid = dao.getTotalSizeByPid(pid);

                request.setAttribute("detail", p);
                request.setAttribute("totalByPid", totalByPid);
                request.setAttribute("size", listS);
                request.setAttribute("listCC", listC);
                request.getRequestDispatcher("Detail.jsp").forward(request, response);
                return;
            }
            if (pid == null) {
                response.sendRedirect("detail?pid=" + pid);
            } else {
                if (dao.isSizeExist(pid, size)) {
                    request.setAttribute("mess", "Already existed size!");

                    ProductsDTO p = dao.getProductByID(pid);
                    List<CategoryDTO> listC = dao.getAllCategory();
                    List<SizeDTO> listS = dao.getProductBySize(pid);
                    int totalByPid = dao.getTotalSizeByPid(pid);

                    request.setAttribute("detail", p);
                    request.setAttribute("totalByPid", totalByPid);
                    request.setAttribute("size", listS);
                    request.setAttribute("listCC", listC);
                    request.getRequestDispatcher("Detail.jsp").forward(request, response);
                    return;
                } else {

                    dao.updateSize(size, quantity, sid);
                    response.sendRedirect("detail?pid=" + pid);
                }
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
            Logger.getLogger(ManagerSizeControl.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManagerSizeControl.class
                    .getName()).log(Level.SEVERE, null, ex);
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

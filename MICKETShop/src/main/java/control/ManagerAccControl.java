/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.AccountDTO;
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
@WebServlet(name = "ManagerAccControl", urlPatterns = {"/managerA"})
public class ManagerAccControl extends HttpServlet {

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

        int id = a.getIsAdmin();
        DAO dao = new DAO();

        String action = request.getParameter("action");
        String index = request.getParameter("page");
        double count = dao.getTotalPageByAdmin(id);
        int entries = (int) count;
        int endPage = (int) Math.ceil(count / 5);

        int page = (index == null) ? 1 : Integer.parseInt(index);

        if (page != 0) {
            request.setAttribute("entries", entries);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", page);
            if (action == null) {

                List<AccountDTO> listA = dao.getAllSeller(id, page);
                request.setAttribute("listA", listA);
                request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);

            } else if (action.equals("add")) {

                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String avail = request.getParameter("avail");
                String sell = request.getParameter("sell");
                String admin = request.getParameter("admin");

                if (dao != null) {
                    dao.addAccountbyAdmin(user, pass, avail, sell, admin);
                }
                response.sendRedirect("managerA");

            } else if (action.equals("load")) {

                int uid = Integer.parseInt(request.getParameter("uid"));

                if (uid != 0) {
                    AccountDTO detailA = dao.getAccountbyUserID(uid);
                    request.setAttribute("detailA", detailA);
                    request.getRequestDispatcher("EditAcc.jsp").forward(request, response);
                } else {
                    response.sendRedirect("managerA");
                }
            } else if (action.equals("update")) {

                int uid = Integer.parseInt(request.getParameter("uid"));
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                int avail = Integer.parseInt(request.getParameter("avail"));
                int sell = Integer.parseInt(request.getParameter("sell"));

                if (uid != 0) {
                    dao.updateAccount(user, pass, avail, sell, uid);
                    response.sendRedirect("managerA");
                }
            } else if (action.equals("delete")) {
                int uid = Integer.parseInt(request.getParameter("uid"));
                if (uid != 0) {
                    dao.deleteAccount(uid);
                }
                
                List<AccountDTO> listA = dao.getAllSeller(id, page);
                request.setAttribute("listA", listA);
                request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
                return; 
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
            Logger.getLogger(ManagerAccControl.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManagerAccControl.class.getName()).log(Level.SEVERE, null, ex);
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

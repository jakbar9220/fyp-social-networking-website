/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import daos.personDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ch
 */
public class post extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        try (PrintWriter out = response.getWriter()) {
            String eml = (String) session.getAttribute("UserLoggedIn");
            String pic = (String) session.getAttribute("PostPic");
            String chkpge = request.getParameter("checkpage");
            String post = request.getParameter("post");
            String id = request.getParameter("postid");
            String subpost = request.getParameter("subpost");
            String comment = request.getParameter("comment");
            personDAO pdao = new personDAO();
            long time = System.currentTimeMillis();
            java.sql.Timestamp date = new java.sql.Timestamp(time);
            if (pic != null) {
                pdao.addPosts(eml, post, date, pic);
                session.removeAttribute("PostPic");
                if ("timeline".equals(chkpge)) {
                    response.sendRedirect("timeline.jsp");
                } else {
                    response.sendRedirect("Home.jsp");
                }
            } else {
                if (subpost != null) {
                    pdao.addPosts(eml, post, date, pic);
                    if ("timeline".equals(chkpge)) {
                        response.sendRedirect("timeline.jsp");
                    } else {
                        response.sendRedirect("Home.jsp");
                    }
                } else {
                    if (pdao.checkDuplicateComment(Double.parseDouble(id), eml, post) == true) {
                        session.setAttribute("DuplicateComment", "check");
                    } else {
                        pdao.addComments(Double.parseDouble(id), eml, post, date);
                    }

                    response.sendRedirect("viewPost.jsp");
                }
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(joinnow.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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

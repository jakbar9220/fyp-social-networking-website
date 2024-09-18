/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import beans.person;
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
public class like_comment extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        double postID = Double.parseDouble(request.getParameter("getID"));
        String user = (String) session.getAttribute("UserLoggedIn");
        String like = request.getParameter("like");
        String comments = request.getParameter("comments");
        String unlike = request.getParameter("unlike");
        String checkp = request.getParameter("checkpage");
        try {
            personDAO pdao = new personDAO();
            person cUser;
            if (comments != null) {
                cUser = pdao.getPost(postID);
                session.setAttribute("cuser", cUser);
                response.sendRedirect("viewPost.jsp");
            } else {
                if (unlike != null) {
                    pdao.unlikePost(postID, user);
                } else if (like != null) {
                    pdao.likePost(postID, user);
                }
                if ("timeline".equals(checkp)) {
                    response.sendRedirect("timeline.jsp");
                } else if ("Home".equals(checkp)) {
                    response.sendRedirect("Home.jsp");
                } else if ("mylikes".equals(checkp)) {
                    response.sendRedirect("mylikes.jsp");
                } else if ("viewprofile".equals(checkp)) {
                    response.sendRedirect("viewprofile.jsp");
                } else if ("viewPost".equals(checkp)) {
                    response.sendRedirect("viewPost.jsp");
                } else {
                    response.sendRedirect("timeline.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(like_comment.class.getName()).log(Level.SEVERE, null, ex);
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

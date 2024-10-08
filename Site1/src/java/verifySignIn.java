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
public class verifySignIn extends HttpServlet {

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
        String msg;
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("emailId");
            String pass = request.getParameter("password");
            personDAO pdao = new personDAO();
            boolean isExists = pdao.userExists(email, pass);
            if (email == null || email.equals("") || pass == null || pass.equals("")) {
                msg = "Email or password cannot be empty.";
                session.setAttribute("Message", msg);
                response.sendRedirect("SignIn.jsp");
            } else if (!isExists) {
                msg = "Email or password is wrong.";
                session.setAttribute("Message", msg);
                response.sendRedirect("SignIn.jsp");
            } else {
                session.setAttribute("UserLoggedIn", email);               
                response.sendRedirect("timeline.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(verifySignIn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //<editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
}

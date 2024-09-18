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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ch
 */
public class joinnow extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String jn = request.getParameter("button1");
        String msg;
        try {
            personDAO pdao = new personDAO();
            Pattern pattern = Pattern.compile("[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}");
            Matcher matcher = pattern.matcher(email.toUpperCase());
            if (!matcher.matches()) {
                msg = "Invalid EmaiID!";
                session.setAttribute("MessageEmailId", msg);
                session.setAttribute("FNAME", fName);
                session.setAttribute("LNAME", lName);
                response.sendRedirect("index.jsp");
            } else {
                boolean alreadyExists = pdao.verifyEmail(email);
                if (alreadyExists) {
                    msg = "Email already exists. Sign in";
                    session.setAttribute("Message", msg);
                    response.sendRedirect("SignIn.jsp");
                } else {
                    if ((request.getParameter("pass") == null) || ("".equals(request.getParameter("pass")))) {
                        session.setAttribute("FNAME", fName);
                        session.setAttribute("LNAME", lName);
                        session.setAttribute("EMAIL", email);
                        response.sendRedirect("index.jsp");
                    } else {
                        if (pass.length() > 0 && pass.length() < 6) {
                            msg = "At least 6 characters!";
                            session.setAttribute("MessagePassword", msg);
                            session.setAttribute("FNAME", fName);
                            session.setAttribute("LNAME", lName);
                            session.setAttribute("EMAIL", email);
                            response.sendRedirect("index.jsp");
                        } else {
                            pdao.verifySignup(fName, lName, email, pass);
                            session.setAttribute("UserRequest", email);
                            session.setAttribute("UserLoggedIn", email);
                            response.sendRedirect("profile.jsp");
                        }
                    }
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

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
public class editProfile extends HttpServlet {

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
        String curEmail = (String) session.getAttribute("UserLoggedIn");
        String fName = request.getParameter("changeFN");
        String lName = request.getParameter("changeLN");
        //String email = request.getParameter("changeEml");
        String curpass = request.getParameter("currPass");
        String newpass = request.getParameter("newPass");
        String newpassa = request.getParameter("newPassA");
        String saveChanges = request.getParameter("saveChanges");
        String password;
        try {
            personDAO pdao = new personDAO();
            password = pdao.sendPassword(curEmail);
            if (saveChanges != null) {
                String curE = (String) session.getAttribute("UserLoggedIn");
                pdao.editProfile(fName, lName, curE);
                //session.setAttribute("UserLoggedIn", email);
                session.setAttribute("ShowMsg1", "Name succeccfully changed!");
                response.sendRedirect("editProfile.jsp");
            } else {
                if (!password.equals(curpass)) {
                    session.setAttribute("ShowMsg", "Current Password is wrong!");
                    response.sendRedirect("editProfile.jsp");
                } else if (!newpass.equals(newpassa) || newpass.length() < 6) {
                    session.setAttribute("ShowMsg", "New Passwords don't match or Password is too short!");
                    response.sendRedirect("editProfile.jsp");
                } else {
                    String nemail = (String) session.getAttribute("UserLoggedIn");
                    pdao.changePass(newpass, nemail);
                    session.setAttribute("ShowMsg2", "Password successfully changed!");
                    response.sendRedirect("editProfile.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(forgotPassword.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import daos.personDAO;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ch
 */
public class UploadDP extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isMultipart;
    private String filePath;
    private final int maxFileSize = 5000 * 1024;
    private final int maxMemSize = 5000 * 1024;
    private File file;

    @Override
    public void init() {
        // Get the file location where it would be stored.
        filePath = getServletContext().getInitParameter("file-upload");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        String user = (String) session.getAttribute("UserLoggedIn");
        PrintWriter out = response.getWriter();
        String msg;
        // Check that we have a file upload request
        isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
            msg = "No file uploaded.";
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("d:\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    //String contentType = fi.getContentType();
                    //boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    BufferedInputStream is = new BufferedInputStream(fi.getInputStream());
                    BufferedImage bimg = ImageIO.read(is);
                    int w = bimg.getWidth();
                    int h = bimg.getHeight();

                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    //fi.write(file);
                    if (null != fieldName) {
                        //session.removeAttribute("height");
                        switch (fieldName) {
                            case "editPP":
                                fi.write(file);
                                personDAO pdao = new personDAO();
                                pdao.addCrDp(null, null, fileName, null, user);
                                session.setAttribute("EditPP", "Public Profile Photo Successfully changed!");
                                response.sendRedirect("editProfile.jsp");
                                break;
                            case "editPC":
                                if (w >= 800 && (h > 150 && h <800)) {
                                    fi.write(file);
                                    personDAO pdao1 = new personDAO();
                                    pdao1.addCrDp(null, null, null, fileName, user);
                                    session.setAttribute("EditPC", "Public Cover Photo Successfully changed!");
                                } else {
                                    session.setAttribute("pubCovErr", "Your cover photo should be at least 800 wide and it's height should be between 150 and 800!");
                                }
                                response.sendRedirect("editProfile.jsp");
                                break;

                            case "file1":
                                fi.write(file);
                                session.setAttribute("UploadMsg", fileName);
                                response.sendRedirect("profile.jsp");
                                break;
                            case "filep1":
                                fi.write(file);
                                session.setAttribute("UploadMsgp", fileName);
                                response.sendRedirect("profile.jsp");
                                break;
                            case "file2":
                                if (w >= 800 && (h > 150 && h <800)) {
                                    fi.write(file);                                  
                                    session.setAttribute("UploadMsg1", fileName);
                                } else {
                                    session.setAttribute("priCovErr", "Your cover photo should be at least 800 wide and it's height should be between 150 and 800!");
                                }
                                response.sendRedirect("profile.jsp");
                                break;
                            case "filep2":
                                if (w >= 800 && (h > 150 && h <800)) {
                                    fi.write(file);
                                    session.setAttribute("UploadMsgp1", fileName);
                                } else {
                                    session.setAttribute("pubCovErr", "Your cover photo should be at least 800 wide and it's height should be between 150 and 800!");
                                }
                                response.sendRedirect("profile.jsp");
                                break;
                            case "file4":
                                fi.write(file);
                                session.setAttribute("UploadMsg", fileName);
                                response.sendRedirect("editProfile.jsp");
                                break;
                            case "file3":
                                if (w >= 800 && (h > 150 && h <800)) {
                                    fi.write(file);
                                    session.setAttribute("UploadMsg1", fileName);                                   
                                } else {
                                    session.setAttribute("pubCovErr", "Your cover photo should be at least 800 wide and it's height should be between 150 and 800!");
                                }
                                response.sendRedirect("editProfile.jsp");
                                break;
                            case "postPic1":
                                fi.write(file);
                                session.setAttribute("PostPic", fileName);
                                response.sendRedirect("timeline.jsp");
                                break;
                            case "postPic2":
                                fi.write(file);
                                session.setAttribute("PostPic", fileName);
                                response.sendRedirect("Home.jsp");
                                break;
                        }
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
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

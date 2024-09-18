<%-- 
    Document   : profile
    Created on : Jan 16, 2015, 3:47:43 PM
    Author     : ch
--%>

<%@page import="javax.swing.JPanel"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            
            .inputclass{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
            }

           .inputclass:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }                   
            .inputclass2{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
            }
            .inputclass2:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }
          
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cover and Profile Photo</title>
    </head>
    <body style="background-color:whitesmoke"> 
        <%
            String str = (String) session.getAttribute("UserRequest");
            if (str == null) {
                response.sendRedirect("signout.jsp");
            }
            String strc = (String) session.getAttribute("priCovErr");
            String strcp = (String) session.getAttribute("pubCovErr");
            if (strc != null || strcp != null) {
                JPanel panel = new JPanel();
                JOptionPane.showMessageDialog(panel, "Your cover photo should be at least 800 pixels wide and it's height should be between 150 and 800!", "Size Error", JOptionPane.INFORMATION_MESSAGE);
                session.removeAttribute("priCovErr");
                session.removeAttribute("pubCovErr");
            }
        %>
        <%@include file="header.jsp"%><br><br> 
        <div align="center">
            <div style=" 
                 padding:            0px;
                 width:              600px;
                 height:             600px;
                 border:             1px solid silver;
                 background-color: white;
                 text-align:         center;
                 font-family:        cursive;">  
                Add Profile and Cover Photo
                <hr style="
                    margin-left: 20px;
                    margin-right: 20px;">
                <form name="DPForm" action="UploadDP" method="post" enctype="multipart/form-data">
                    <table border="0" align="center" width="95%" style="margin-right: 18px;">
                        <tr>
                            <td rowspan="2" width="170">Upload Private Profile photo:</td>
                            <td rowspan="2" width="130" align="center">  
                                <div style=" 
                                     padding:            0px;
                                     width:              100px;
                                     height:             100px;
                                     border:             1px solid silver;
                                     color:              silver;">
                                    <%                                        String updp = (String) session.getAttribute("UploadMsg");
                                        String ur = (String) session.getAttribute("UserRequest");
                                        String dp = "images\\" + updp;
                                        if (updp != null && ur
                                                != null) {
                                    %>
                                    <img width="100" height="100" src = "<%=dp%>" alt="Not found"/>
                                    <%
                                        //session.removeAttribute("UploadMsg");
                                    } else {
                                    %>        
                                    Max Size<br>
                                    5000 x 1024 
                                    <%
                                        }
                                    %>                                       
                                </div>
                            </td>
                            <td>
                                <br>
                                <input type="file" name="file1" style="color:#006666" required />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">          
                                <input type="submit" name="submit1" value="Upload" class="inputclass2" />
                            </td>
                        </tr>  
                    </table>
                </form>
                <form name="coverForm" action="UploadDP" method="post" enctype="multipart/form-data">
                    <table border="0" align="center" width="95%" style="margin-right: 18px;">
                        <tr>
                            <td rowspan="2" width="170">Upload Private Cover photo:</td>
                            <td rowspan="2" width="130" align="center">  
                                <div style=" 
                                     padding:            0px;
                                     width:              100px;
                                     height:             100px;
                                     border:             1px solid silver;
                                     color:              silver;">
                                    <%
                                        String upco = (String) session.getAttribute("UploadMsg1");
                                        String upc = "images\\" + upco;
                                        if (upco != null && ur!= null) {
                                    %>
                                    <img width="100" height="100" src= "<%=upc%>" alt="Not found"/>
                                    <%
                                        //session.removeAttribute("UploadMsg1");
                                    } else {
                                    %>        
                                    Max Size<br>
                                    5000 x 1024
                                    <%
                                        }
                                    %>                                       
                                </div>
                            </td>
                            <td>          
                                <br><input type="file" name="file2" style="color:#006666" required />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <input type="submit" name="submit2" value="Upload" class="inputclass2" />
                            </td>
                        </tr>    
                    </table>
                </form> 
                <form name="publicDPForm" action="UploadDP" method="post" enctype="multipart/form-data">
                    <table border="0" align="center" width="95%" style="margin-right: 18px;">
                        <tr>
                            <td rowspan="2" width="170">Upload Public Profile photo:</td>
                            <td rowspan="2" width="130" align="center">  
                                <div style=" 
                                     padding:            0px;
                                     width:              100px;
                                     height:             100px;
                                     border:             1px solid silver;
                                     color:              silver;">
                                    <%
                                        String pupdp = (String) session.getAttribute("UploadMsgp");
                                        ur = (String) session.getAttribute("UserRequest");
                                        String pdp = "images\\" + pupdp;
                                        if (pupdp != null && ur!= null) {
                                    %>
                                    <img width="100" height="100" src = "<%=pdp%>" alt="Not found"/>
                                    <%
                                        //session.removeAttribute("UploadMsg");
                                    } else {
                                    %>        
                                    Max Size<br>
                                    5000 x 1024 
                                    <%
                                        }
                                    %>                                       
                                </div>
                            </td>
                            <td>
                                <br>
                                <input type="file" name="filep1" style="color:#006666" required />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">          
                                <input type="submit" name="submitp1" value="Upload" class="inputclass2" />
                            </td>
                        </tr>  
                    </table>
                </form>               
                <form name="publiccoverForm" action="UploadDP" method="post" enctype="multipart/form-data">
                    <table border="0" align="center" width="95%" style="margin-right: 18px;">
                        <tr>
                            <td rowspan="2" width="170">Upload Public Cover photo:</td>
                            <td rowspan="2" width="130" align="center">  
                                <div style=" 
                                     padding:            0px;
                                     width:              100px;
                                     height:             100px;
                                     border:             1px solid silver;
                                     color:              silver;">
                                    <%
                                        String pupco = (String) session.getAttribute("UploadMsgp1");
                                        String pupc = "images\\" + pupco;
                                        if (pupco != null && ur
                                                != null) {
                                    %>
                                    <img width="100" height="100" src= "<%=pupc%>" alt="Not found"/>
                                    <%
                                        //session.removeAttribute("UploadMsg1");
                                    } else {
                                    %>        
                                    Max Size<br>
                                    5000 x 1024
                                    <%
                                        }
                                    %>                                       
                                </div>
                            </td>
                            <td>          
                                <br><input type="file" name="filep2" style="color:#006666" required />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <input type="submit" name="submitp2" value="Upload" class="inputclass2" />
                            </td>
                        </tr>    
                    </table>
                </form> 

                <hr style="
                    margin-left: 20px;
                    margin-right: 20px;">
                <table border="0" width="97%" style="margin-right: 20px;">
                    <tr>                      
                        <td align="right">   
                            <%
                                if (updp == null || upco
                                        == null) {
                                    session.setAttribute("UserLoggedIn", ur);
                            %>
                            <a href="Home.jsp">
                                <input type="button" name="skip" value="Skip" class="inputclass" />
                            </a>
                                <%
                                } else {
                                    session.setAttribute("UserLoggedIn", ur);
                                %>
                            <a href="addCrDp"><input type="button" value="Next" class="inputclass" /></a>
                                <%
                                    }
                                %>
                        </td>
                    </tr>                      
                </table>
            </div>
        </div>
    </body>
</html>

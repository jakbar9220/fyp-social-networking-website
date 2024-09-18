<%-- 
    Document   : editProfile
    Created on : Jan 19, 2015, 4:15:44 PM
    Author     : ch
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JPanel"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="daos.personDAO, beans.person"%>
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
                border-color: white;
                background-color:white;
                color:#006666;
                border-style: none;
                font-family: cursive;
                font-size: 15px;
            }
            .inputclass2:hover { 
                font-weight: bold;
                cursor:pointer;
            } 

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>  
        <%            session.setAttribute("editPhotos", "no");
        %>
        <%@include file="head.jsp" %>
    </head>
    <body style="background-color:whitesmoke">  
        <% 
            String strc = (String) session.getAttribute("priCovErr");
            String strcp = (String) session.getAttribute("pubCovErr");
            if (strc != null || strcp != null) {
                JPanel panel = new JPanel();
                JOptionPane.showMessageDialog(panel, "Your cover photo should be at least 800 pixels wide and it's height should be between 150 and 800!", "Size Error", JOptionPane.INFORMATION_MESSAGE);
                session.removeAttribute("priCovErr");
                session.removeAttribute("pubCovErr");
            }
        %>
        <div align="center">
            <div
                style=" 
                width: 600px;
                height: 100%;            
                border: 1px solid silver;
                background-color: white;
                font-family: cursive;
                color:#006666">
                <br>
                <form method="post" action="editProfile">
                    <table border="0">
                        <tr><td colspan="2" align="center" style="font-weight: bold;font-size: 20px;background-color:#006666;color:whitesmoke ">Change your Name<br></td></tr>
                        <tr>
                            <td width="250"><br>First Name:</td>
                            <td><br><input type="text" name="changeFN" value="<%=p.getFirstName()%>"></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><input type="text" name="changeLN" value="<%=p.getLastName()%>"></td>
                        </tr>                 
                        <tr><td colspan="2"><hr></td></tr>
                                <%String str1 = (String) session.getAttribute("ShowMsg1");
                                    if (str1 != null) {
                                %><tr><td colspan="2" align="center"><%=str1%></td></tr><%
                                        session.removeAttribute("ShowMsg1");
                                    }
                            %>
                        <tr><td colspan="2" align="right"><input class="inputclass" type="submit" name="saveChanges" value="Save Changes"></td></tr>
                    </table>
                </form>
                <br>
                <form method="post" action="editProfile">
                    <table border="0">
                        <tr>
                            <td colspan="2" align="center" style="font-weight: bold;font-size: 20px;background-color:#006666;color:whitesmoke">Change your Password<br></td>
                        </tr>
                        <tr>
                            <td width="250" ><br>Enter current Password:</td>
                            <td><br><input type="password" name="currPass"></td>
                        </tr>
                        <tr>
                            <td>Enter new Password:</td>
                            <td><input type="password" name="newPass" required></td>
                        </tr>
                        <tr>
                            <td>Enter new Password Again:</td>
                            <td><input type="password" name="newPassA"></td>
                        </tr>
                        <tr><td colspan="2"><hr></td></tr>
                                <% String str = (String) session.getAttribute("ShowMsg");
                                    String strp = (String) session.getAttribute("ShowMsg2");

                                    if (str != null) {

                                %>
                        <tr><td colspan="2" align="center"><div style=" 
                                                                padding:            0px;   
                                                                width:              400px;
                                                                height:             20px;
                                                                border:             1px solid lightcoral;
                                                                background-color:   #ffe2e2;
                                                                text-align:         center;
                                                                font-family:        serif;
                                                                color:              red;">    
                                    <%=str%>
                                    <% session.removeAttribute("ShowMsg");%></div></td></tr>
                        <%} else if (strp != null) {%><tr><td colspan="2" align="center"><%=strp%><% session.removeAttribute("ShowMsg2");%></td></tr><%}%>
                        <tr><td colspan="2" align="right"><input class="inputclass" type="submit" name="savePass" value="Save Password"></td></tr>
                        <tr><td colspan="2"><hr></td></tr>
                    </table>
                </form>
                <table>
                    <tr><th colspan="2" align="left" width="400">Edit public profile photo:</th></tr>
                    <tr>
                        <td>
                            <div style=" 
                                 padding:            0px;
                                 width:              100px;
                                 height:             100px;
                                 border:             1px solid silver;
                                 color:              silver;">  
                                <%if (p.getPublicProPhoto() != null) {%>
                                <img style="width:100px;height:100px" src="images\\<%=p.getPublicProPhoto()%>" alt="Not Found"/>
                                <%}%>
                            </div>
                        </td>
                        <td align="right">
                            <form method="post" action="UploadDP" enctype="multipart/form-data">
                                <input class="inputclass" type="submit" name="editpp" value="Edit">
                                <input type="file" name="editPP" required>
                            </form></td></tr>  
                            <% String str2 = (String) session.getAttribute("EditPP");
                                if (str2 != null) {%>
                    <tr><td colspan="2" align="center"><%=str2%></td></tr><%session.removeAttribute("EditPP");
                        }%>
                    <tr><th colspan="2" align="left">  <br>Edit public cover photo:</th></tr>
                    <tr>
                        <td>
                            <div style=" 
                                 padding:            0px;
                                 width:              100px;
                                 height:             100px;
                                 border:             1px solid silver;
                                 color:              silver;">
                                <%if (p.getPublicCovPhoto() != null) {%>
                                <img style="width:100px;height:100px" src="images\\<%=p.getPublicCovPhoto()%>" alt="Not Found"/>
                                <%}%>
                            </div>
                        </td>
                        <td align="right">
                            <form method="post" action="UploadDP" enctype="multipart/form-data">
                                <input class="inputclass" type="submit" name="editpc" value="Edit">
                                <input type="file" name="editPC" required>
                            </form></td></tr>
                            <% String str3 = (String) session.getAttribute("EditPC");
                                if (str3 != null) {%>
                    <tr><td colspan="2" align="center"><%=str3%></td></tr><%session.removeAttribute("EditPC");
                        }%>
                    <tr><td colspan="2"><hr></td></tr>
                    <tr><td colspan="2" align="center"><a href="Home.jsp"><input class="inputclass" type="button" name="cancel" value="Cancel"></a></td></tr>
                </table>
                <br>   
                <div align="left" style="margin-left:10px; margin-bottom: 10px">
                    <form action="delAccount">
                        <input class="inputclass2" 
                               type="submit" 
                               name="delacc"
                               value="Delete your account"
                               onclick="if (confirm('Are you sure you want to delete your account permanently? You cannnot undo this action!'))
                                           form.action = 'delAccount';
                                       else
                                           return false;">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

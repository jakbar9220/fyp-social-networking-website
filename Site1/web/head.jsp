<%-- 
    Document   : head
    Created on : Jan 20, 2015, 3:18:50 PM
    Author     : ch
--%>

<%@page import="javax.swing.ImageIcon"%>
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

            #aid{
                text-decoration: none;
                color:#006666;
                font-family: cursive;
                font-size: 20px;
                font-weight: bold;
                ;
            }


            .inputclass1{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
            }
            .inputclass1:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }


            .crop {
                width: 100%;
                height: 300px;
                overflow: hidden;
            }

            .cropimage {
                width: 100%;               

            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String st1 = (String) session.getAttribute("UserLoggedIn");
            String st2 = (String) session.getAttribute("editPhotos");
            String st4 = (String) session.getAttribute("UploadMsg");
            String st3 = (String) session.getAttribute("UploadMsg1");
            String h = (String) session.getAttribute("height");

            if (st1 == null) {
                response.sendRedirect("signout.jsp");
            }
        %>
        <%@include file="header.jsp" %>    
        <%               String cov1;
            String pro1;
            String cov = null;
            p = pdao.getPersonP(st1);
            pro = "images\\" + p.getProPhoto();
            cov = "images\\" + p.getCovPhoto();
            if (st3 != null) {
                cov1 = st3;
                pdao.addCrDp(null, cov1, null, null, st1);
            } else {
                cov1 = p.getCovPhoto();
            }
            if (st4 != null) {
                pro1 = st4;
                pdao.addCrDp(pro1, null, null, null, st1);
            } else {
                pro1 = p.getProPhoto();
            }
        %>
        <div 
            style="
            position: relative;
            width: 100%;
            height: 300px;
            border: 1px solid silver;  
            background-color:lightgrey;
            background-image: url('images\\<%=cov1%>');
            background-size: 100% 300px;
            "
            >
            <%
                if (st2 == "yes") {
                    if (p.getCovPhoto() != null) {
                        ImageIcon image = new ImageIcon("C:/Users/ch/Desktop/friendlink/Site1/web//" + cov);
                        //int width = 0;
                        int height = 0;
                        //width = image.getIconWidth(); //width
                        height = image.getIconHeight(); // height
            %>
            <div class="crop"> 
                <%if(height>150 && height<=350){%>
                <img style="height:400px; margin: -100px 0px 0px 0px;" class="cropimage" src="<%=cov%>" alt=""/>    
                <%}else if(height>350 && height<=550){%>
                <img style="height:500px; margin: -100px 0px 0px 0px;" class="cropimage" src="<%=cov%>" alt=""/>    
                <%}else if(height>550 && height<800){%>
                <img style="height:700px; margin: -100px 0px 0px 0px;" class="cropimage" src="<%=cov%>" alt=""/>    
                <%}%>
            </div>
            <%
                }
            } else {
            %>
            <form method="post" action="UploadDP" enctype="multipart/form-data">
                <input type="file" name="file3" style="color:whitesmoke;font-size: 13px; background-color:#006666;width:100%;height:30px" required>
                <input class="inputclass1" type="submit" name="changeCov" value="Change">
            </form>
            <%
                }
            %>
            <div 
                style=" 
                position: absolute;
                width: 200px;
                height: 200px;
                top: 150px;
                left: 10px;
                border: 1px solid silver;
                background-color:lightgrey;
                background-image: url('images\\<%=pro1%>');
                background-size: 200px 200px;
                background-repeat: no-repeat;
                ">
                <%
                    if (st2 == "yes") {
                        if (p.getProPhoto() != null) {
                %>
                <img width="200" height="200" src="<%=pro%>" alt=""/>
                <%} else {%>
                <img width="200" height="200" src="p1.jpg" alt=""/>
                <%}%>
                <div align="center">
                    <a href="Home.jsp"
                       id="aid">
                        <%=p.getFirstName()%>
                        <%=p.getLastName()%>
                    </a></div>
                    <%
                    } else {
                    %>  
                <form method="post" action="UploadDP" enctype="multipart/form-data">
                    <input type="file" name="file4" style="color:whitesmoke;font-size: 13px;background-color:#006666;width:200px;height:30px" required>               
                    <input class="inputclass1" type="submit" name="changePro" value="Change">
                </form>
                <%
                    }
                %>
            </div>
        </div>
        <br>
    </body>
</html>

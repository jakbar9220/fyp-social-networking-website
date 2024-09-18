<%-- 
    Document   : mylikes
    Created on : Feb 17, 2015, 12:47:57 PM
    Author     : ch
--%>

<%@page import="beans.person"%>
<%@page import="java.util.ArrayList"%>
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
            .tdclass{
                border:1px solid silver;
                //border-left-color: #006666;
                //border-left-width: 4px;
                border-top-color: #006666;
                border-top-width: 7px;
                //border-right-color: #006666;
                //border-right-width: 4px;
                background-color: white;  
            }

            .tdclass:hover {
                background-color: lightgray;

            }
            .inputclassj{
                background-color: whitesmoke;

                border-style: none;
                color:#006666;
                font-family: cursive;
                font-size: 13px;
                font-weight:bold;
            }

            .inputclassj:hover { 
                text-decoration: underline;
                cursor:pointer;
            }

            .divclass{
                width:100px;
                //height:100%;
                margin-right:20px;
                border: 1px solid #006666;
                text-align: center;
                font-family: cursive;
                background-color:#006666;
                height:24px;
                border-radius: 4px;


            }

            .divclass:hover {
                border-color:  #cccccc;


            }

            .inputclass2{
                background-color: #006666;
                border-color: #006666;
                border-style: none;
                color:whitesmoke;
                font-family: cursive;
                font-size: 17px;
            }

            .inputclass2:hover {
                font-weight:bold;
                cursor:pointer;

            }

            .inputclass{
                background-color: whitesmoke;
                border-color: whitesmoke;
                border-style: none;
                color:#006666;
                font-family: cursive;
                font-size: 12px
            }

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Likes</title>              
    </head>
    <body style="background-color:whitesmoke">
        <%session.setAttribute("editPhotos", "yes");%>
        <%@include file="head.jsp"%> 
        <div align="right">
            <a style="text-decoration: none;color:whitesmoke" href="editProfile.jsp">
                <div class="divclass">
                    Edit Profile
                </div>
            </a>
        </div>     
        <div align="center"><br>
            <div style="width:600px;
                 //border:1px solid silver;
                 height:45px;
                 color:#006666;
                 font-family: cursive;
                 font-size: 30px;
                 font-weight: bold">
                Likes </div><br>
                <%String sort = (String) session.getAttribute("Sort");%>
            <div style="width:600px;
                 //border:1px solid silver;
                 height:100%;
                 color:#006666;
                 font-family: cursive;
                 font-size: 25px;
                 font-weight: bold">
                <div align="right">
                    <form method="post" action="sort">
                        <%if (sort == "name") {%>
                        <input class="inputclassj" type="submit" name="LbyTime" value="Sort By Time">
                        <%session.removeAttribute("Sort");%>
                        <%} else if (sort == "time") {%>
                        <input class="inputclassj" type="submit" name="LbyName" value="Sort By Name">
                        <%session.removeAttribute("Sort");%>
                        <%} else {%>  
                        <input class="inputclassj" type="submit" name="LbyName" value="Sort By Name">
                        <%}%>
                    </form>
                </div>
            </div>
            
            <div style="float: left;
                 margin-left: 10px;
                 font-family: cursive;
                 font-size:17px">
                <table style="width:200px;">
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666;" href="timeline.jsp">Home</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666" href="mylikes.jsp">My Likes</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666" href="Home.jsp">My Posts</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666" href="friends.jsp">Friends</a>
                        </td>
                    </tr>
                </table>
            </div>  
            <div
                style=" 
                width: 600px;
                height: 100%;            
                //border: 1px solid silver;
                font-family: cursive;
                color:#006666">
                <%                         ArrayList list;
                    // personDAO pdao = new personDAO();
                    if (sort == "name") {
                        list = pdao.getLikes1(st1);
                    } else if (sort == "time") {
                        list = pdao.getLikes(st1);
                    } else {
                        list = pdao.getLikes(st1);
                    }
                    if (list != null && !list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                            person p1 = (person) list.get(i);
                            String postId = "" + p1.getPostId();
                            String emailId = p1.getEmailId();
                            session.setAttribute("viewPro", emailId);
                            person p2 = pdao.getPersonP(emailId);
                            boolean checkUliked = pdao.checkUliked(p1.getPostId(), st1);
                            long cl = pdao.countLikes(p1.getPostId());
                            long cc = pdao.countComments(p1.getPostId());
                %>
                <div
                    style="
                    width:600px;
                    height:100%;
                    border: 1px solid silver;
                    font-family: cursive;
                    background-color: white;
                    color:#006666;
                    //
                    ">
                    <div align="left"
                         style="
                         //width:600px;
                         height:100%;
                         //border: 1px solid silver;
                         font-family: cursive;
                         color:#006666;
                         margin: 10px;
                         ">
                        <table border="0" width="100%">
                            <tr>
                                <td rowspan="2" width="50px" >
                                    <%if (p2.getProPhoto() != null) {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p2.getProPhoto()%>" alt="Not Found"/>
                                    <%} else {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                                </td>
                                <td>
                                    <table border="0" width="100%">
                                        <tr>
                                            <td colspan="2" height="25px" style="background-color: #006666;">
                                                <form method="post" action="viewProfile">
                                                    <input type="hidden" name="viewPro" value="<%=emailId%>">
                                                    <input class="inputclass2" 
                                                           type="submit" value="<%=p2.getFirstName()%> <%=p2.getLastName()%>">
                                                </form>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: 10px;"><%=p1.getTime()%></td>
                                            <td align="right">
                                                <!--<a style="color: #006666;font-size: 10px;" href="editPost">Edit</a>-->
                                                <form method="post" action="like_comment">                                               
                                                    <input type="hidden" name="getID" value="<%=postId%>">
                                                    <input type="hidden" name="checkpage" value="mylikes">
                                                    <%
                                                        if (checkUliked != true) {

                                                    %>
                                                    <input class="inputclass" type="image" name="like" value="submit" src="like.gif" onMouseOut="this.src = 'like.gif'" onMouseOver="this.src = 'like2.gif'" alt="x" width="20" height="20" align="center" title="Like">
                                                    <%if (cl > 0) {%><font class="inputclass"><%=cl%><%}%></font>
                                                    <%} else {%>
                                                    <input class="inputclass" type="image" name="unlike" value="submit" src="like1.gif" alt="x" width="20" height="20" align="center" title="unLike">
                                                    <%if (cl > 0) {%><font class="inputclass"><%=cl%><%}%></font>
                                                    <%}%>
                                                    <input class="inputclass" type="image" name="comments" value="submit" src="comment.gif" onMouseOut="this.src = 'comment.gif'" onMouseOver="this.src = 'comment1.gif'" alt="x" width="20" height="20" align="center" title="Comment">
                                                    <%if (cc > 0) {%><font class="inputclass"><%=cc%><%}%></font>
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <%if (p1.getPost() != null) {%>
                        <div><%=p1.getPost()%></div>
                        <%}%>
                        <%if (p1.getPic() != null) {%>
                        <div><img style="width:100%" src="images//<%=p1.getPic()%>" alt="Not Found"/></div>
                            <%}%>
                    </div>
                </div>
                <%

                    }
                } else {
                %>
                <div style="width:600px;
                     height:100%;
                     border: 1px solid silver;
                     font-family: cursive;
                     background-color: white;
                     color:#006666;">No Likes</div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : viewPost
    Created on : Feb 25, 2015, 11:19:28 AM
    Author     : ch
--%>

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
            .inputclass{
                background-color: whitesmoke;
                border-color: whitesmoke;
                border-style: none;
                color:#006666;
                font-family: cursive;
                font-size: 12px;
            }

            .divclass{
                width:600px;
                height:100%;
                border: 1px solid silver;
                background-color: white;
                font-family: cursive;
                color:#006666;
                //;
            }

            .divclass2{
                //width:600px;
                height:100%;
                //border: 1px solid silver;
                font-family: cursive;
                color:#006666;
                margin: 10px;
                ;
            }

            .divclass3{
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

            .divclass3:hover {
                border-color:  #cccccc;


            }

            .inputclass2{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
                margin-right:5px;
            }
            .inputclass2:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }

            .inputclass3{
                background-color: #006666;
                border-color: #006666;
                border-style: none;
                color:whitesmoke;
                font-family: cursive;
                font-size: 17px;
            }
            .inputclass3:hover { 
                font-weight: bold;
                cursor:pointer;
            }


        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%session.setAttribute("editPhotos", "yes");%>
        <%@include file="head.jsp"%>
        <%            person cUser = (person) session.getAttribute("cuser");
            boolean checkUliked = pdao.checkUliked(cUser.getPostId(), st1);
            p = pdao.getPersonP(cUser.getEmailId());
        %>
        <title><%=p.getFirstName()%> <%=p.getLastName()%></title>              
    </head>
    <body style="background-color:whitesmoke">

        <div align="right">
            <a style="text-decoration: none;color:whitesmoke" href="editProfile.jsp">
                <div class="divclass3">
                    Edit Profile
                </div>
            </a>
        </div>     
        <div align="center">
            <div style="width:600px;height:100px">                           
            </div>
            <br>
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
            <div class="divclass">            
                <div align="left" class="divclass2">
                    <table border="0" width="100%">
                        <tr>
                            <td rowspan="2" width="50px" >
                                <%if (p.getProPhoto() != null) {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p.getProPhoto()%>" alt="Not Found"/>
                                <%} else {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                            </td>
                            <td>
                                <table border="0" width="100%">
                                    <tr>
                                        <td colspan="2" height="25px" style="background-color: #006666;">
                                            <form method="post" action="viewProfile">
                                                <input type="hidden" name="viewPro" value="<%=cUser.getEmailId()%>">
                                                <input class="inputclass3" 
                                                       type="submit" value="<%=p.getFirstName()%> <%=p.getLastName()%>">
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px;"><%=cUser.getTime()%></td>
                                        <td align="right">
                                            <!--<a style="color: #006666;font-size: 10px;" href="editPost">Edit</a>-->
                                            <% long cl = pdao.countLikes(cUser.getPostId());
                                                long cc = pdao.countComments(cUser.getPostId());
                                            %>
                                            <form method="post" action="like_comment">
                                                <input type="hidden" name="getID" value="<%=cUser.getPostId()%>">
                                                <input type="hidden" name="checkpage" value="viewPost">
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
                    <%if (cUser.getPost() != null) {%>
                    <div><%=cUser.getPost()%></div>
                    <%}%>
                    <%if (cUser.getPic() != null) {%>
                    <div><img style="width:100%" src="images//<%=cUser.getPic()%>" alt="Not Found"/></div>
                        <%//session.removeAttribute("PostPic");%>
                        <%}%>
                </div>
            </div>   
            <div style="background-color: whitesmoke;" class="divclass" align="right">
                <form method="post" action="post">
                    <textarea rows="4" style="width:99%;resize: none;" name="post" placeholder="Write..." required></textarea>
                    <input type="hidden" name="postid" value="<%=cUser.getPostId()%>">
                    <input class="inputclass2" type="submit" name="comment" Value="Comment" >
                </form>
                <br>
            </div>
            <%
                ArrayList list;
                // personDAO pdao = new personDAO();               
                list = pdao.getComments(cUser.getPostId());
                if (list != null && !list.isEmpty()) {
                    for (int i = 0; i < list.size(); i++) {
                        person p1 = (person) list.get(i);
                        String postId = "" + p1.getPostId();
                        String emailId = p1.getEmailId();
                        person p2 = pdao.getPersonP(emailId);
            %>
            <div class="divclass">            
                <div align="left" class="divclass2">
                    <table border="0" width="100%">
                        <tr>
                            <td rowspan="2" width="50px" >
                                <% if (pdao.checkFriend(st1, emailId) || emailId.equals(st1)) {%>                             
                                <%if (p2.getProPhoto() != null) {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p2.getProPhoto()%>" alt="Not Found"/>
                                <%} else {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                                <%} else {%>
                                <%if (p2.getPublicProPhoto() != null) {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p2.getPublicProPhoto()%>" alt="Not Found"/>
                                <%} else {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                                <%}%>
                            </td>
                            <td>
                                <table border="0" width="100%">
                                    <tr>
                                        <td height="25px" style="background-color: #006666;">
                                            <form method="post" action="viewProfile">
                                                <input type="hidden" name="viewPro" value="<%=emailId%>">
                                                <input class="inputclass3" 
                                                       type="submit" value="<%=p2.getFirstName()%> <%=p2.getLastName()%>">
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px;"><%=p1.getTime()%></td>                                   
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <%=p1.getPost()%>
                </div>
            </div>   
            <%
                    }
                }
            %>
        </div>
        <%
            String ms = (String) session.getAttribute("DuplicateComment");
            if (ms != null) {
        %>
        <script type="text/javascript">
            alert('Duplicate Comment!');
        </script>
        <%
                session.removeAttribute("DuplicateComment");
            }
        %>
    </body>
</html>

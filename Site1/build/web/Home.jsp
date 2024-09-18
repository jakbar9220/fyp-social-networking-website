<%-- 
    Document   : Home
    Created on : Jan 7, 2015, 3:17:07 PM
    Author     : ch
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                font-size: 12px
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



            .aclass{
                text-decoration: none;
                color:whitesmoke;
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
                    
            .aclass2{
                text-decoration: none;
                color:whitesmoke;
                font-size: 17px;
            }
            
            .aclass2:hover {
                font-weight: bold;


            }
            
             .inputcross{
                border:none;
                background-color:whitesmoke;
                color:#006666;
            }
            
            .inputcross:hover {
                background-color: lightgray;
                cursor:pointer;

            }
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            session.setAttribute("editPhotos", "yes");
            session.setAttribute("CheckLog", "yes");
        %>
        <%@include file="head.jsp"%>
        <title><%=p.getFirstName()%> <%=p.getLastName()%></title>
    </head>
    <body style="background-color:whitesmoke">      
        <div align="right">
            <a class="aclass" href="editProfile.jsp">
                <div class="divclass">
                    Edit Profile
                </div>
            </a>
        </div>       
        <div align="center">
            <div style="width:600px;height: 100px">
                <div align="left"><form action="UploadDP" method="post" enctype="multipart/form-data">                 
                        <input type="submit" name="postpic2" value="Upload Picture" class="inputclass2" />
                        <input type="file" name="postPic2" style="color:#006666" required/>  
                    </form></div>
                    <%String postP = (String) session.getAttribute("PostPic");
                        if (postP != null) {%>
                <div align="left">
                    <form action="cancel" method="post">
                        <img width="50" height="50" src="images//<%=postP%>" alt="Not Found"/>
                        <input type="hidden" name="checkpage" value="Home">
                        <input class="inputcross" type="submit" name="subpost" Value="X">
                    </form>
                </div>
                <%}%>
                <form action="post" method="post"> 
                    <%if (postP != null) {%>
                    <textarea rows="4" style="width:99%;resize: none;" name="post" placeholder="Write..."></textarea>
                    <%} else {%>
                    <textarea rows="4" style="width:99%;resize: none;" name="post" placeholder="Write..." required></textarea>
                    <%}%>
                    <input type="hidden" name="checkpage" value="Home">
                    <input class="inputclass2" type="submit" name="subpost" Value="Post">
                </form>
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
            <br>
            <div style="width:600px;height:100%" >
                <%if (postP != null) {%>
                <br><br><br>
                <% }
                    ArrayList list;
                    // personDAO pdao = new personDAO();
                    list = pdao.getPosts(st1);
                    if (list != null && !list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                            person p1 = (person) list.get(i);
                            String postId = "" + p1.getPostId();
                            boolean checkUliked = pdao.checkUliked(p1.getPostId(), st1);
                            long cl = pdao.countLikes(p1.getPostId());
                            long cc = pdao.countComments(p1.getPostId());
                %>
                <div
                    style="
                    width:600px;
                    height:100%;
                    border: 1px solid silver;
                    background-color: white;
                    font-family: cursive;
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
                                    <%if (p.getProPhoto() != null) {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p.getProPhoto()%>" alt="Not Found"/>
                                    <%} else {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                                </td>
                                <td>
                                    <table border="0" width="100%">
                                        <tr>
                                            <td colspan="2" height="25px" style="background-color: #006666;">
                                                <a class="aclass2" href="Home.jsp">&nbsp;<%=p.getFirstName()%> <%=p.getLastName()%></a><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="250px" style="font-size: 10px;"><%=p1.getTime()%></td>                                          
                                            <td align="right">
                                                <form method="post" action="like_comment">
                                                    <input type="hidden" name="getID" value="<%=postId%>">
                                                    <input type="hidden" name="checkpage" value="Home">
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
                            <%//session.removeAttribute("PostPic");%>
                            <%}%>
                        <div align="right">
                            <form method="post" action="editPost">
                                <input type="hidden" name="getID" value="<%=postId%>">
                                <input type="hidden" name="getPost" value="<%=p1.getPost()%>">

                                <input class="inputclass" type="image" name="editPost" value="submit" src="edit2.gif" onMouseOut="this.src = 'edit2.gif'" onMouseOver="this.src = 'edit3.gif'" alt="x" width="15" height="15" align="center" title="Edit">

                                <input class="inputclass" type="image" name="delPost" value="submit" src="delete2.gif" onMouseOut="this.src = 'delete2.gif'" onMouseOver="this.src = 'delete3.gif'" alt="x" width="15" height="15" align="center" title="Delete"
                                       onclick="if (confirm('Are you sure you want to delete this post?'))
                                                   form.action = 'editPost';
                                               else
                                                   return false;">
                            </form>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>

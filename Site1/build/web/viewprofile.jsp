<%-- 
    Document   : viewprofile
    Created on : Jan 23, 2015, 11:16:15 PM
    Author     : ch
--%>

<%@page import="javax.swing.ImageIcon"%>
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
            .inputclass{
                background-color: whitesmoke;
                border-color: whitesmoke;
                border-style: none;
                color:#006666;
                font-family: cursive;
                font-size: 12px;
            }                            

            .divclass{
                width:150px;
                //height:100%;
                margin-right:20px;
                border: 1px solid #006666;
                text-align: center;
                font-family: cursive;
                background-color:#006666;
                height:25px;
                border-radius: 4px;

            }

            .divclass:hover {
                border-color:  #cccccc;
                cursor:pointer;
            }

            .aclass{
                text-decoration: none;
                color:whitesmoke;
            }

            a.sp:hover {
                text-decoration: none;
                color:whitesmoke;
                background-color: #ff0 ;
            }



            .divclass2{
                width:150px;
                height:24px;
                margin-right:20px;
                text-align: center;
                font-family: cursive;
                border:1px solid silver;
                background-color:whitesmoke;
                border-radius: 4px;
            }

            .divclass2:hover {
                border-color:  #006666;
                cursor:pointer;
            }

            .inputclass2{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
                float:right;
            }
            .inputclass2:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }



            .aclass2{
                text-decoration: none;
                color:whitesmoke;
                font-size: 17px;
            }

            .aclass2:hover {
                font-weight: bold;
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
        <%@include file="header.jsp"%>
        <%            Object obj = session.getAttribute("viewUser");
            p = (person) obj;
        %>
        <title><%=p.getFirstName()%> <%=p.getLastName()%></title>
    </head>
    <body style="background-color:whitesmoke">
        <%
            String st1 = (String) session.getAttribute("UserLoggedIn");
            String st2 = (String) session.getAttribute("viewPosts");
            if (st1 == null) {
                session.setAttribute("Check", "Sign in to continue..");
                response.sendRedirect("SignIn.jsp");
            }
            String cov = null;
            pro = null;
            if (pdao.checkFriend(st1, st2)) {
                if (p.getCovPhoto() != null) {
                    cov = "images\\" + p.getCovPhoto();
                }
                if (p.getProPhoto() != null) {
                    pro = "images\\" + p.getProPhoto();
                }
            } else {
                if (p.getPublicCovPhoto() != null) {
                    cov = "images\\" + p.getPublicCovPhoto();
                }
                if (p.getPublicProPhoto() != null) {
                    pro = "images\\" + p.getPublicProPhoto();
                }
            }
        %>
        <div align=center
             style="
             position: relative;
             width: 100%;
             height: 300px;
             border: 1px solid silver;  
             background-color: lightgrey;
             background-size: 100% 300px;
             "
             >  
            <%if (cov != null) {
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
            <%}%>
            <div style=" 
                 position: absolute;
                 width: 200px;
                 height: 20px;
                 top: 150px;
                 left: 10px;
                 border: 1px solid silver;
                 background-size: 200px 200px;
                 background-repeat: no-repeat;
                 ">
                <%if (pro != null) {%>
                <img width="200" height="200" src="<%=pro%>" alt="Not found"/>
                <%} else {%>
                <img width="200" height="200" src="p1.jpg" alt=""/>
                <%}%>
                <a href="#"
                   style="
                   text-decoration: none;
                   color:#006666;
                   font-family: cursive;
                   font-size: 18px;
                   font-weight: bold;
                   ">
                    <%=p.getFirstName()%>
                    <%=p.getLastName()%>
                </a>           
            </div>
        </div>
        <br><br>
        <div align="right" style="float:right">
            <%
                if (pdao.checkFriend(st1, st2)) {%>
            <a class="aclass" href="unFriend" title="UnFriend"  onclick="if (confirm('Are you sure you want to unfriend <%=p.getFirstName()%> <%=p.getLastName()%> ?'))
                        return true;
                    else
                        return false;">
                <div class="divclass">                   
                    Friend                                 
                </div>
            </a>
            <%} else if (pdao.checkRequest(st1, st2)) {%>  
            <a class="aclass" href="cancelRequest" title="Cancel Request">
                <div class="divclass">                   
                    Requested                              
                </div>
            </a>
            <%} else if (pdao.checkSentRequest(st1, st2)) {%>  
            <a class="aclass" href="acceptRequest">
                <div class="divclass">                   
                    Accept Request                                
                </div>
            </a>
            <%} else {%>  
            <a style="text-decoration:none;color:#006666" href="addFriend">
                <div class="divclass2">                   
                    Add Friend                               
                </div>
            </a>
            <%}%>
            <br>
            <div class="divclass">                   
                <form method="post" action="sendMessage">
                    <input class="divclass" 
                           style="color:whitesmoke;font-size: 15px;border-style: none;border-color: #006666" 
                           type="submit" 
                           name="sendMsg" 
                           value="Message">
                </form>                              
            </div>
            <%String msg = (String) session.getAttribute("sendmsg");
                if (msg != null) {%>
            <div style="width:300px;
                 height:100%;
                 margin-right:20px;
                 text-align: center;
                 font-family: cursive;
                 ">
                <form action="sendMessage" method="post"> 
                    <textarea rows="5" style="width:98.4%;resize: none;" name="msg" placeholder="Write..." required></textarea>
                    <input type="hidden" name="checkpage" value="Home">                                   
                    <input class="inputclass2" type="submit" name="smsg" Value="Send">
                </form>
                <form action="sendMessage"><input class="inputclass2" type="submit" name="cmsg" Value="Cancel"></form>
            </div>
            <% session.removeAttribute("sendmsg");
                }%>

        </div>      
        <div align="center">         
            <br><br>
            <div style="float: left;
                 margin-left: 10px;
                 font-family: cursive;">

            </div>
            <%if (pdao.checkFriend(st1, st2)) {%>
            <%
                ArrayList list;
                // personDAO pdao = new personDAO();
                list = pdao.getPosts(st2);
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
                            <td rowspan="3" width="50px" >
                                <%if (p.getProPhoto() != null) {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p.getProPhoto()%>" alt="Not Found"/>
                                <%} else {%>
                                <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                            </td>
                            <td>
                                <table border="0" width="100%">
                                    <tr>
                                        <td colspan="2" height="25px" style="background-color: #006666;">
                                            <a class="aclass2" href="">&nbsp;<%=p.getFirstName()%> <%=p.getLastName()%></a><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px;"><%=p1.getTime()%></td>
                                        <td align="right">
                                            <!--<a style="color: #006666;font-size: 10px;" href="editPost">Edit</a>-->
                                            <form method="post" action="like_comment">
                                                <input type="hidden" name="checkpage" value="viewprofile">
                                                <input type="hidden" name="getID" value="<%=postId%>">
                                                <input type="hidden" name="getPost" value="<%=p1.getPost()%>">
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
                </div>
            </div>
            <%
                    }
                }
            } else {
            %>
            <div style="color:#006666;font-family: cursive">Send Friend Request to view <%=p.getFirstName()%> <%=p.getLastName()%>'s posts!</div>
            <%
                }
            %>
        </div>
        <%
            String ms = (String) session.getAttribute("sent");
            if (ms != null) {
        %>
        <script type="text/javascript">
            alert('Message sent!');
        </script>
        <%
                session.removeAttribute("sent");
            }
        %>
    </body>
</html>

<%-- 
    Document   : viewAllMsgs
    Created on : Mar 4, 2015, 1:16:33 PM
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
                background-color: white;   }
            .tdclass:hover {
                background-color: lightgray;

            }
            .inputclass{
                background-color: whitesmoke;
                border-color: whitesmoke;
                border-style: none;
                color:#006666;
                font-family: cursive;
                //font-size: 12px
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
            
            .aclass{
                text-decoration: none;
                color:#006666;
            }
            
            .aclass:hover {
                text-decoration: underline;


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
            
             .inputclass3{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
                margin-right:5px;
            }
            .inputclass3:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }
            
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <% String user = (String) session.getAttribute("UserLoggedIn");
            String vu = (String) session.getAttribute("vuser1");
            //session.removeAttribute("vuser1");
            String vuser;
            if (vu != null) {
                vuser = vu;
            } else {
                vuser = request.getParameter("viewmsgs");
            }
            personDAO pdao1 = new personDAO();
            pdao1.markMsgsAsRead(user, vuser);
            person pn = pdao1.getPersonP(vuser);
            session.setAttribute("editPhotos", "yes");%>
        <%@include file="head.jsp"%>
        <title><%=pn.getFirstName()%> <%=pn.getLastName()%> : Messages</title>
    </head>
    <body style="background-color:whitesmoke"> 
        <div align="right">
            <a style="text-decoration: none;color:whitesmoke" href="editProfile.jsp">
                <div class="divclass">
                    Edit Profile
                </div>
            </a>
        </div>     
        <div align="center">
            <div style="width:600px;
                 height:63px;
                 color:#006666;
                 font-family:cursive;
                 font-size: 25px;
                 font-weight: bold">
                <br>
                <a href="messages.jsp" class="aclass">Messages</a> > <%=pn.getFirstName()%> <%=pn.getLastName()%>              
            </div>
            <br><br><br>
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
            <div align="center" style="width:600px;height:100%" >      
                <div style="width:600px;
                     height:100%;border:
                     1px solid silver;" 
                     align="right">
                    <form action="sendMessage" method="post">                                           
                        <textarea rows="4" style="width:99%;resize: none;" name="msg" placeholder="Write..." required></textarea> 
                        <input type="hidden" name="sentto1" value="<%=vuser%>">
                        <input type="hidden" name="sentby1" value="<%=user%>">
                        <input class="inputclass3" type="submit" name="reply" Value="Reply">
                    </form>
                    <br>
                </div>
                <%
                    ArrayList list;
                    // personDAO pdao = new personDAO();
                    list = pdao.getMessages(user, vuser);
                    if (list != null && !list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                            person p1 = (person) list.get(i);
                            String msgid = "" + p1.getPostId();
                            person p2 = pdao.getPersonP(p1.getEmailId());
                %>             
                <div align="center"
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
                                    <% if (pdao.checkFriend(st1, p1.getEmailId()) || st1.equals(p1.getEmailId())) {%>

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
                                            <td colspan="2" height="25px" style="background-color: #006666;">
                                                <form method="post" action="viewProfile">
                                                    <input type="hidden" name="viewPro" value="<%=p1.getEmailId()%>">
                                                    <input class="inputclass2" 
                                                           type="submit" value="<%=p2.getFirstName()%> <%=p2.getLastName()%>">
                                                </form>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="250px" style="font-size: 10px;"><%=p1.getTime()%></td>
                                            <td align="right" width="110px">
                                                <!--<a style="color: #006666;font-size: 10px;" href="editPost">Edit</a>-->
                                                <form method="post" action="delMsgs">
                                                    <input type="hidden" name="msgID" value="<%=msgid%>">
                                                    <input type="hidden" name="user" value="<%=vuser%>">
                                                    <input class="inputclass" type="image" name="del" value="submit" src="delete2.gif" onMouseOut="this.src = 'delete2.gif'" onMouseOver="this.src = 'delete3.gif'" alt="x" width="15" height="15" title="Delete"
                                                           onclick="if (confirm('Are you sure you want to delete this message?'))
                                                                       form.action = 'delMsgs';
                                                                   else
                                                                       return false;">
                                                </form>
                                            </td>                                      
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

                } else {
                %>
                <div style="width:600px;
                     height:100%;
                     border: 1px solid silver;
                     font-family: cursive;
                     color:#006666;">No Messages</div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>


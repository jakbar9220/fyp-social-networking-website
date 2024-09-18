<%-- 
    Document   : editPost
    Created on : Jan 27, 2015, 8:32:19 PM
    Author     : ch
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Post</title>
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
</style>
    </head>
    <body style="background-color:whitesmoke">
        <%@include file="head.jsp"%><br>
        <%            String post = (String) session.getAttribute("post");
            //session.removeAttribute("post");
        %>
        <div align="center">
            <div style="width:600px">
                <form method="post" action="edit">
                    <textarea rows="4" style="width:99%;resize: none;" name="nPost"><%=post%></textarea>
                    <input class="inputclass" type="submit" name="subpost" Value="Edit Post">
                </form>
            </div>
        </div>
        <br><br>
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
    </body>
</html>

<%-- 
    Document   : signout
    Created on : Jan 16, 2015, 10:08:20 PM
    Author     : ch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign out</title>
    </head>
    <body>
       <%
            try
            {
                session.removeAttribute("UserLoggedIn");
                session.removeAttribute("Message");
                session.removeAttribute("UserRequest");
                session.removeAttribute("UploadMsg1");
                session.removeAttribute("UploadMsg");
                session.removeAttribute("UploadMsgp");
                session.removeAttribute("UploadMsgp1");
                session.removeAttribute("post");
                session.removeAttribute("editPhotos");
                session.removeAttribute("PostPic");
            }
            catch(Exception ex)
            {
                out.print(ex.toString());
            }
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>

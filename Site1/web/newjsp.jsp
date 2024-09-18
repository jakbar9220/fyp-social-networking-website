<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.net.*"%>
<%@page import="javax.swing.*"%>

<%
// where path could be an url or a filesystem path
//Image image = java.awt.Toolkit.getDefaultToolkit().createImage("http://www.google.com/images/logo.gif"); 

 String pro = "342.jpg";   
    
ImageIcon image = new ImageIcon("D:/Ja/friendlink/Site1/web/images//"+pro);

int width = 0;
int height = 0;

width = image.getIconWidth(); //width
height = image.getIconHeight(); // height

out.println ("<BR>WIDTH: " + width);
out.println ("<BR>HEIGHT: " + height);
%>
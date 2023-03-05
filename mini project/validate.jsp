<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>

 <!DOCTYPE html>

<html> <head>
 <meta charset="UTF-8">

<title> Welcome Page </title>

</head>

<body>
<%
 String el=(String)request.getParameter("email"); 
String p=(String)request.getParameter("psw"); 
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prj","root","root");

PreparedStatement ps=con.prepareStatement(  
    "select * from users where email='"+el+"' and psw='"+p+"' ");  
  
ResultSet rs=ps.executeQuery();

String reuse,status; 
String auth="authorised";
String in="intra";
String cr="cross";

int flag=0; 
if(rs.next())
{
response.sendRedirect("userpg.jsp");
}
flag=1;
break;
}

if(flag==0)
{
out.println("ID or Password is Incorrect! "+"<a href='div.jsp'>Retry</a>");
}
con.close();
}
catch(Exception e) {
out.println(e);
}
finally
{
}
%>
</body>
</html>
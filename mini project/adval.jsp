<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>

 <!DOCTYPE html>

<html> <head>
 <meta charset="UTF-8">

<title>   admin validate</title>

</head>

<body>
<%
 String usr=request.getParameter("usrname"); 
String p=request.getParameter("pwd"); 
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prj","root","root");

PreparedStatement stmt=con.prepareStatement("select * from adm where usrname='"+usr+"' and pwd='"+p+"' ");
ResultSet rs =stmt.executeQuery();

 
int flag=0; 
if(rs.next())
{
response.sendRedirect("adminpg.jsp");
flag=1;

}

 if(flag==0){
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
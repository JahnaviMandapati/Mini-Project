<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<style>
*{
    
}
body{
    background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN7WCXKnjIqOA5wchAqKrdvUWk_xSFC8Gt8zIzfeXYZoRzMsd1dXnvUZfUFzSKDTiB-04&usqp=CAU");
   
    background-repeat: no-repeat;
    background-size: cover;
}
th, td {
  padding: 15px;
}
</style>
</head>
<body><center>
<h1>User Details</h1>
<br>
<table align="center" border="1" >
<tr>
<th>Users</th>
<th>Date of Birth</th>
<th>Platform</th>
<th>Gender</th>
<th>Phone-no</th>
<th>Current Address</th>
<th>Email</th>
<th>Status</th>
</tr>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prj","root","root");
Statement st=con.createStatement();
String sql="select * from users where reuse='intra'";
ResultSet rs=st.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%= rs.getString("usrname") %></td>
<td><%= rs.getString("bday") %></td>
<td><%= rs.getString("platform") %></td>
<td><%= rs.getString("gender") %></td>
<td><%= rs.getString("phoneno") %></td>
<td><%= rs.getString("address") %></td>
<td><%= rs.getString("email") %></td>
</tr>
<%
}
}catch(Exception e)
{
out.println(e);
}
%> 

</tr>
</table></center>
</body>
</html>
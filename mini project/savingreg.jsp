<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>

 <!DOCTYPE html>
<html> <head>
 <meta charset="UTF-8">

<title> reg connection </title>

</head>

<body>
<%
String u=request.getParameter("usrname"); 
String bd=request.getParameter("bday"); 
String pl=request.getParameter("platform"); 
String g=request.getParameter("gender"); 
String ph=request.getParameter("phone"); 
String adr=request.getParameter("address");
String em=request.getParameter("email"); 
String p=request.getParameter("psw"); 
String repw=request.getParameter("psw-repeat");
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prj","root","root");
PreparedStatement stmt=con.prepareStatement("select * from users");
ResultSet rs =stmt.executeQuery();


String reuse="no", plfr,pwd; 
int flag=0; 
while(rs.next())
{
pwd=rs.getString(8);
plfr=rs.getString(3);
if(p.equals(pwd))
{
if(pl.equals(plfr))
{
reuse="intra";
break;
}
else{
reuse="cross";
}
}
else
{
reuse="no";
}
}
 if(flag==0){
String s1="insert into users values(?,?,?,?,?,?,?,?,?,?)";
PreparedStatement st=con.prepareStatement(s1);
st.setString(1,u);
st.setString(2,bd);
st.setString(3,pl);
st.setString(4,g);
st.setString(5,ph);
st.setString(6,adr);
st.setString(7,em);
st.setString(8,p);
st.setString(9,reuse);
st.setString(10,"waiting");
st.executeUpdate();
response.sendRedirect("regsuc.html" );
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
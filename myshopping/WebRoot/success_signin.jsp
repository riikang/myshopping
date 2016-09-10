<%@page import="database.DBHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("GBK");
response.setCharacterEncoding("GBK");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success_signin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String s1=request.getParameter("adminIDs");
    String s2=request.getParameter("adminPswds1");
    String s3=request.getParameter("myname");
    String s4=request.getParameter("email");
    //System.out.println(s1+" "+s2+" "+s3+" "+s4+" ");
    String s5="insert into admin_tb values('"+s1+"','"+s2+"','"+s3+"','"+s4+"')";
    DBHelper.update(s5);   
    %>
    
    <script language="JavaScript" type="text/javascript">
    	alert("×¢²á³É¹¦!");
    </script>
   
   
       
    
  </body>
</html>

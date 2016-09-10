<%@page import="database.DBHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=GBK" import="java.util.*" pageEncoding="GBK"%>

<%
if(session.getAttribute("adminName")==null){//（11）判断是否为合法访问
 	response.sendRedirect("login.jsp?message= Please login !");//（12）若为非法访问，跳转至login.jsp页面
 }
 %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>MyShop购物网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	
	<script language="JavaScript" type="text/javascript">
	function time(){
	    //获得显示时间的div
	    t_div = document.getElementById('showtime');
	   var now=new Date();
	    //替换div内容 
	   t_div.innerHTML ="2015年"+(now.getMonth()+1)+"月"+now.getDate()
	    +"日"+" "+now.getHours()+":"+now.getMinutes()
	    +":"+now.getSeconds();
	    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
	   setTimeout(time,1000);
	  }
	</script>
	
	<link href="style.css" rel="stylesheet" type="text/css"/>
  
  </head>
  
  <body onLoad="time()" style="text-align:center;">
    <div class="header_top">
		<div class="container">        	
			   <span class="title1">MyShop</span>
			   <div  class="title2" ><div id="showtime"></div></div>
			   <span class="title3">
			   <%
			   	if(session.getAttribute("adminName")==null){
			   		out.write("游客");
			   	}
			   	else{
			   %>
			   <%= session.getAttribute("adminName")%> 
			   <%
			   	}
			   %>
			   &nbsp;欢迎您</span>		 
		</div>
	</div>	  
   <div class="wrap-box"></div>
	
	<div class="search">
	<form class="searchbox" method="post" action="success_check.jsp">
        <input type="search" name="searchid" placeholder="search.." />
        
    </form>
	</div>
  	 
  	 <form name="f1" action="success_order.jsp" method="post">
  	 
  	 <div class="sp">
  	 <table border="0" cellspacing="10" align="center">
  	 		<%
  				//Context ctx=new InitialContext();
  				//DataSource ds=(DataSource)ctx.lookup("JNDILAB10");
  				//Connection conn=ds.getConnection();
  				//PreparedStatement psmt=conn.prepareStatement("select * from goods");
  				//ResultSet rs=psmt.executeQuery();
  				String s1="select * from goods";
  				ResultSet rs=DBHelper.query(s1);
  				while(rs.next()){ 				
  			 %>
  			 <tr>
  			 	<td rowspan="2"><img src='<%=request.getContextPath()+"/image/"+rs.getString("path")%>'></td>
  			 	<td class="sp1"><%=rs.getString("goods_name") %></td>			 	
  			 	<td>数量:<input type='text' name=<%=rs.getString("goods_id") %> size=3 style="text-align:right;" maxlength='3'></td>
  			 </tr>
  			 <tr>
  			 	<td class="td1">￥<%=rs.getDouble("price") %></td>			 	
  			 	<td>订购&nbsp;<input type='checkbox' name="checkbox" value="<%=rs.getString("goods_id")%>"></td>  			 
  			 </tr>
  			 <tr>
  			 <td colspan="3">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</td>
  			 </tr>			 
  			 		 
  	 <%
  		
  		session.setAttribute(rs.getString("goods_id"),rs.getString("goods_id") + "," + rs.getString("goods_name") + "," + rs.getDouble("price"));
  	  	} 
  		rs.close();
  		DBHelper.close();
  	 %>
  	 </table>
  	 </div>
  	 
	 
  	 <div class="submit">  	   	 	
  	 	
  	 	<a href="javascript:document:f1.submit();">	 	
  	 	<img src='<%=request.getContextPath()+"/image/"+"qr.png"%>'>	 	
  	 	</a>
  	 	
  	 	<a href="user.jsp">
  	 	<img src='<%=request.getContextPath()+"/image/"+"yh.png"%>'>
  	 	</a>  	 	 	 	
  	 	<a href="#top">
  	 	<img src='<%=request.getContextPath()+"/image/"+"jt.png"%>'>
  	 	</a>  	 	 	 	 	 	
  	 </div>
  	  	
  	 </form>  	 	
  </body>
</html>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="database.DBConfig"%> 
<%@page import="database.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=GBK" import="java.util.*" pageEncoding="GBK"%>

<%
 if(session.getAttribute("adminName")==null){//（11）判断是否为合法访问
 	response.sendRedirect("login.jsp?message=Please login!");//（12）若为非法访问，跳转至login.jsp页面
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
    <title>成功订购</title>
	<meta http-equiv="pragma" content="no-cac he">
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
  
  <form action="index.jsp" method="post">
  	<h1 align=center>您所订购的商品如下</h1>
  	<hr>
  		
  		<div class="t2">
  		<table border="0" cellspacing="10">
  		<tr style="font-weight:bold;">
  		<td>◇</td>
  		<td>&nbsp;&nbsp;商品编号</td>
  		<td>&nbsp;&nbsp;商品名称</td>
  		<td>&nbsp;&nbsp;数量</td>
  		<td>&nbsp;&nbsp;合计</td>
  		</tr>
  		<tr><td>&nbsp;</td></tr>
  		<%     
      	long date = (long)new Date().getTime();
	  	String date1=String.valueOf(date);
     	String checkbox[] = request.getParameterValues("checkbox");
      	int i=0;
      	double suma=0;
      	if(checkbox != null && checkbox.length > 0){
    	  for(String str : checkbox){ 		
    		  i++;
      		String s = (String)session.getAttribute(str);   		 
      		//System.out.println(s);
      		String split[] = s.split(",");
      		String num = (String)request.getParameter(str);
      		double sum = (Double.valueOf(num) * Double.valueOf(split[2]));
      		suma=suma+sum;     
      %>
      <tr>
      <td><%=i%>.</td>
      <td>&nbsp;&nbsp;<%=split[0]%></td>
      <td>&nbsp;&nbsp;<%=split[1]%></td>
      <td align="center">&nbsp;&nbsp;<%=num%></td>
      <td class="td1">&nbsp;&nbsp;<%=sum%>￥</td>
      </tr>  
      <tr><td>&nbsp;</td></tr>   
      <%    		
    		//out.write(i+"."+"&nbsp;"+split[0] + "&nbsp;&nbsp;" + split[1]+ "&nbsp;&nbsp;"+ "数量:"+num + "&nbsp;&nbsp;" +"合计："+  sum+ "￥" + "<br>");  		
    		String s1="insert into orders values('"+date1+"-"+i+"','"+date1+"','"+s+"','"+num+"','"+sum+"','"+session.getAttribute("adminName")+"')";
    		DBHelper.update(s1);
    		//session.setAttribute("split["+i+"]", split[0]+","+split[1]+","+split[2]+","+num);
    	  }
    	  session.setAttribute("ii", i);
    	  //out.write("您一共消费:"+suma+ "￥" +"<br>");
    	  
    	  %>
    	 <tr>
    	 <td colspan="5" class="td1">您一共消费&nbsp;:&nbsp;<%=suma%>￥</td>
    	 </tr>
    	 <tr><td>&nbsp;</td></tr>
    	 <tr style="font-weight:bold;">
    	 <td colspan="5">您的订单号&nbsp;:&nbsp;<%=date1%></td>
    	 </tr>
    	  
    	 </table>
  		</div>   	  
    	     
   
    <%    
    	DBHelper.close();
    	  session.setAttribute("dkey", date1);   	   	
      }          
      %>
      
 
      </form>
  		
  	<div class="submit">  	   	 	
  	 	<a href="index.jsp">	 	
  	 	<img src='<%=request.getContextPath()+"/image/"+"zy.png"%>'>	 	
  	 	</a>	 	 	 	
  	 	<a href="user.jsp">
  	 	<img src='<%=request.getContextPath()+"/image/"+"yh.png"%>'>
  	 	</a>
  	 	
  	 	<a href="#top">
  	 	<img src='<%=request.getContextPath()+"/image/"+"jt.png"%>'>
  	 	</a>   	 	 	 	 	 	
  	 </div>
  		
  </body>
</html>

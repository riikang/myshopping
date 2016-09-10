<%@page import="database.DBHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<%
 if(session.getAttribute("adminName")==null){//（11）判断是否为合法访问
 	response.sendRedirect("login.jsp?message= Please login !");//若为非法访问，跳转至login.jsp页面
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
    <title>查询结果</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
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
    
    <h1 align=center>您所查询的订单详情如下：</h1>   
    <hr>
    
    
    <div class="t1">
    <table border="0" cellspacing="10" align="center">      
    <%
    	int i=0;
    	String s4="";
    	//String s2=(String)session.getAttribute("dkey");
    	String s = (String)request.getParameter("searchid");
    %>
    <tr>
    <td colspan="6" style="font-weight:bold;">订单号&nbsp;:&nbsp;<%=s%></td>
     </tr>
     <tr><td>&nbsp;</td></tr> 
     	<tr style="font-weight:bold;">
     	<td>◆</td>
     	<td>&nbsp;&nbsp;商品编号</td>
     	<td>&nbsp;&nbsp;商品名称</td>
     	<td>&nbsp;&nbsp;单价</td>
     	<td>&nbsp;&nbsp;数量</td>
     	<td>&nbsp;&nbsp;小计</td>
     	</tr>
     	<tr><td>&nbsp;</td></tr>     
    
    <%	
    	int jj=0;
    	double d=0;
    	String ss="select * from orders where order_id='"+s+"'";
    	ResultSet rs=DBHelper.query(ss);
    	ResultSet rs2=DBHelper.query(ss);
    	while(rs2.next()){
    		jj++;
    	}
    	if(jj==0){
    		%>
    	
    	<script language="JavaScript" type="text/javascript">
    	alert("不存在此订单号!");
    	</script>
    	
    	<% 
    	}
    	
    	while(rs.next()){  		
    		d=d+Double.valueOf(rs.getString("osum"));
    		i++;
    		String split[]=rs.getString("order_ information").split(",");
     %>
     <tr>
     <td><%=i%>.</td>
     <td>&nbsp;&nbsp;<%=split[0]%></td>
     <td>&nbsp;&nbsp;<%=split[1]%></td>
     <td>&nbsp;&nbsp;<%=split[2]%></td>
     <td align="center">&nbsp;&nbsp;<%=rs.getString("onum")%></td>
     <td class="td1">&nbsp;&nbsp;<%=rs.getString("osum")%>￥</td>
     </tr>
     <tr><td>&nbsp;</td></tr> 
    		<%
    	}  	     		       		
    rs.close();
    DBHelper.close();
    	
    %>
    <tr><td colspan="6" class="td1">订单总价&nbsp;：&nbsp;<%=d%>￥</td></tr>  
    </table>    
    </div>
	
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

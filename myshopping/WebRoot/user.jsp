<%@page import="database.DBHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>个人中心</title>
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
  
  <%
  int j=0;
  String s2="select * from orders where userid='"+session.getAttribute("adminName")+"' group by order_id"; 
  ResultSet rs2=DBHelper.query(s2);
 	while(rs2.next()){
	 j++;
 	} 
  %>
  
  
  <h1 align="left"><%=session.getAttribute("adminName")%>，的个人中心</h1>
  <h2 align="left">您一共有&nbsp;<%=j %>&nbsp;笔订单,详情如下：</h3>

  <div class="sp2"> 
  	 <table border="0" cellspacing="20" align="center">
  	 <tr>
  	 <td>编号</td>
  	 <td>订单号</td>
  	 </tr>
  	 		<%
  	 			int k=1;
  				//Context ctx=new InitialContext();
  				//DataSource ds=(DataSource)ctx.lookup("JNDILAB10");
  				//Connection conn=ds.getConnection();
  				//PreparedStatement psmt=conn.prepareStatement("select * from goods");
  				//ResultSet rs=psmt.executeQuery();
  				String s1="select * from orders where userid='"+session.getAttribute("adminName")+"' group by order_id";
  				ResultSet rs=DBHelper.query(s1);
  				String s6=null;
  				while(rs.next()){
  					s6=rs.getString("order_id");				
  			 %>
  			 <tr>
  			 <td align="center"><%=k++%></td>
  			 <td><%=rs.getString("order_id") %></td>
  			 </tr>
  			 
  			 		 
  	 <%
  					
  	  	} 
  		rs.close();
  		DBHelper.close();
  	 %>
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

<%@page import="database.DBHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>��������</title>
    <script language="JavaScript" type="text/javascript">
	function time(){
	    //�����ʾʱ���div
	    t_div = document.getElementById('showtime');
	   var now=new Date();
	    //�滻div���� 
	   t_div.innerHTML ="2015��"+(now.getMonth()+1)+"��"+now.getDate()
	    +"��"+" "+now.getHours()+":"+now.getMinutes()
	    +":"+now.getSeconds();
	    //�ȴ�һ���Ӻ����time����������settimeout��time�����ڣ����Կ������޵���
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
			   		out.write("�ο�");
			   	}
			   	else{
			   %>
			   <%= session.getAttribute("adminName")%> 
			   <%
			   	}
			   %>
			   &nbsp;��ӭ��</span>		 
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
  
  
  <h1 align="left"><%=session.getAttribute("adminName")%>���ĸ�������</h1>
  <h2 align="left">��һ����&nbsp;<%=j %>&nbsp;�ʶ���,�������£�</h3>

  <div class="sp2"> 
  	 <table border="0" cellspacing="20" align="center">
  	 <tr>
  	 <td>���</td>
  	 <td>������</td>
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

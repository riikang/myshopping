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
 if(session.getAttribute("adminName")==null){//��11���ж��Ƿ�Ϊ�Ϸ�����
 	response.sendRedirect("login.jsp?message=Please login!");//��12����Ϊ�Ƿ����ʣ���ת��login.jspҳ��
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
    <title>�ɹ�����</title>
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
  
  <form action="index.jsp" method="post">
  	<h1 align=center>������������Ʒ����</h1>
  	<hr>
  		
  		<div class="t2">
  		<table border="0" cellspacing="10">
  		<tr style="font-weight:bold;">
  		<td>��</td>
  		<td>&nbsp;&nbsp;��Ʒ���</td>
  		<td>&nbsp;&nbsp;��Ʒ����</td>
  		<td>&nbsp;&nbsp;����</td>
  		<td>&nbsp;&nbsp;�ϼ�</td>
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
      <td class="td1">&nbsp;&nbsp;<%=sum%>��</td>
      </tr>  
      <tr><td>&nbsp;</td></tr>   
      <%    		
    		//out.write(i+"."+"&nbsp;"+split[0] + "&nbsp;&nbsp;" + split[1]+ "&nbsp;&nbsp;"+ "����:"+num + "&nbsp;&nbsp;" +"�ϼƣ�"+  sum+ "��" + "<br>");  		
    		String s1="insert into orders values('"+date1+"-"+i+"','"+date1+"','"+s+"','"+num+"','"+sum+"','"+session.getAttribute("adminName")+"')";
    		DBHelper.update(s1);
    		//session.setAttribute("split["+i+"]", split[0]+","+split[1]+","+split[2]+","+num);
    	  }
    	  session.setAttribute("ii", i);
    	  //out.write("��һ������:"+suma+ "��" +"<br>");
    	  
    	  %>
    	 <tr>
    	 <td colspan="5" class="td1">��һ������&nbsp;:&nbsp;<%=suma%>��</td>
    	 </tr>
    	 <tr><td>&nbsp;</td></tr>
    	 <tr style="font-weight:bold;">
    	 <td colspan="5">���Ķ�����&nbsp;:&nbsp;<%=date1%></td>
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

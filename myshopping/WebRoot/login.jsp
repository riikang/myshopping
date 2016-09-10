<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>欢迎登陆MyShop</title>
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
  
  <body onLoad="time()">
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
			   &nbsp;欢迎您
			   </span>		 
		</div>
	</div>	  
   <div class="wrap-box"></div>
    
    
    <div class="login">
    <table width="420"  border="0" align="center"  cellpadding="0" cellspacing="0" bgcolor="#F5f7f7" >
	<form name="form" method="post" action="logincheck.jsp">
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr align="center">
    <td height="27" colspan="2" bgcolor="#F5f7f7" class="STYLE1"><strong><font size="+3">欢迎登陆</font></strong></td>
  	</tr>

  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td width="200" height="22" align="right" bgcolor="#F5F7F7">用&nbsp;户&nbsp;名&nbsp;:&nbsp;</td>
    	<td width="300" bgcolor="#F5F7F7"><input  type="text" name="adminID"></td>
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td height="22" align="right" bgcolor="#F5F7F7">密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;</td>
    	<td bgcolor="#F5F7F7"><input type="password" name="adminPswd"></td>
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr align="center">
    	<td height="35" colspan="2" bgcolor="#F5F7F7">
    	<input type="submit" name="Submit" value="登录">
      	&nbsp;&nbsp;
      	<input type="reset" name="Reset" value="重置"></td>
  	</tr>
    
    <tr>
    	
    	<td bgcolor="#F5F7F7" align="center" colspan="2"><font color="red" bold>
        <!-- //(1)验证反馈信息 -->
        
        <%
        String s1="Welcome to MyShop";
        if(request.getParameter("message")==null){
        	//out.write(s1);
        }
        else{
        %>    
        <%=request.getParameter("message")%>
        
        <%
        }
        %> 	
    	</font></td>
  	</tr>
  	<tr><td colspan="2">&nbsp;</td></tr>
 	</form>
 	</table>   
    </div>
     
  </body>
</html>

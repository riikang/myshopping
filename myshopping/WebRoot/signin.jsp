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
    <title>��ӭ��½MyShop</title>
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
	
	function cheForm(){
		var myname=document.myform.myname.value;
		if(myname==""){
			alert("��ʵ��������Ϊ��");
			return false;
		}
		
		var mypassword1=document.myform.adminPswds1.value;
		var mypassword2=document.myform.adminPswds2.value;
		if(mypassword1.length<6){
			alert("����������6λ��");
			return false;
		}
		if(mypassword2!=mypassword1){
			alert("������������벻һ�£�");
			return false;
		}
		
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
			   		out.write("�ο�");
			   	}
			   	else{
			   %>
			   <%= session.getAttribute("adminName")%> 
			   <%
			   	}
			   %>
			   &nbsp;��ӭ��
			   </span>		 
		</div>
	</div>	  
   <div class="wrap-box"></div>
    
    
    <div class="signin">
    <table width="500"  border="0" align="center"  cellpadding="0" cellspacing="0" bgcolor="#F5f7f7" >
	<form name="myform" method="post" onsubmit="return cheForm()" action="success_signin.jsp">
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr align="center">
    <td height="27" colspan="2" bgcolor="#F5f7f7" class="STYLE1"><strong><font size="+3">��ӭע��</font></strong></td>
  	</tr>

  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td width="200" height="22" align="right" bgcolor="#F5F7F7">��&nbsp;��&nbsp;��&nbsp;:&nbsp;</td>
    	<td width="300" bgcolor="#F5F7F7">
    	<input  type="text" name="adminIDs" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\W]/g,''))">
    	*������ĸ������
    	</td> 
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td height="22" align="right" bgcolor="#F5F7F7">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;:&nbsp;</td>
    	<td bgcolor="#F5F7F7"><input type="password" name="adminPswds1">
    	*���ȱ������6λ
    	</td>
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td height="22" align="right" bgcolor="#F5F7F7">ȷ������&nbsp;:&nbsp;</td>
    	<td bgcolor="#F5F7F7"><input type="password" name="adminPswds2">
    	*
    	</td>
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td height="22" align="right" bgcolor="#F5F7F7">��ʵ����&nbsp;:&nbsp;</td>
    	<td bgcolor="#F5F7F7"><input type="text" name="myname">
    	*
    	</td>
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr>
    	<td height="22" align="right" bgcolor="#F5F7F7">�����ַ&nbsp;:&nbsp;</td>
    	<td bgcolor="#F5F7F7"><input type="text" name="email"></td>
  	</tr>
  	
  	<tr><td>&nbsp;</td></tr>
  	
  	<tr align="center">
    	<td height="35" colspan="2" bgcolor="#F5F7F7">
    	<input type="submit" name="Submit" value="ע��" style="width: 200px; height: 30px; ">     	
      	</td>
  	</tr>
    
    <tr><td>&nbsp;</td></tr>
 	</form>
 	</table>   
    </div>
    
    <script language="JavaScript" type="text/javascript">
    	alert("ע��ɹ�!");
    </script>
   
     
  </body>
</html>

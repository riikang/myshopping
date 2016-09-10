
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=GBK" import="database.*"%>
<%
String adminID = request.getParameter("adminID");	
String adminPswd = request.getParameter("adminPswd");	
String sql = "select adminPswd,adminName from admin_tb where adminID=\'"+adminID+"\'";	
 try{
	ResultSet rs = DBHelper.query(sql);	
	if(rs.next()){
		if(adminPswd.equals(rs.getString(1))){ 
			session.setAttribute("adminName",rs.getString(2));
		    response.sendRedirect("index.jsp");		
		}
		else if(!(adminPswd.equals(rs.getString(1)))){
			response.sendRedirect("login.jsp?message=password error!");
		}
		rs.close();
	}
	else{
		response.sendRedirect("login.jsp?message=input ID error!");
	}		
 }catch (SQLException e) {
			e.printStackTrace();
}
 	
	DBHelper.close();
%>

/**
 * 
 */
package filter;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBHelper;

/**   
 *    
 * ��Ŀ���ƣ�LB10   
 * �����ƣ�loginFilter   
 * ��������   
 * �����ˣ�����
 * ����ʱ�䣺2015��5��29�� ����7:46:10   
 * �޸��ˣ�Lim   
 * �޸�ʱ�䣺2015��5��29�� ����7:46:10   
 * �޸ı�ע��  
 * @version 1.0.0   
 *    
 */

public class loginFilter extends HttpServlet implements Filter {
	
	

	public void destroy() {		
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest hrequest =(HttpServletRequest)request;
		HttpServletResponse hresponse=(HttpServletResponse)response;
		
		if(hrequest.getSession().getAttribute("adminName")==null){
			hresponse.sendRedirect("login.jsp?message= Please login !");
		}
		
	}

	
	
		public void init(FilterConfig arg0) throws ServletException {
				
	}
	

}
	


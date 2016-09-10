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
 * 项目名称：LB10   
 * 类名称：loginFilter   
 * 类描述：   
 * 创建人：林生
 * 创建时间：2015年5月29日 下午7:46:10   
 * 修改人：Lim   
 * 修改时间：2015年5月29日 下午7:46:10   
 * 修改备注：  
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
	


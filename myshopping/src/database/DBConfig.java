/**
 * 
 */
package database;

/**   
 *    
 * 项目名称：LB10   
 * 类名称：DBConfig   
 * 类描述：   
 * 创建人：林生
 * 创建时间：2015年5月24日 下午1:01:39   
 * 修改人：Lim   
 * 修改时间：2015年5月24日 下午1:01:39   
 * 修改备注：  
 * @version 1.0.0   
 *    
 */

public interface DBConfig {
	//MySql数据库配置
//	String driver="com.mysql.jdbc.Driver";
//	String url="jdbc:mysql://localhost:3306/db_mysise";
//	String user="root";
//	String password="root";
	//SqlServer2005/2008数据库配置，请参考大课课件完成	
	
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/test";
	String user="root";
	String password="123456";
	
}


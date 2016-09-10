/**
 * 
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**   
 *    
 * ��Ŀ���ƣ�LB10   
 * �����ƣ�DBHelper   
 * ��������   
 * �����ˣ�����
 * ����ʱ�䣺2015��5��24�� ����12:59:59   
 * �޸��ˣ�Lim   
 * �޸�ʱ�䣺2015��5��24�� ����12:59:59   
 * �޸ı�ע��  
 * @version 1.0.0   
 *    
 */

public class DBHelper implements DBConfig {

private static Connection conn;//����Connection���͵�����
private static Statement stat;//����Statement���͵�����
private static ResultSet rs;//����ResultSet���͵�����

public static Connection getConnection() {//���Connection���͵Ķ���
	try {
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		return conn;
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}catch (SQLException e) {
		e.printStackTrace();
	}
	return null;	
}


public static Statement openStatement() {//���Statement���͵Ķ���
	try {
		stat=getConnection().createStatement();
		return stat;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}


public static int update(String sql) {//������ݵĸ��²��������Խ������ݵ�����insert����ɾ(delete)���ģ�update��
	try {
		return openStatement().executeUpdate(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return -1;
}


public  static ResultSet query(String sql) {//������ݵĲ�ѯ���������Խ������ݵĲ�ѯselect
	try {
		return openStatement().executeQuery(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}


public static void close() {//�ͷŸ�����Դ
	if (rs!=null) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	if (stat!=null) {
		try {
			stat.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	if (conn!=null) {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

}


package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	public static Connection getConnection() {
		Connection connection = null;
		
//		연결에 필요한 정보
		String userName = "kdt";
		String password = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
//			드라이버에 메모리를 할당
			Class.forName("oracle.jdbc.driver.OracleDriver");
//			문제가 없으면 getConnection 객체제 정보를 알려준다. (url, userName, password)
			connection = DriverManager.getConnection(url, userName, password);
			System.out.println("Coneection succeed.");
			
		} catch (ClassNotFoundException e) {
			System.err.println("Loading Driver Failed.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("Connection error.");
			e.printStackTrace();
		}
		
		return connection;
	}
}

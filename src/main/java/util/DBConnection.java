package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	

	public static Connection connect() throws SQLException
	{
		//1. Register Driver
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		
		//2. Connection (url, user, password)
		String url = "jdbc:mysql://localhost:3306/main";
		String user = "root";
		String password = "";
		
		Connection conn = DriverManager.getConnection(url, user, password);
		
		return conn;
	}
	
}

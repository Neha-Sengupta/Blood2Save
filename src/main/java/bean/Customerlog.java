
package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Customerlog {
	private String Email,Password;
	
	
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	
	

	public ResultSet loginCustomer() throws SQLException
	{
		
		Connection conn = util.DBConnection.connect();
		

		String sql = "select Name from user where Email=? and Password=?";
		
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, Email);
		ps.setString(2, Password);
		
		ResultSet response = ps.executeQuery();
		
		return response;
	}
	

}


package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Donaterlog  {
	
private String Password,Email;
	
	


	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		this.Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public ResultSet logDonater() throws SQLException
	{
		
		
		Connection conn = util.DBConnection.connect();
		

		String sql = "select id from donater where  Email=? and Password=?";
		
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, Email);
		ps.setString(2, Password);
		
		
		ResultSet response = ps.executeQuery();
		
		return response;
		
	}

}

package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Donaterchoise {
	private String Customer_email,Donater_email,status;
	 private int id;

	

	public String getCustomer_email() {
		return Customer_email;
	}

	public void setCustomer_email(String customer_email) {
		Customer_email = customer_email;
	}

	public String getDonater_email() {
		return Donater_email;
	}

	public void setDonater_email(String donater_email) {
		Donater_email = donater_email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int addRequest() throws SQLException
	{
		
		Connection conn = util.DBConnection.connect();
		
		//3. SQL Query (statement)
		String sql = "insert into bloodreq(Customer_email,Donater_email,status) values(?,?,?)";
		
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		String status = "Pending";
		ps.setString(1, Customer_email);
		ps.setString(2, Donater_email);
		ps.setString(3,status);
		
		int response = ps.executeUpdate();	
		
		//5. close connection
		conn.close();
		
		return response;
				
				
	}
	
//	public int updateRequest() throws SQLException
//	{
//		
//		Connection conn = util.DBConnection.connect();
//		
//		//3. SQL Query (statement)
//		String sql = "update bloodreq set status=? where  id=?";
//		
//		//4. Execute
//		PreparedStatement ps = conn.prepareStatement(sql);
//	
//		ps.setString(1,status);
//		ps.setInt(2,id);
//		
//		int response = ps.executeUpdate();	
//		
//		//5. close connection
//		conn.close();
//		
//		return response;
//				
//				
//	}
}
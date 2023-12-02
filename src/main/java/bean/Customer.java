package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Customer {
	private String Blood_Group,Quantity,Name,Email,Address,Ph_No,Password;
	private int id;
	
	public String getBlood_Group() {
		return Blood_Group;
	}

	public void setBlood_Group(String blood_Group) {
		Blood_Group = blood_Group;
	}

	public String getQuantity() {
		return Quantity;
	}

	public void setQuantity(String quantity) {
		Quantity = quantity;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getPh_No() {
		return Ph_No;
	}

	public void setPh_No(String ph_No) {
		Ph_No = ph_No;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getPassword() {
		return Password;
	}

	public void setPassword(String Password) {
		this.Password = Password;
	}


	
	public int addCustomer() throws SQLException
	{
		Connection conn = util.DBConnection.connect();
		
		//3. SQL Query (statement)
		String sql = "insert into user(Blood_Group,Quantity,Name,Email,Address,Ph_No,Password) values(?,?, ?, ?,?,?,?)";
		
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, Blood_Group);
		ps.setString(2, Quantity);
		ps.setString(3, Name);
		ps.setString(4, Email);
		ps.setString(5, Address);
		ps.setString(6, Ph_No);
		ps.setString(7, Password);
		
		int response = ps.executeUpdate();	
		
		//5. close connection
		conn.close();
		
		return response;
	}
	
	
}

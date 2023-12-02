package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Donater {
	private String Blood_Group,Gender,Name,Email,Address,Ph_No,Password;
	
    private int id;
	public String getBlood_Group() {
		return Blood_Group;
	}
	public void setBlood_Group(String blood_Group) {
		Blood_Group = blood_Group;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
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
	public void setPassword(String password) {
		Password = password;
	}
	
	public int addCustomer() throws SQLException
	{
		
		Connection conn = util.DBConnection.connect();
		
		//3. SQL Query (statement)
		String sql = "insert into donater(Blood_Group,Gender,Name,Email,Address,Ph_No,Password) values(?,?,?, ?, ?,?,?)";
		
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, Blood_Group);
		ps.setString(2, Gender);
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
	
	public int updateDonater() throws SQLException
	{
		
		Connection conn = util.DBConnection.connect();
		System.out.println(0);
		
		//3. SQL Query (statement)
		String sql = "update donater set Blood_Group = ?, Gender = ?, Name = ?, Email=?, Address=?, Ph_No=?, Password=? where id = ?";
		System.out.println(9);
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		System.out.println(8);
		
		ps.setString(1, Blood_Group);
		ps.setString(2, Gender);
		ps.setString(3, Name);
		ps.setString(4, Email);
		ps.setString(5, Address);
		ps.setString(6, Ph_No);
		ps.setString(7, Password);
		ps.setInt(8,id);
		System.out.println(7);
		int response = ps.executeUpdate();	
		System.out.println( 6);
		//5. close connection
		conn.close();
		System.out.println(5);
		
		return response;
				
				
	}
	

		public ArrayList<Donater> getAlldonater() throws SQLException
	 	{
	 		Connection conn = util.DBConnection.connect();
	 		
	 		String sql = "select * from donater where Blood_Group=? and Address=?";
	 		
	 		PreparedStatement ps = conn.prepareStatement(sql);
	 		
	 		ps.setString(1, Blood_Group);
	 		ps.setString(2, Address);
	 		
	 		ResultSet rs = ps.executeQuery();
	 		
	 		ArrayList<Donater> alldonater = new ArrayList<>();
	 		
	 		while(rs.next())
	 		{
	 			Donater d = new Donater();
	 			
	 			d.setBlood_Group(rs.getString("blood_group"));
	 			d.setGender(rs.getString("Gender"));
	 			d.setName(rs.getString("Name"));
	 			d.setAddress(rs.getString("Address"));
	 			
	 			
	 			
	 			
	 			alldonater.add(d);
	 		}
	 		
	 		conn.close();
	 		
	 		
			return alldonater;
	 		
	 	}
		
		
		
		
}

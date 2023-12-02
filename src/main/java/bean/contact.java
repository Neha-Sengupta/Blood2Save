package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class contact {
	private String name,email,contact,subject,message;
	private int id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int addfeedback() throws SQLException
	{
		Connection conn = util.DBConnection.connect();
		
		//3. SQL Query (statement)
		String sql = "insert into feedback(name,email,contact,subject,message) values(?,?,?,?,?)";
		
		//4. Execute
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, contact);
		ps.setString(4, subject);
		ps.setString(5, message);

		
		int response = ps.executeUpdate();	
		
		//5. close connection
		conn.close();
		
		return response;
	}
}

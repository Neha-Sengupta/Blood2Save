package controler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Adminlogin")
public class Adminlogin  extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
	
	try {
	
	Connection conn = util.DBConnection.connect();
	String email = req.getParameter("email");
	String Password = req.getParameter("Password");
	
	String sql = "select * from admin where email=? and Password=?";
	
	//4. Execute
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, email);
	ps.setString(2, Password);
	
	ResultSet response = ps.executeQuery();
	
	if(response.next()) {
		RequestDispatcher rd = req.getRequestDispatcher("AdminWelcome.jsp");
		rd.forward(req, resp);
		
		
	}
	else {
		
		out.println("<font color=red size=18> Login Failed<br>");
		out.println("<a href=admin.jsp>Try again</a>");
	}
	

	
	
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	}
}

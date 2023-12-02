package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Donaterchoise;
import bean.Donater;

@WebServlet("/Donaterregect")
public class Donaterregect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    int row;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
		int id = Integer.parseInt(req.getParameter("id"));
		String status = "Rejected";
		

		conn = util.DBConnection.connect();
		

		 pst = conn.prepareStatement("update bloodreq set status=? where  id=?");
		 pst.setString(1,status);
		 pst.setInt(2,id);
 		
         row = pst.executeUpdate();
         conn.close();
         req.getRequestDispatcher("Donateraccount.jsp").forward(req,resp);
		
         
		
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	}

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

@WebServlet("/Donateraccept")
public class Donateraccept extends HttpServlet {
	
	 	Connection conn;
	    PreparedStatement pst;
	    ResultSet rs;
	    int row;

	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       
	        try {
	            conn = util.DBConnection.connect();
	            int id = Integer.parseInt(req.getParameter("id"));
	            String status = "Accepted";

	            pst = conn.prepareStatement("update bloodreq set status=? where id=?");
	            pst.setString(1, status);
	            pst.setInt(2, id);

	            row = pst.executeUpdate();
	            conn.close();
	            // Decide where to forward the response
	            String targetPage = "/Donateraccount.jsp"; // Success page
	            // If an exception occurs, set targetPage to the error page
	            // Example: String targetPage = "error.jsp";

	            // Perform either a forward or a redirect
	            RequestDispatcher dd = req.getRequestDispatcher(targetPage);
	            dd.forward(req, resp);
	        } catch (SQLException e) {
	            // Handle the exception (e.g., log it or display an error message)
	            e.printStackTrace();
	            // Forward to an error page (if needed)
	            // Example: RequestDispatcher dd = req.getRequestDispatcher("error.jsp");
	            //          dd.forward(req, resp);
	        } 
	    }
	}

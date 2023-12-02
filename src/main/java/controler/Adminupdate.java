package controler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Donater;

@WebServlet("/Adminupdate")
public class Adminupdate extends HttpServlet  {
    
    
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doPost(HttpServletRequest req,HttpServletResponse rsp ) throws IOException,ServletException
    {
        
        rsp.setContentType("text/html");
        PrintWriter out = rsp.getWriter();

        try {
        	    conn = util.DBConnection.connect();
             	int id = Integer.parseInt(req.getParameter("id"));
	    		String name = req.getParameter("name");
	    		String email = req.getParameter("email");
	    		String ph_no = req.getParameter("ph_no");
	    		String Password = req.getParameter("Password");
	    	
             
             pst = conn.prepareStatement("update admin set name = ?, email = ?, ph_no = ?, Password=? where id = ?");
            
     		 pst.setString(1, name);
     		 pst.setString(2, email);
     		 pst.setString(3, ph_no);
     		 pst.setString(4, Password);
     		 pst.setInt(5,id);
     		
             row = pst.executeUpdate();
             
             RequestDispatcher rd = req.getRequestDispatcher("AdminWelcome.jsp");
             rd.forward(req, rsp);
   
        } catch (SQLException ex) {
           
             out.println("<font color='red'>  Record Failed   </font>");
 
        }

    }
  
}
    
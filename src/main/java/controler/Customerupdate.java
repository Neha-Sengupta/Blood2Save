
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

        	@WebServlet("/Customerupdate")
        	public class Customerupdate extends HttpServlet  {
        	    
        	    
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
        		            String Blood_Group = req.getParameter("Blood_Group");
        		    		String Quantity = req.getParameter("Quantity");
        		    		String Name = req.getParameter("Name");
        		    		String Email = req.getParameter("Email");
        		    		String Address = req.getParameter("Address");
        		    		String Ph_No = req.getParameter("Ph_No");
        		    		String Password = req.getParameter("Password");
        		    	
        	             
        	             pst = conn.prepareStatement("update user set Blood_Group = ?, Quantity = ?, Name = ?, Email=?, Address=?, Ph_No=?, Password=? where id = ?");
        	             pst.setString(1, Blood_Group);
        	     		 pst.setString(2, Quantity);
        	     		 pst.setString(3, Name);
        	     		 pst.setString(4, Email);
        	     		 pst.setString(5, Address);
        	     		 pst.setString(6, Ph_No);
        	     		 pst.setString(7, Password);
        	     		 pst.setInt(8,id);
        	     		
        	             row = pst.executeUpdate();
        	             
        	             RequestDispatcher rd = req.getRequestDispatcher("Customeraccount.jsp");
        	             rd.forward(req, rsp);
        	   
        	        } catch (SQLException ex) {
        	           
        	             out.println("<font color='red'>  Record Failed   </font>");
        	 
        	        }

        	    }
        	  
        	}
        	    
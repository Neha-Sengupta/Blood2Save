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

import util.DBConnection;

@WebServlet("/Customerdelete")
public class Customerdelete extends HttpServlet {
    
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    int row;
    
    
    
   public void doGet(HttpServletRequest req,HttpServletResponse rsp ) throws IOException,ServletException
    {
        
        rsp.setContentType("text/html");
        PrintWriter out = rsp.getWriter();
        
        String id = req.getParameter("id");
        
        
        try {
        	 Connection conn = DBConnection.connect();
        	 
             pst = conn.prepareStatement("delete from user where id = ?");
             pst.setString(1, id);
             row = pst.executeUpdate();
             RequestDispatcher rd = req.getRequestDispatcher("Customer.jsp");
			rd.forward(req, rsp);            
        } catch (SQLException ex) {
           
             out.println("<font color='red'>  Record Failed   </font>");

        }
    
    
    }
    
}

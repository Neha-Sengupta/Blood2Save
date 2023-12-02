package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Donater;
import bean.Donaterlog;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/log")
public class Donaterlogin  extends HttpServlet {
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			PrintWriter out = resp.getWriter();
			

			
			String Email = req.getParameter("Email");
			String Password = req.getParameter("Password");
			
			Donaterlog lg = new Donaterlog();
			lg.setEmail(Email);
			lg.setPassword(Password);
			
			
	
			try {
				
				ResultSet  response = lg.logDonater();
				
				
				if(response.next()) {
					
					HttpSession session = req.getSession();
					session.setAttribute("demail", Email);
					
					RequestDispatcher rd = req.getRequestDispatcher("Donateraccount.jsp");
					
					out.println("<font color=green size=18> Login Sucessfully<br>");
					rd.forward(req, resp);
					
					
				}
				else {
					
					out.println("<font color=red size=18> Login Failed<br>");
					out.println("<a href=Donater.jsp>Try again</a>");
				}
				
		
				
				
				
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				resp.setContentType("text/html");
				out.print("<h3 style='color:red'> Exception Occured : "+e.getMessage()+"/h3>");
				RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			}
		}
}

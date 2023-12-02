package controler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  bean.feedback;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet(urlPatterns = "/contact")
public class contact extends HttpServlet {
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			
			
			String Name = req.getParameter("name");
			String Email = req.getParameter("email");
			String Contact = req.getParameter("contact");
			String Subject = req.getParameter("subject");
			String Message = req.getParameter("message");
			
			feedback s = new feedback();
			System.out.println(Name);
			s.setName(Name);
			s.setEmail(Email);
			s.setContact(Contact);
			s.setSubject(Subject);
			s.setMessage(Message);

			
			try {
				int response = s.addfeedback();
				
				
					
					RequestDispatcher rd = req.getRequestDispatcher("index.jsp");

					rd.forward(req, resp);
				
				
				
				
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				
			}
		}

}



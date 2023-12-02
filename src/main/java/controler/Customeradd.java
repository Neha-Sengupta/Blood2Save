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

import  bean.Customer;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet(urlPatterns = "/add")
public class Customeradd extends HttpServlet {
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.setContentType("text/html");
	
			String Blood_Group = req.getParameter("Blood_Group");
			String Quantity = req.getParameter("Quantity");
			String Name = req.getParameter("Name");
			String Email = req.getParameter("Email");
			String Address = req.getParameter("Address");
			String Ph_No = req.getParameter("Ph_No");
			String Password = req.getParameter("Password");
			
			Customer s = new Customer();
			
			s.setBlood_Group(Blood_Group);
			s.setQuantity(Quantity);
			s.setName(Name);
			s.setEmail(Email);
			s.setAddress(Address);
			s.setPh_No(Ph_No);
			s.setPassword(Password);

			
			try {
				int response = s.addCustomer();
				
				
				if(response == 1)
				{
					
					RequestDispatcher rd = req.getRequestDispatcher("Customer.jsp");
					req.setAttribute("message", "Registraion Sucessfully");
					rd.forward(req, resp);
				}
				else
				{
					req.setAttribute("message", "Registraion failed");
				}
				
				
				
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

}



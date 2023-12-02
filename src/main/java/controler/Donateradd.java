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

import bean.Donater;

@WebServlet(urlPatterns = "/insert")
	public class Donateradd  extends HttpServlet {
		
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				resp.setContentType("text/html");
				PrintWriter out = resp.getWriter();
				
				
				String Blood_Group = req.getParameter("Blood_Group");
				String Gender = req.getParameter("Gender");
				String Name = req.getParameter("Name");
				String Email = req.getParameter("Email");
				String Address = req.getParameter("Address");
				String Ph_No = req.getParameter("Ph_No");
				String Password = req.getParameter("Password");
				
				Donater s = new Donater();
				
				s.setBlood_Group(Blood_Group);
				s.setGender(Gender);
				s.setName(Name);
				s.setEmail(Email);
				s.setAddress(Address);
				s.setPh_No(Ph_No);
				s.setPassword(Password);

				
				try {
					int response = s.addCustomer();
					
					RequestDispatcher rd = req.getRequestDispatcher("Donater.jsp");
					
					if(response == 1)
					{
						req.setAttribute("message", "Addeddd Successfully");
					}
					else
					{
						req.setAttribute("message", "Failedddd :(");
						out.println("<font color=red size=18>Something Wrong<br>");
						out.println("<a href=Donater.jsp>Try again</a>");
					}
					
					rd.forward(req, resp);
					
				} 
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}


}

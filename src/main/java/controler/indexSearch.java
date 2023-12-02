package controler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

/**
 * Servlet implementation class SearchDonater
 */

@WebServlet(urlPatterns = "/indexSearch")
public class indexSearch extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String Blood_Group = request.getParameter("Blood_Group");
		String Address = request.getParameter("Address");
		try {
			
			Connection conn = util.DBConnection.connect();
			
			PreparedStatement ps = conn.prepareStatement("select * from donater where Blood_Group=? and Address=?");
			
			ps.setString(1, Blood_Group);
			ps.setString(2, Address);
			
			
			
			out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link href='Search.css' type='text/css' rel='stylesheet' />");
            out.println("<title>Specific Customer details</title>");          
            out.println("</head>");
            out.println("<body style=\" background-image: linear-gradient(rgba(204, 61, 68, 0.75),rgba(77, 70, 70, 0.75)),url(assets/img/blood-donation-image.jpg);\">");
				out.println("<main class=\"table\">");
            	
				out.print("<table width=75% border=1>");
				out.print("<section class=\"table__body\">");
				
				out.print("<caption style=\" font-size:30px\"> Search Resultl: </caption>");
				
				ResultSet rs = ps.executeQuery();
				
					out.println("<thead>");
		            out.println("<tr>");
		            out.println("<th> BLOOD GROUP </t>");
		            out.println("<th> GENDER </th>");
		            out.println("<th> NAME</th>");
		            out.println("<th> ADDRESS  </th>");
		            out.println("<th> REQUEST<span </th>");
		      
		            out.println("</tr>");
		            out.println("<thead>");
		            while(rs.next())
		            {
		            	
		             out.println("<tbody>");
		             out.println("<tr>");
		             out.println("<td>"  + rs.getString("Blood_Group")   +  "</td>");  
		             out.println("<td>"  + rs.getString("Gender")   +  "</td>");
		             out.println("<td>"  + rs.getString("Name")   +  "</td>");     
		             out.println("<td>"  + rs.getString("Address")   +  "</td>"); 
		             out.println("<td>"  + "<a href='Customer.jsp'> Login </a>" + "</td>");
	             
		           
		             out.println("</tr>");
		             out.println("</tbody>");
		            }
		            
		             out.println("</table>");
		             out.print("</Section>");
		             out.print("</main>");
		             out.println("</body>");
	                 out.println("</html>");
		            
		           
		           
		            
			
		}catch (Exception e) {
			// TODO: handle exception
			out.print(e);
		}
	}

}

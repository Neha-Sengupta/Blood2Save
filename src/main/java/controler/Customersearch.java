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

@WebServlet("/Customersearch")
public class Customersearch extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		HttpSession httpSession = request.getSession();
		String uemail =  (String) httpSession.getAttribute("uemail");
		
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
            	
				out.print("<table width=75% border=1 style=\" font-size:20px;\">");
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
		            
		             PreparedStatement ps1 = conn.prepareStatement("select * from bloodreq where Customer_email=? and Donater_email=?");
		             
		             ps1.setString(1, uemail);
		 			 ps1.setString(2, rs.getString("Email"));
		             ResultSet rs1 = ps1.executeQuery();
		           
		             if(rs1.next()){
		            	 System.out.println("record found");
		            	 if(rs1.getString("status").equals("Pending")) 
		            	 out.println("<td style=\"color:yellow;\">Pending</td>");
		            	 
		            	 else if(rs1.getString("status").equals("Accepted")) 
			            	 
		            	 	 out.println("<td style=\"color:green;\">Accepted</td>");
		            	 	
		            	 else if(rs1.getString("status").equals("Rejected")) 
			            	 out.println("<td style=\"color:red;\">Rejected</td>");
		             }
		             else {
		            	
		            	 out.println("<td>"  + "<button  class=\"Request\" style=\" background-color:#ace5ee;  width:150px; height:35px;border-radius:8px;border-color:#fff; font-size:22px;\"><a style=\"color:black;\"href='SendMail?id="+rs.getString("Email")+ "'> Request </a></button>" + "</td>");
		            	     
	             
		             }
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

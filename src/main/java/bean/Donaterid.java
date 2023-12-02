package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchDonater
 */

@WebServlet("/Donaterid")
public class Donaterid extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			
			Connection conn = util.DBConnection.connect();
			
			PreparedStatement ps = conn.prepareStatement("select * from donater where id=?");
			
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			

		            
		            while(rs.next())
		            {
			            	out.println("<!DOCTYPE html>");
			                out.println("<html>");
			                out.println("<head>");
			                out.println("<link href='searchid.css' type='text/css' rel='stylesheet' />");
			                out.println("<title>Specific Donater details</title>");          
			                out.println("</head>");
			                out.println("<body style=\" background-image: linear-gradient(rgba(204, 61, 68, 0.75),rgba(77, 70, 70, 0.75)),url(assets/img/blood-donation-image.jpg);\" >");
					
			                
			                out.println("<header><h3>Donater List</h3> </header>"); 
			                out.println("<section>");  
			                out.println("<nav>");  
			                out.println("<ul>");  
			                out.println("<li>");  
			                out.println("<button type=\"button\" value=\"Get All Record\"  class=\"open-button\" onclick=\"openForm()\" style=\"width:70px; height:40px; margin:5px;  border:none;  border-radius:2px;font-size:17px; font-weight:bold;\">View</button>");  
			                out.println("<button type=\"button\" value=\"Get All Record\"  class=\"open-button\" onclick=\"closeForm()\" style=\"width:70px; height:40px; margin:5px;  border:none;  border-radius:2px;font-size:17px; font-weight:bold;\">Close</button>");  
			                out.println("</li>");  
			                out.println(" </ul>");  
			                out.println("</nav>");  
			                out.println("<article>");  
			                out.println("  <h1 style=\"color:white; font-size: 20px;\"> Donater Records</h1>");  
			                out.println("<div class=\"form-popup\" id=\"myForm\" style=\"height:250px;width:1180px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;\">");  
			                
					            
							 out.println("<center><table  style=\"background-color:#fddde6;border:black;color:black; font-family: Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold;\" border=5 cellpadding=5 cellspacing=1 width=75%>");
							
				             out.println("<tr> <td style=\"font-weight: bold;\">ID</td> <td>"  + rs.getString("id")   +  "</td></tr>");
				             out.println("<tr> <td style=\"font-weight: bold;\">BLOOD_GROUP</td> <td>"  + rs.getString("Blood_Group")   +  "</td> </tr>");  
				             out.println("<tr> <td style=\"font-weight: bold;\">GENDER</td> <td>"  + rs.getString("Gender")   +  "</td></tr>");
				             out.println("<tr> <td style=\"font-weight: bold;\">NAME</td> <td>"  + rs.getString("Name")   +  "</td></tr>"); 
				             out.println("<tr> <td style=\"font-weight: bold;\">EMAIL</td> <td>"  + rs.getString("Email")   +  "</td></tr>"); 
				             out.println("<tr> <td style=\"font-weight: bold;\">ADDRESS</td> <td>"  + rs.getString("Address")   +  "</td></tr>"); 
				             out.println("<tr> <td style=\"font-weight: bold;\">PHONE_NO.</td> <td>"  + rs.getString("Ph_No")   +  "</td></tr>"); 
				             out.println("<tr> <td style=\"font-weight: bold;\">PASSWORD</td> <td>"  + rs.getString("Password")   +  "</td></tr>");  
				            
				            
				             out.println("</table>");
				             out.println("<tr>"  + "<a style=\"color:black ;\" href='edit?id=" +  rs.getString("id")  + "'><button style=\"margin: 5px; color:Black; background-color:#03c03c   ; width:100px; height:30px; border-color:#fff;border-radius:20px;\" >Edit</button>  </a>"+"<a  style=\"color:black;\"  href='Donaterdelete?id=" +  rs.getString("id")  + "'><button onclick=\"return confirm('Are you sure you want to reject this request?');\"style=\"margin: 5px; color:Black; background-color:#ff0800 ; width:100px;height:30px; border-color:#fff;border-radius:20px;\">Delete</button>  </a>" + "</tr>");
				             out.println("</div>");  
			                 out.println(" </article>");  
			                 out.println(" <script>\r\n"
			                 		+ "                    function openForm() \r\n"
			                		+ "                    {\r\n"
			                		+ "                        document.getElementById(\"myForm\").style.display = \"block\";\r\n"
			                		+ "                    }\r\n"
			                		+ "\r\n"
			                		+ "                    function closeForm() \r\n"
			                		+ "                    {\r\n"
			                		+ "                        document.getElementById(\"myForm\").style.display = \"none\";\r\n"
			                		+ "                    }\r\n"
			                		+ "\r\n"
			                		+ "                </script>  ");  
			                out.println("</section>");  
				            out.println("</center>");
				       
				            out.println("</body>");
		                    out.println("</html>");
		               
		               
		               
					
		            }
		            
		           
			
		}catch (Exception e) {
			// TODO: handle exception
			out.print(e);
		}
	}

}

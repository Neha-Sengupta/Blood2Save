package controler;
import java.io.IOException;
	import java.io.PrintWriter;
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	@WebServlet(urlPatterns="/edit")
	public class Admiindonaredit  extends HttpServlet {    
	    
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
	        	Connection conn = util.DBConnection.connect();
	           
	           pst = conn.prepareStatement("select * from donater where id = ?");
	           pst.setString(1, id);
	           
	           rs = pst.executeQuery();
	           
	           if(rs.next())
	           {
	        	   out.println("<!DOCTYPE html>");
	               out.println("<html>");
	               out.println("<head>");
	               out.println("<link href='update.css' type='text/css' rel='stylesheet' />");
	               out.println("<title>Update Form</title>");          
	               out.println("</head>");
	               out.println("<body style=\"  background-image: linear-gradient(rgba(204, 61, 68, 0.75),rgba(77, 70, 70, 0.75)),url(assets/img/blood-donation-image.jpg);\">");
	              
	               out.print("<form action='Donaterupdate' method='POST'");
	               out.println(" <caption>Update Form</caption><br>");
	                out.print("<table");
	               
	              
	                out.print("<tr> <td>id</td>    		<td> <input style=\"Dispaly:block;\"type='text' name ='id' id='id' value= '" +  rs.getString("id") + "'/> </td> </tr><br>"); 
	                out.print("<tr> <td>Blood_Group</td>    <td><select name=\"Blood_Group\">\r\n"
	                		+ "                 id='Blood_Group' value= '"
	                		+ "                    <option>A+</option>\r\n"
	                		+ "                    <option>A-</option>\r\n"
	                		+ "                    <option>B+</option>\r\n"
	                		+ "                    <option>B-</option>\r\n"
	                		+ "                    <option>AB+</option>\r\n"
	                		+ "                    <option>AB-</option>\r\n"
	                		+ "                    <option>O+</option>\r\n"
	                		+ "                    <option>O-</option>\r\n"
	                	    + rs.getString("Blood_Group") + "'/> </select> </td> </tr>");
	                out.print("<tr> <td>Gender</td>    		<td> <input type='text' name ='Gender' id='Gender' value= '" + rs.getString("Gender") + "'/> </td> </tr>");
	                out.print("<tr> <td>Name</td>    		<td> <input type='text' name ='Name' id='Name' value= '" + rs.getString("Name") + "'/> </td> </tr>");
	                out.print("<tr> <td>Email</td>    		<td> <input type='text' name ='Email' id='Email' value= '" + rs.getString("Email") + "'/> </td> </tr>");
	                out.print("<tr> <td>Address</td>    	<td> <input type='text' name ='Address' id='Address' value= '" + rs.getString("Address") + "'/> </td> </tr>");
	                out.print("<tr> <td>Ph_No</td>    		<td> <input type='text' name ='Ph_No' id='Ph_No' value= '" + rs.getString("Ph_No") + "'/> </td> </tr>");
	                out.print("<tr> <td>Password</td>    	<td> <input type='text' name ='Password' id='Password' value= '" + rs.getString("Password") + "'/> </td> </tr>");
	                out.print("<tr>  <td colspan ='2'> <input style=\"background-color:green; margin-top:5px\" type='submit'  value= 'Edit'/> </td> </tr>");
	               out.print("</table");
	               out.print("</form");
	               out.println("</body>");
	               out.println("</html>");
	               
	           }
	            
	        }  catch (SQLException ex) {
	           
	             out.println("<font color='red'>  Record Failed   </font>");
	 
	        }
	    }

	}



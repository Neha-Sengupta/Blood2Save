package controler;
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
 * Servlet implementation class Donaterdata
 */
@WebServlet("/Donaterinfo")
public class Donaterinfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String Email = request.getParameter("id");
		System.out.println(Email);
		try {
		
		Connection conn = util.DBConnection.connect();
		
		PreparedStatement ps = conn.prepareStatement("select * from donater where Email=?");
		
		ps.setString(1,Email);
		ResultSet rs = ps.executeQuery();
		
		
  
        out.println("</tr>");
        
        while(rs.next())
        {
        	out.print("<table width=75% border=1>");
    		out.print("<caption> Donater Details: </caption>");
            out.println("<tr>");
            out.println("<td> BLOOD GROUP </td>");
            out.println("<td> GENDER </td>");
            out.println("<td> NAME </td>");
            out.println("<td> EMAIL </td>");
            out.println("<td> ADDRESS </td>");
            out.println("<td> PHONE NUMBER </td>");	
        	
         out.println("<tr>");
         out.println("<td>"  + rs.getString("Blood_Group")   +  "</td>");  
         out.println("<td>"  + rs.getString("Gender")   +  "</td>");
         out.println("<td>"  + rs.getString("Name")   +  "</td>");   
         out.println("<td>"  + rs.getString("Email")   +  "</td>");
         out.println("<td>"  + rs.getString("Address")   +  "</td>");
         out.println("<td>"  + rs.getString("Ph_No")   +  "</td>");
        
         out.println("</tr>");
         out.println("</table>");
		}
	}catch (Exception e) {
		// TODO: handle exception
		out.print(e);
	}

	
	}
}

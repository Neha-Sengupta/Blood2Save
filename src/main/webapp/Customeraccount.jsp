<%@page import = "java.util.ArrayList" %>
<%@page import="bean.Donater" %>

<%@page import="java.sql.*"%>
<!--Website: wwww.codingdung.com-->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Account</title>
    <link rel="stylesheet" href="Account.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style=" background-image: linear-gradient(rgba(204, 61, 68, 0.75),rgba(77, 70, 70, 0.75)),url(assets/img/blood-donation-image.jpg);">
    <div class="container light-style flex-grow-1 container-p-y">
        <h4 class="font-weight-bold py-3 mb-4">
            Account settings
        </h4>
        <!-- ======= sidebar ======= -->
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        
                       
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">Info</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#EmergencySearch">Emergecy Search</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-notifications">Search</a>
                         <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-connections">Blood Request</a>
                        
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-info">Update</a>
                  
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-social-links">Delete</a>
                      
                                 
                       
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">
                            <div class="card-body media align-items-center">
                               <div class="logo">
							        <h1 class="text-light"><a href="index.html"><img src="assets/img/favicon.png" alt="icon"><span style="color:#8a795d    ;">Blood2Save</span></a></h1>
							       
							        <!-- Uncomment below if you prefer to use an image logo -->
							        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
							      </div>
                            </div>
                            
  <!-- ======= info ======= -->                          
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <div class="form-group">
                                
                                <%
		try{
			
			
			String Email=request.getParameter("Email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from user where Email='"+Email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

                    if(count>0){
            out.println("welcome "+Email);
            
           
            Statement s=conn.createStatement();
           ResultSet rst=s.executeQuery("select * from user where Email='"+Email+"' and Password='"+Password+"'");
          while(rst.next()){
              //System.out.println(rst.getString("Email"));
              
              
            %>
            <h3>Your Account Information</h3>
            <table>
           
            <tr><td >Id:</td><td style="color: #900C3F ;"><%=rst.getString("id")%></td></tr>
            <tr><td>Blood_Group:</td><td style="color: #900C3F ;"><%=rst.getString("Blood_Group")%></td></tr>
            <tr><td>Quantity:</td><td style="color: #900C3F ;"><%=rst.getString("Quantity")%></td></tr>
            <tr><td>Name:</td><td style="color: #900C3F ;"><%=rst.getString("Name")%></td></tr>
            <tr><td>Email:</td><td style="color: #900C3F ;"><%=rst.getString("Email")%></td></tr>
            <tr><td>Address:</td><td style="color: #900C3F ;"><%=rst.getString("Address")%></td></tr>
            <tr><td>Phone No:</td><td style="color: #900C3F ;"><%=rst.getString("Ph_No")%></td></tr>
            <tr><td>Password:</td><td style="color: #900C3F ;"><%=rst.getString("Password")%></td></tr>
           
           
          
           </table>
           
          
            <%
           
          }
          }
          else
          {
                       response.sendRedirect("Customer.jsp");
          }
}

catch(Exception e){
    System.out.println(e);
}
%>                           
								</div>  
                            </div>
                           </div>
<!-- ======= info end ======= -->



<!-- ======= Update ======= -->
                        
                        <div class="tab-pane fade" id="account-info">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                                                   
<%
try{
			
			
			String Email=request.getParameter("Email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from user where Email='"+Email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

                    if(count>0){
    
            
				           
				            Statement s=conn.createStatement();
				           ResultSet rst=s.executeQuery("select * from user where Email='"+Email+"' and Password='"+Password+"'");
				          while(rst.next()){
				              //System.out.println(rst.getString("Email"));
				              
				              
				            %>
				            <h3>Update Account Information</h3>
				            
				             <form action="Customerupdate" method="Post">
				              <table>
				             
				                <tr> <td>id</td><td> <input type='text' name ='id' id='id' value= "<%=rst.getString("id")%>"> </td> </tr><br>
				                <tr><td>Blood_Group:</td><td><input oninput="this.value = this.value.toUpperCase()" class="input-field" name="Blood_Group" value="<%=rst.getString("Blood_Group")%>"></td></tr>
				                <tr><td>Quantity:</td><td> <input type="number" class="input-field" placeholder="Enter quantity"  name="Quantity" value="<%=rst.getString("Quantity")%>"></td></tr>
				                <tr><td>Name:</td><td> <input type="text"  placeholder="Enter Name" name="Name" value="<%=rst.getString("Name")%>"></td></tr>
				                <tr><td>Email:</td><td><input type="email" placeholder="Email Id" name="Email" value="<%=rst.getString("Email")%>"></td></tr>
				                <tr><td>Address:</td><td><input type="text"placeholder="Enter Address" name="Address" value="<%=rst.getString("Address")%>"></td></tr>
				                <tr><td>Phone No:</td><td><input type="number" placeholder="Enter Phone Number"  name="Ph_No" value="<%=rst.getString("Ph_No")%>"></td></tr>
				                <tr><td>Password:</td><td><input type="text" placeholder="Enter Password"  name="Password" value="<%=rst.getString("Password")%>"></td></tr>
								<tr><td colspan ='2'> <button style=" border-radius:8px;border-color:#fff;margin-top:10px;background-color:#03c03c ; width:150px; height:40px;" type='submit' onclick="return confirm('Are you sure you want to update information?');">Save Changes</button> </td> </tr>
				         		
								</table>
				                </form>
				   
				            	<%
           
          }
          }
          else
          {
                       response.sendRedirect("Customer.jsp");
          }
}

catch(Exception e){
    System.out.println(e);
}
%>
                                </div>
                            </div>
                        </div>
                        
   <!-- ======= Update end ======= -->
   					<!-- ======= Delete ======= -->
                        <div class="tab-pane fade" id="account-social-links">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                                                    
                                <%
		try{
			
			
			String Email=request.getParameter("Email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from user where Email='"+Email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

           		if(count>0){
           
		            Statement s=conn.createStatement();
		           	ResultSet rst=s.executeQuery("select * from user where Email='"+Email+"' and Password='"+Password+"'");
		         	 while(rst.next()){
		              //System.out.println(rst.getString("Email"));
		              
		              
		            %>
		            <h3>Delete Account </h3>
		            <table>
		           
		            <tr><td >Id:</td><td style="color: #900C3F ;"><%=rst.getString("id")%></td></tr>
		            <tr><td>Blood_Group:</td><td style="color: #900C3F ;"><%=rst.getString("Blood_Group")%></td></tr>
		            <tr><td>Quantity:</td><td style="color: #900C3F ;"><%=rst.getString("Quantity")%></td></tr>
		            <tr><td>Name:</td><td style="color: #900C3F ;"><%=rst.getString("Name")%></td></tr>
		            <tr><td>Email:</td><td style="color: #900C3F ;"><%=rst.getString("Email")%></td></tr>
		            <tr><td>Address:</td><td style="color: #900C3F ;"><%=rst.getString("Address")%></td></tr>
		            <tr><td>Phone No:</td><td style="color: #900C3F ;"><%=rst.getString("Ph_No")%></td></tr>
		            <tr><td>Password:</td><td style="color: #900C3F ;"><%=rst.getString("Password")%></td></tr>
		           
		           
		          
		           </table>
		           
		           <a  href="Customerdelete?id=<%=  rst.getString("id")%>" onclick="return confirm('Are you sure you want to delete this item?');"><button style="margin-top:10px; color:Black; background-color:red; width:100px; border-radius:8px;border-color:#fff;" class="SideB1">Delete</button></a>
		          
		            <%
		           
		          }
          }
          else
          {
                       response.sendRedirect("Donater.jsp");
          }
}

catch(Exception e){
    System.out.println(e);
}
%>
                                </div>
                            </div>
                        </div>
   <!-- ======= Delete end ======= -->
   					<!-- ======= Request ======= -->
                        <div class="tab-pane fade" id="account-connections">
                            <div class="card-body">
                            
                            <article style="background-color:#fff;margin-right: 50px;">
                            <h1 style="color:Black; font-size: 20px; text-align:center;"> Donater Records</h1>
                            <div class="form-popup" id="myForm" style="height:300px;width:2000px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
                            <table style="border-radius:10px; width:500px;text-align:center;background-color:#ffe4e1 ;border:#fff;color:Black; font-family: Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#e8ccd7;">
                           
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">Your_email</th>
                            <th style="padding-left: 5px;padding-right: 5px; padding-top: 6px;padding-bottom: 6px;;">Status</th>
                            <th style="padding-left: 5px;padding-right: 5px; padding-top: 6px;padding-bottom: 6px;;">Donater_email</th>
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">Donater_Contact</th>
                            <th style="padding-left: 5px;padding-right:5px;padding-top: 6px;padding-bottom: 6px;">Blood_Group</th> 
                           
                           
                            </tr>
                            <%
                            try
                            {
                            	HttpSession session2 = request.getSession();
                            	String uemail = (String) session2.getAttribute("uemail");
                            	
                            	Connection conn = util.DBConnection.connect();
                                String query="select * from bloodreq where Customer_email='"+uemail+"'";

                                Statement stmt=conn.createStatement();

                                ResultSet rs=stmt.executeQuery(query);

                                while(rs.next())
                                {	
                                	 out.println("<tr>");
                                	 out.println("<td style=\"padding-left: 5px;padding-right:5px;padding-top: 6px;padding-bottom: 6px;\">"  + rs.getString("Customer_email")   +  "</td>");  
                		             out.println("<td style=\"padding-left: 5px;padding-right:5px;padding-top: 6px;padding-bottom: 6px;\">"  + rs.getString("status")   +  "</td>");
                		             out.println("<td style=\"padding-left: 5px;padding-right:5px;padding-top: 6px;padding-bottom: 6px;\">"  + rs.getString("Donater_email")   +  "</td>");
                                	
                                	/* ResultSet rs1 = null;
                                	Connection conn1 = null; */
                                	if(rs.getString("status").equals("Accepted"))
                                	{
                                		Connection conn1 = util.DBConnection.connect();
                                		 PreparedStatement ps1 = conn1.prepareStatement("select * from donater where Email=?");
                    		             
                    		 			 ps1.setString(1, rs.getString("Donater_email"));
                    		 			 ResultSet rs1 = ps1.executeQuery();
                    		             rs1.next();
                    		             out.println("<td>"  + rs1.getString("Ph_No")   +  "</td>");     
                    		             out.println("<td>"  + rs1.getString("Blood_Group")   +  "</td>"); 
                    		             out.println("</tr>");
                    		             conn1.close(); 
                                	}
                                	
                                	
                                	
                                 
                                }
                            %>
                            <%
                            
                            rs.close();
                            stmt.close();
                            conn.close();
                            }
                                
                            catch(Exception e)
                            {
                                 e.printStackTrace();
                            }
                            %>          
                            </table>  
                 			</div>
                            </article>
                 			
                            </div>
                        </div>
  <!-- ======= Request end ======= -->   
  					<!-- ======= Search ======= -->                   
                        <div class="tab-pane fade" id="account-notifications">
                            <div class="card-body pb-2">
                            <hr class="border-light m-0">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                     <h3>Find Donar</h3>
									    <p>Search for blood donar around you</p>
									   
									    <form action="Customersearch" method="post">
									        <label> Choose Blood Group</label><br>
									        <select  class="input-field" name="Blood_Group" style="width:750px; height:40px; border-color:#d6d7d3; border-radius:4px;color:#848482 ;">
									            <option> Choose Blood Group</option>
									            <option>A+</option>
									            <option>A-</option>
									            <option>B+</option>
									            <option>B-</option>
									            <option>AB+</option>
									            <option>AB-</option>
									            <option>O+</option>
									            <option>O-</option>
									          </select><BR>
									        <label>Location</label><br><input class="form-control me-2" type="search" placeholder="Enter location" name="Address" aria-label="Search"><br>
									        <button class="btn btn-outline-success" style="width:750px; height:50px" >Search</button><br>
											
										</form>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    
                    <!-- =======  search end ======= -->
                    
                    
       <!-- ======= Emergency search  ======= -->
                    <div class="tab-pane fade" id="EmergencySearch">
                            <div class="card-body pb-2">
                            <hr class="border-light m-0">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                     <h3>Find Donar</h3>
									    <p>Search for blood donar around you</p>
									   
									    <form action="EmergencySearch" method="post">
									        <label> Choose Blood Group</label><br>
									        <select  class="input-field" name="Blood_Group" style="width:750px; height:40px; border-color:#d6d7d3; border-radius:4px;color:#848482 ;">
									            <option> Choose Blood Group</option>
									            <option>A+</option>
									            <option>A-</option>
									            <option>B+</option>
									            <option>B-</option>
									            <option>AB+</option>
									            <option>AB-</option>
									            <option>O+</option>
									            <option>O-</option>
									          </select><BR>
									        <label>Location</label><br><input class="form-control me-2" type="search" placeholder="Enter location" name="Address" aria-label="Search"><br>
									     
											<button type="submit" style="margin: 5px; color:Black; background-color:red; width:750px; height:50px; border-color:#fff; border-radious:8px;" class="SideB1">Emergency Search</a></button>
										</form>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    
                    <!-- ======= Emergency search end ======= -->
                </div>
            </div>
        </div>
       
    </div>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
</body>

</html>
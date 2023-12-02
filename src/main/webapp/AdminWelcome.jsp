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
                            href="#donaterall">Donater Data</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#Customerall">Customer Data</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#Donater-search">Donater Search</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#customer-search">Customer Search</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#blood-request">Blood Request</a> 
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#feedback">Feedback</a>      
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#update">Update</a>
                  
                       
                      
                                 
                       
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
			
			
			String email=request.getParameter("email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from admin where email='"+email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

                    if(count>0){
            out.println("welcome "+email);
            
           
            Statement s=conn.createStatement();
           ResultSet rst=s.executeQuery("select * from admin where email='"+email+"' and Password='"+Password+"'");
          while(rst.next()){
              //System.out.println(rst.getString("Email"));
              
              
            %>
            <h3>Your Account Information</h3>
            <table>
           
            <tr><td >Id:</td><td style="color: #900C3F ;"><%=rst.getString("id")%></td></tr>
            <tr><td>Name:</td><td style="color: #900C3F ;"><%=rst.getString("name")%></td></tr>
            <tr><td>Email:</td><td style="color: #900C3F ;"><%=rst.getString("email")%></td></tr>
            <tr><td>Phone No:</td><td style="color: #900C3F ;"><%=rst.getString("ph_no")%></td></tr>
            <tr><td>Password:</td><td style="color: #900C3F ;"><%=rst.getString("Password")%></td></tr>
           
           
          
           </table>
           
          
            <%
           
          }
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



<!-- ======= Donater Data ======= -->
                        
                        <div class="tab-pane fade" id="donaterall">
                            <div class="card-body pb-2">
                                <div class="form-group">
 							<article style="background-color:#fff;margin-right: 50px;">
                            <h1 style="color:Black; font-size: 20px; text-align:center;"> Donater Records</h1>
                            <div class="form-popup" id="myForm" style="height:300px;width:2000px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
                            <table style="border-radius:10px; width:500px;text-align:center;background-color:#ffe4e1 ;border:#fff;color:Black; font-family: Arial, Helvetica, sans-serif; font-size:13px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#e8ccd7;">
                           	<th>ID</th>
                            <th>BLOOD GROUP</th> 
                            <th>GENDER</th> 
                            <th>NAME</th> 
                            <th>EMAIL</th> 
                            <th>ADDRESS</th> 
                            <th>PHONE NO</th> 
                            <th>PASSWORD</th> 
                            <th>UPDATE</th> 
                            <th>DELETE</th> 
                           
                            </tr>
                                                       <% 
                            try
                            {
                            	Connection conn = util.DBConnection.connect();
                                String query="select * from donater ";

                                Statement stmt=conn.createStatement();

                                ResultSet rs=stmt.executeQuery(query);

                                while(rs.next())
                                {
                            %>
                                <tr style=" color:black ;">
                                <td><%=rs.getString("id") %></td>
                                <td><%=rs.getString("Blood_Group") %></td>
                                <td><%=rs.getString("Gender") %></td>
                                <td><%=rs.getString("Name") %></td>
                                <td><%=rs.getString("Email") %></td>
                                <td><%=rs.getString("Address") %></td>
                                <td><%=rs.getString("Ph_No") %></td>
                                <td><%=rs.getString("Password") %></td>
                                 
                                <td style="background-color:#32cd32  ;">
                                <a  style="color:black;"type="button" class="button1" value="approve" href='edit?id=<%=rs.getString("id")%>'>EDIT</a> 

								</td>
								<td style="background-color:#ff4500;">
                                     <a style="color:black;" type="button" class="button2" value="reject"  href='Donaterdelete?id=<%=rs.getString("id")%>'>DELETE</a>

                               </td>
                                </tr>

                            <%
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
                        </div>
                        
   <!-- ======= Doanter data end ======= -->
   					<!-- ======= User data ======= -->
                        <div class="tab-pane fade" id="Customerall">
                            <div class="card-body pb-2">
                                <div class="form-group">
   	 						<article style="background-color:#fff;margin-right: 50px;">
                            <h1 style="color:Black; font-size: 20px; text-align:center;"> Customer Records</h1>
                            <div class="form-popup" id="myForm" style="height:300px;width:2000px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
                            <table style="border-radius:10px; width:500px;text-align:center;background-color:#ffe4e1 ;border:#fff;color:Black; font-family: Arial, Helvetica, sans-serif; font-size:13px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#e8ccd7;">
                           	<th>ID</th>
                            <th>BLOOD GROUP</th> 
                            <th>QUANTITY</th> 
                            <th>NAME</th> 
                            <th>EMAIL</th> 
                            <th>ADDRESS</th> 
                            <th>PHONE NO</th> 
                            <th>PASSWORD</th> 
                            <th>UPDATE</th> 
                            <th>DELETE</th> 
                           
                            </tr>
                                                       <% 
                            try
                            {
                            	Connection conn = util.DBConnection.connect();
                                String query="select * from user ";

                                Statement stmt=conn.createStatement();

                                ResultSet rs=stmt.executeQuery(query);

                                while(rs.next())
                                {
                            %>
                                <tr style=" color:black ;">
                                <td><%=rs.getString("id") %></td>
                                <td><%=rs.getString("Blood_Group") %></td>
                                <td><%=rs.getString("Quantity") %></td>
                                <td><%=rs.getString("Name") %></td>
                                <td><%=rs.getString("Email") %></td>
                                <td><%=rs.getString("Address") %></td>
                                <td><%=rs.getString("Ph_No") %></td>
                                <td><%=rs.getString("Password") %></td>
                                 
                                <td style="background-color:#32cd32  ;">
                                <a  style="color:black;"type="button" class="button1" value="approve" href='Aduseredit?id=<%=rs.getString("id")%>'>EDIT</a> 

								</td>
								<td style="background-color:#ff4500;">
                                     <a style="color:black;" type="button" class="button2" value="reject"  href='Customerdelete?id=<%=rs.getString("id")%>'>DELETE</a>

                               </td>
                                </tr>

                            <%
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
                        </div>
   <!-- ======= User data end ======= -->
   					<!-- ======= Donater Search ======= -->
                        <div class="tab-pane fade" id="Donater-search">
                            <div class="card-body">
                            
                            <h3>Find Donar</h3>
									
									    <form action="Donaterid" method="post">
									    <label>Enter Donater ID:</label><br><input class="form-control me-2" type="search" placeholder="Enter Donater ID" name="id" aria-label="Search"><br>
									     <button class="btn btn-outline-success" style="width:750px; height:50px" >Search</button><br>
											
										</form>
                           
                            </div>
                        </div>
  <!-- ======= Donater Search  end ======= -->   
  					<!-- ======= Customer Search ======= -->                   
                        <div class="tab-pane fade" id="customer-search">
                            <div class="card-body pb-2">
                            <hr class="border-light m-0">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                     <h3>Find User</h3>
									    
									    <form action="Customerid" method="post">
									     
									        <label>Enter Cutomer ID:</label><br><input class="form-control me-2" type="search" placeholder="Enter Cutomer ID" name="id" aria-label="Search"><br>
									     
										 <button class="btn btn-outline-success" style="width:750px; height:50px" >Search</button><br>
											
										</form> 
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    
                    <!-- =======   Customer search end ======= -->
                    
                    <!-- ======= blood-request ======= -->
                    
                    
                    
                     <div class="tab-pane fade" id="blood-request">
                            <div class="card-body pb-2">
                                <div class="form-group">
   	 						<article style="background-color:#fff;margin-right: 50px;">
                            <h1 style="color:Black; font-size: 20px; text-align:center;"> Blood Requset Records</h1>
                            <div class="form-popup" id="myForm" style="height:300px;width:2000px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
                            <table style="border-radius:10px; width:500px;text-align:center;background-color:#ffe4e1 ;border:#fff;color:Black; font-family: Arial, Helvetica, sans-serif; font-size:20px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#e8ccd7;">
                           	<th>ID</th>
                            <th>Donater Email</th> 
                            <th>Customer Email</th> 
                            <th>Status</th> 
                           
 <% 
                            try
                            {
                            	Connection conn = util.DBConnection.connect();
                                String query="select * from bloodreq ";

                                Statement stmt=conn.createStatement();

                                ResultSet rs=stmt.executeQuery(query);

                                while(rs.next())
                                {
                            %>
                                <tr >
                                <td><%=rs.getString("id") %></td>
                                <td><%=rs.getString("Customer_email") %></td>
                                <td><%=rs.getString("Donater_email") %></td>
                                <td><%=rs.getString("status") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><a  href="Donateraccept?id=<%=rs.getString("id")%>"  onclick="return confirm('Are you sure you want to accept this request? Your contact information will be share.');" ><button style="margin: 5px; color:Black; background-color:#03c03c   ; width:70px;border-color:#fff;border-radius:10px;" class="SideB1">Accept</button></a></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><a  href="Donaterregect?id=<%=rs.getString("id")%>" onclick="return confirm('Are you sure you want to reject this request?');"><button style="margin: 5px; color:Black; background-color:#ff0800 ; width:70px; border-color:#fff;border-radius:10px;" class="SideB1">Regect</button></a></td>
                                
                               </td>
                                </tr>

                            <%
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
                        </div>
                    
                    
                    
                    <!-- =======   blood-requestend ======= -->
                    
                    <!-- =======  feedback  ======= -->
                    
                    <div class="tab-pane fade" id="feedback">
                            <div class="card-body pb-2">
                                <div class="form-group">
   	 						<article style="background-color:#fff;margin-right: 50px;">
                            <h1 style="color:Black; font-size: 20px; text-align:center;"> Customer Records</h1>
                            <div class="form-popup" id="myForm" style="height:300px;width:2000px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
                            <table style="border-radius:10px; width:500px;text-align:center;background-color:#ffe4e1 ;border:#fff;color:Black; font-family: Arial, Helvetica, sans-serif; font-size:13px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#e8ccd7;">
                           	<th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">ID</th>
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">NAME</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">EMAIL</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">PHONE NO</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">SUBJECT</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">MESSAGE</th> 
                           
                           
                            </tr>
                                                       <% 
                            try
                            {
                            	Connection conn = util.DBConnection.connect();
                                String query="select * from feedback ";

                                Statement stmt=conn.createStatement();

                                ResultSet rs=stmt.executeQuery(query);

                                while(rs.next())
                                {
                            %>
                                <tr style=" color:black ;">
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("id") %></td>
                                <td style="padding-left: 15px;padding-right: 15px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("name") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("email") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("contact") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("subject") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("message") %></td>
                               
                                </tr>

                            <%
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
                        </div>
                    
                    <!-- =======  Feedback end ======= -->
                    
       <!-- ======= update ======= -->
                    <div class="tab-pane fade" id="update">
                            <div class="card-body pb-2">
                            <hr class="border-light m-0">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                                                                                      
<%
try{
			
			
			String email=request.getParameter("email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from admin where email='"+email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

                    if(count>0){
    
            
				           
				            Statement s=conn.createStatement();
				           ResultSet rst=s.executeQuery("select * from admin where email='"+email+"' and Password='"+Password+"'");
				          while(rst.next()){
				              //System.out.println(rst.getString("Email"));
				              
				              
				            %>
				            <h3>Update Account Information</h3>
				            
				             <form action="Adminupdate" method="Post">
				              <table>
				             
				                <tr> <td>id</td><td> <input type='text' name ='id' id='id' value= "<%=rst.getString("id")%>"> </td> </tr><br>
				                <tr><td>Name:</td><td> <input type="text"  placeholder="Enter Name" name="name" value="<%=rst.getString("Name")%>"></td></tr>
				                <tr><td>Email:</td><td><input type="email" placeholder="Email Id" name="email" value="<%=rst.getString("Email")%>"></td></tr>
				                <tr><td>Phone No:</td><td><input type="number" placeholder="Enter Phone Number"  name="ph_no" value="<%=rst.getString("Ph_No")%>"></td></tr>
				                <tr><td>Password:</td><td><input type="text" placeholder="Enter Password"  name="Password" value="<%=rst.getString("Password")%>"></td></tr>
								<tr><td colspan ='2'> <button style=" border-radius:8px;border-color:#fff;margin-top:10px;background-color:#03c03c ; width:150px; height:40px;" type='submit' onclick="return confirm('Are you sure you want to update information?');">Save Changes</button> </td> </tr>
				         		
								</table>
				                </form>
				   
				            	<%
           
          }
          }
         
}

catch(Exception e){
    System.out.println(e);
}
%>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    
                    <!-- ======= Update end ======= -->
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
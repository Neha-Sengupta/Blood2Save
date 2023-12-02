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
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        
                       
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">Info</a>
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
							        <h1 class="text-light"><a href="index.jsp"><img src="assets/img/favicon.png" alt="icon"><span style="color:#8a795d    ;">Blood2Save</span></a></h1>
							       
							        <!-- Uncomment below if you prefer to use an image logo -->
							        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
							      </div>
                            </div>
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <div class="form-group">
                                
                                <%
		try{
			
			
			String Email=request.getParameter("Email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from donater where Email='"+Email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

                    if(count>0){
            out.println("welcome "+Email);
            
           
            Statement s=conn.createStatement();
           ResultSet rst=s.executeQuery("select * from donater where Email='"+Email+"' and Password='"+Password+"'");
          while(rst.next()){
              //System.out.println(rst.getString("Email"));
              
              
            %>
            <h3>Your Account Information</h3>
            <table>
           
            <tr><td >Id:</td><td style="color: #900C3F ;"><%=rst.getString("id")%></td></tr>
            <tr><td>Blood_Group:</td><td style="color: #900C3F ;"><%=rst.getString("Blood_Group")%></td></tr>
            <tr><td>Gender:</td><td style="color: #900C3F ;"><%=rst.getString("Gender")%></td></tr>
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
          
                        <div class="tab-pane fade" id="account-info">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                                                   
<%
try{
			
			
			String Email=request.getParameter("Email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from donater where Email='"+Email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

                    if(count>0){
    
            
				           
				            Statement s=conn.createStatement();
				           ResultSet rst=s.executeQuery("select * from donater where Email='"+Email+"' and Password='"+Password+"'");
				          while(rst.next()){
				              //System.out.println(rst.getString("Email"));
				          
				            %>
				            <h3>Update Account Information</h3>
				            
				             <form action='Donaterupdate' method='Post'>
				              <table>
				             
				              <tr> <td>id</td><td> <input type='text' name ='id' id='id' value= "<%=rst.getString("id")%>"> </td> </tr>
				              <tr><td>Blood_Group:</td><td><input type="text" oninput="this.value = this.value.toUpperCase()" name="Blood_Group" id="Blood_Group" value="<%=rst.getString("Blood_Group")%>"></td></tr>
				                <tr><td>Gender:</td><td><input type="text" name="Gender"id='Gender'value="<%=rst.getString("Gender")%>" > </td></tr>
				                <tr><td>Name:</td><td> <input type="text"  placeholder="Enter Name" name="Name" id='Name'value="<%=rst.getString("Name")%>"></td></tr>
				                <tr><td>Email:</td><td><input type="email" placeholder="Email Id" name="Email" id='Email'value="<%=rst.getString("Email")%>"></td></tr>
				                <tr><td>Address:</td><td><input type="text"placeholder="Enter Address" name="Address" id='Address' value="<%=rst.getString("Address")%>"></td></tr>
				                <tr><td>Phone No:</td><td><input type="number" placeholder="Enter Phone Number"  name="Ph_No" id='Ph_No' value="<%=rst.getString("Ph_No")%>"></td></tr>
				                <tr><td>Password:</td><td><input type="text" placeholder="Enter Password"  name="Password" id='Password' value="<%=rst.getString("Password")%>"></td></tr>
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
                        <div class="tab-pane fade" id="account-social-links">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                                                    
                                <%
		try{
			
			
			String Email=request.getParameter("Email");
			String Password=request.getParameter("Password");
	
	 		Connection conn = util.DBConnection.connect(); 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from donater where Email='"+Email+"' and Password='"+Password+"'");
           int count=0;
          while(rs.next())
          {
                              count++;
          }

           		if(count>0){
           
		            Statement s=conn.createStatement();
		           	ResultSet rst=s.executeQuery("select * from donater where Email='"+Email+"' and Password='"+Password+"'");
		         	 while(rst.next()){
		              //System.out.println(rst.getString("Email"));
		              
		              
		            %>
		            <h3>Delete Account </h3>
		            <table>
		           
		            <tr><td >Id:</td><td style="color: #900C3F ;"><%=rst.getString("id")%></td></tr>
		            <tr><td>Blood_Group:</td><td style="color: #900C3F ;"><%=rst.getString("Blood_Group")%></td></tr>
		            <tr><td>Gender:</td><td style="color: #900C3F ;"><%=rst.getString("Gender")%></td></tr>
		            <tr><td>Name:</td><td style="color: #900C3F ;"><%=rst.getString("Name")%></td></tr>
		            <tr><td>Email:</td><td style="color: #900C3F ;"><%=rst.getString("Email")%></td></tr>
		            <tr><td>Address:</td><td style="color: #900C3F ;"><%=rst.getString("Address")%></td></tr>
		            <tr><td>Phone No:</td><td style="color: #900C3F ;"><%=rst.getString("Ph_No")%></td></tr>
		            <tr><td>Password:</td><td style="color: #900C3F ;"><%=rst.getString("Password")%></td></tr>
		           
		           
		          
		           </table>
		           
		           <a  href="Donaterdelete?id=<%=  rst.getString("id")%>" onclick="return confirm('Are you sure you want to delete this item?');"><button style="margin-top:10px; color:Black; background-color:red; width:100px; border-radius:8px;border-color:#fff;" class="SideB1">Delete</button></a>
		          
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
                        <div class="tab-pane fade" id="account-connections">
                            <div class="card-body">
                            
                            <article style="background-color:#fff;">
                            <h1 style="color:Black; font-size: 20px; text-align:center;"> Blood Records</h1>
                            <div class="form-popup" id="myForm" style="height:200px;width:1140px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
                            <table class="center" style="background-color:#fff0f5;border:#fff;color:Black; font-family: Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold; border-radius:8px;  text-align:center;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#e8ccd7         ;">
                            
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">Donater_email</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">customer_email</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">status</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">Accept</th> 
                            <th style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;">Reject</th> 
                            </tr>
                            <%
                            try
                            {
                            	HttpSession session2 = request.getSession();
                            	String demail = (String) session2.getAttribute("demail");
                            	System.out.println(demail);
                            	
                            	Connection conn = util.DBConnection.connect();
                                String query="select * from bloodreq where Donater_email='"+demail+"'";

                                Statement stmt=conn.createStatement();

                                ResultSet rs=stmt.executeQuery(query);

                                while(rs.next())
                                {
                                
                            %>
                                <tr>
                              
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("Customer_email") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("Donater_email") %></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><%=rs.getString("status") %></td>
                                
                               <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><a  href="Donateraccept?id=<%=rs.getString("id")%>"  onclick="return confirm('Are you sure you want to accept this request? Your contact information will be share.');" ><button style="margin: 5px; color:Black; background-color:#03c03c   ; width:70px;border-color:#fff;border-radius:10px;" class="SideB1">Accept</button></a></td>
                                <td style="padding-left: 5px;padding-right: 5px;padding-top: 6px;padding-bottom: 6px;"><a  href="Donaterregect?id=<%=rs.getString("id")%>" onclick="return confirm('Are you sure you want to reject this request?');"><button style="margin: 5px; color:Black; background-color:#ff0800 ; width:70px; border-color:#fff;border-radius:10px;" class="SideB1">Regect</button></a></td>
                                
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
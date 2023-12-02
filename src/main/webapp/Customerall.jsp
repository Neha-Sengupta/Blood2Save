<%
//   String name = request.getParameter( "username" );
  // session.setAttribute( "theName", name );
%>

<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<style>
* {
  box-sizing: border-box;
  }
body 
{
  font-family: Arial, Helvetica, sans-serif;
}

.form-popup {
  display: none;
}


/* Style the header */
header 
{
  background-color: #666;
  /*opacity:0.7;*/
  background: rgba(0, 0, 0, 0.4);
  padding: 30px;
  text-align: center;
  font-size: 45px;
  color: white;
}

/* Container for flexboxes */
section 
{
background: rgba(0, 0, 0, 0.1);
  display: -webkit-flex;
  text-align: center;
  display: flex;
}

/* Style the navigation menu */
nav 
{
  -webkit-flex: 1;
  -ms-flex: 1;
  flex: 0.5;
  background: #ccc;
  padding: 20px;
  background: rgba(0, 0, 0, 0.2);
}

/* Style the list inside the menu */
nav ul 
{

  list-style-type: none;
  padding: 0;
}

/* Style the content */
article 
{
  -webkit-flex: 3;
  -ms-flex: 3;
  flex: 3;
  background-color: #f1f1f1;
  /*opacity:0.7;*/
  background: rgba(0, 0, 0, 0.1);
  padding: 50px;
}

.center {
  margin-left: auto;
  margin-right: auto;
}

/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media (max-width: 600px) 
{
  section 
  {
    -webkit-flex-direction: column;
    flex-direction: column;
  }
}

</style>
</head>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<body>
 

             

                    <header>
                        <h3>Customer List</h3>
                    </header>
                    <section>
                        <nav>
                            <ul>
                                <li>
                                    <button type="button" value="Get All Record"  class="open-button" onclick="openForm()" style="width:70px;
                                     height:40px;
                                     margin:5px; 
                                     border:none; 
                                     border-radius:2px; 
                                     font-size:17px; 
                                     font-weight:bold;">View</button>

                                     <button type="button" class="btn cancel" onclick="closeForm()" style="width:70px;
                                     height:40px; 
                                     margin:5px; 
                                     border:none; 
                                     border-radius:2px; 
                                     font-size:17px; 
                                     font-weight:bold;">Close</button>
                                </li>
                            </ul>
                        </nav>
                        <article>
                            <h1 style="color:white; font-size: 20px;"> Customer Records</h1>
                            <div class="form-popup" id="myForm" style="height:200px;width:1180px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">

                            <table class="center" style="border:black;color:black; font-family: Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr style=" background-color:#acacac ;">
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
                                <a  style="color:black;"type="button" class="button1" value="approve" href='Customeredit?id=<%=rs.getString("id")%>'>EDIT</a> 

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

                <script>
                    function openForm() 
                    {
                        document.getElementById("myForm").style.display = "block";
                    }

                    function closeForm() 
                    {
                        document.getElementById("myForm").style.display = "none";
                    }

                </script>                           
            </section>
    </body>
</html>
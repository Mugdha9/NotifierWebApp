 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Notifier Application | Notebooks</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel="stylesheet" href="dashboard/main.css">
<style>
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: relative;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: relative;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}

.myDiv {
  border: 2px black;
  border-radius: 4px;
  background-color: gainsboro;
  margin-left:2px;
  margin-right:2px;
  padding:5px;
  margin-bottom:20px;
  padding-bottom:50px
}

</style>

</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/notifier_application";%>
<%!String user = "root";%>
<%!String psw = "@Mugdha123";%>

<body class="home">
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("email_id")==null && (int)session.getAttribute("user_id") == 0)
      response.sendRedirect("index.jsp");

  %> 
 <%
int user_id = (int) session.getAttribute("user_id"); %>
<%
  Connection conn = null;
  PreparedStatement pss = null;
 try
  {
  int no=0;
  Class.forName(driverName);
  conn = DriverManager.getConnection(url,user,psw);
  String sql = "select note_name , start_date from note where reminder_date=curdate() and user_id="+user_id;
  pss = conn.prepareStatement(sql);
  ResultSet rs = pss.executeQuery();
 %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <div class="logo">
                <br>
                <br>
                <br>
                </div>
                <div class="navi">
                    <ul>
                    	<li><a href="notebooks"><i class="fa fa-book" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Notebooks</span></a></li>
                        <li><a href="viewallnotes"><i class="fa fa-sticky-note" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Notes</span></a></li>
                        <li><a href="edituser"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Edit User</span></a></li>
                        <li><a href="#"><span ></span></a></li>
                        <li><a href="#"><span ></span></a></li>
                        <li><a href="#"><span ></span></a></li>
                        <li><a href="#"><span ></span></a></li>
                        <li><a href="#"><span ></span></a></li>
                        <li><a href="#"><span ></span></a></li>

                        
                    </ul>
                </div>
            </div>
            <div  class="col-md-10 col-sm-11 display-table-cell v-align">
                <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                <div class="row">
                    <header>
                        <div class="col-md-7">
                        <h3 style="color:#86c232;"><b>Welcome, <span>${name} <%request.getAttribute("name"); %></span></b></h3>
                            <nav class="navbar-default pull-left">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                            </nav>
                     
                        </div>
                        <div class="col-md-5">
                            <div  style="background-color:#6b6e70" class="header-rightside">
                                <ul class="list-inline header-top pull-right">
                                    <li class="hidden-xs"><a href="#" class="add-project" data-toggle="modal" data-target="#add_project">Add Notebook</a></li>
                                                                        <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell" aria-hidden="true"></i>
                                            <b class="caret"></b></a>
                                            
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div style="color:#86c232" class="navbar-content">
													<% while(rs.next())
                       								{
                       									String notename = rs.getString("note_name"); 
                       									String startdate=rs.getString("start_date");
                       									no++;
                                       				 %>
                                        <div style="text-align:center;margin-left:22px;">
      										<p><c:out value="<%=notename%>"/></p>
      										<p><c:out value="<%=startdate%>"/></p>
      										<div class="divider"></div>
      									</div>
    									<% 
            								}
                       
                       					%>
                       
                                                </div>
                                            </li>
                                            
                                        </ul>
                                        <span class="label label-primary"><c:out value="<%=no%>"/></span>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="signupandlogin/images/avatar.png" alt="MAvatar" class="avatar">
                                            <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div style="color:#86c232" class="navbar-content">
                                                    <span>${email_id} </span>
                                                     <div class="divider">
                                                    </div>
                                                    <a href="logout" style="color:#86c232" class="view btn-sm active">Logout</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <%
                                    }
                      				catch(SQLException sqe)
                     				{ 
                     					out.println(sqe);
                    				 }
                     				%>
                                    
                                </ul>
                            </div>
                        </div>  
                    </header>
                </div>
                <br>
                <br>
                <%
            

int count=0;
                       Connection con = null;
                       PreparedStatement ps = null;
                      try
                       {
                       Class.forName(driverName);
                       con = DriverManager.getConnection(url,user,psw);
                       String sql = "SELECT * FROM notebook where user_id = ?";
                       ps = con.prepareStatement(sql);
                       ps.setInt(1, user_id);
                       ResultSet rs = ps.executeQuery();
                      
                     %>
				    
     <div class="user-dashboard">
					<div>
						<div class="row">
							<div class="col-md-12">
							<h2 style="color:#86c232"><strong>Notebooks</strong></h2>
							  <%
                         while(rs.next())
                         {
                         String notebook_name = rs.getString("notebook_name"); 
                         int id=rs.getInt("notebook_id");
                         ps = con.prepareStatement("SELECT count(*) as cm FROM note where notebook_id="+id);
                         ResultSet rss = ps.executeQuery();
                         rss.next();
                         count = rss.getInt("cm") ;
                         //String emailid = rs.getString("emailid"); 
                          %>
   
        						<div class="table-responsive">
    									<div class="myDiv">
    										<br>
                        					<p><h4><a style="color:black;" href="viewnotes?notebook_name=<c:out value="<%=notebook_name%>" />"><b><c:out value="<%=notebook_name%>" /></b></a></h4><div style="float:right;"><a style="color:black" href="editnotebook?notebook_name=<c:out value="<%=notebook_name%>" />"><i class="fa fa-edit"></i><em> Edit</em></a>
											&nbsp;&nbsp;&nbsp;&nbsp; 
											<a style="color:black" href="deletenotebook?notebook_name=<c:out value="<%=notebook_name%>" />"><i class="fas fa-trash-alt"></i><em> Delete</em></a></div>
                       						<p><c:out value="<%=count%>"/>&nbsp;&nbsp;Notes</p>
										</div>					
            						</div>
            					
            						
            						 <% 
                         }
                     %>
<%
                       }
                        catch(SQLException sqe)
                       { 
                       out.println(sqe);
                       }
                       %>
       						 </div>
						</div>
					</div>
                </div>
            </div>
        </div>

    </div>



    <!-- Modal -->
    <div id="add_project" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form method = "POST" action = "<%=request.getContextPath()%>/insertnotebooks">
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">Add Notebook</h4>
                </div>
                <div class="modal-body">
                            <input type="text" placeholder="Your Notebook" name="notebook_name" autocomplete="off" required>
                </div>
                <div class="modal-footer">
                    <input type="submit"  style="background-color:#86c232;color:#ffffff" class="btn btn-default" value="Save Changes">
              <span></span>
              <input type="submit"  style="background-color:#86c232;color:#ffffff" formaction="dashboard.jsp" class="btn btn-default" value="Cancel">
                </div>
            </div>
            </form>

        </div>
    </div>
    
    <form method = "POST" action = "<%=request.getContextPath()%>/deletenotebook">
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record? ${notebook}</div>
       <input type="hidden" name = "notebook_name" value="${notebook}">
       
      </div>
        <div class="modal-footer ">
        <span class="glyphicon glyphicon-ok-sign"></span><input type="submit" name="save" id="signin" class="form-submit" value="Yes"/>
        <span class="glyphicon glyphicon-remove"></span><button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    </form>
    <script>
    $(document).ready(function(){
    	   $('[data-toggle="offcanvas"]').click(function(){
    	       $("#navigation").toggleClass("hidden-xs");
    	   });
    	});
    </script>
    
    <script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>

<script>
    $(document).ready(function(){
    	$("#mytable #checkall").click(function () {
    	        if ($("#mytable #checkall").is(':checked')) {
    	            $("#mytable input[type=checkbox]").each(function () {
    	                $(this).prop("checked", true);
    	            });

    	        } else {
    	            $("#mytable input[type=checkbox]").each(function () {
    	                $(this).prop("checked", false);
    	            });
    	        }
    	    });
    	    
    	    $("[data-toggle=tooltip]").tooltip();
    	});

    </script>

    

</body>
</html>
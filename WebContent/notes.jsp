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

<title>Notifier Application | Notes</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="dashboard/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />

<script>
	     
	     $(document).ready(function () {
	    	 var minDate = new Date();
	    	 var maxDate = new Date();
	    	 $("#start").datepicker({
	    		 showAnim: 'drop',
	    		 numberOfMonth: 1,
	    		 minDate: minDate,
	    		 dateFormat: 'yy-mm-dd',
	    		 onClose: function (selectedDate){
	    			 $('#end').datepicker("option","minDate",selectedDate);
	    		 }
	    	 });
	    	 
	    	 $("#end").datepicker({
	    		 showAnim: 'drop',
	    		 numberOfMonth: 1,
	    		 dateFormat: 'yy-mm-dd',
	    		 onClose: function (selectedDate){
	    			 $('#remind').datepicker("option","maxDate",selectedDate);
	    		 }
	    	 });
	    	 
	    	 $("#remind").datepicker({
	    		 showAnim: 'drop',
	    		 numberOfMonth: 1,
	    		 minDate: minDate,
	    		 maxDate:maxDate,
	    		 maxdate:$("#end").datepicker,
	    		 dateFormat: 'yy-mm-dd',
	    		 onClose: function (selectedDate){
	    			 $('#end').datepicker("option","minDate",selectedDate);
	    		 }
	    	 });
	    	 
	    	 
	    	 
	     });
	
	</script>

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
  border-radius: 4px;	
  border: 2px black;
  background-color: gainsboro;
  margin-left:2px;
  margin-right:2px;
  padding:5px;
  margin-bottom:20px;
  padding-bottom:50px
}

.myDiv1 {
  border: 5px;
  border-radius: 4px;
  background-color: #86c232;    
  text-align: center;
  width:120px;
  height:40px;
  float:center;
  text-align: center;
  vertical-align: middle;
  line-height: 40px;    
  margin-left:20%;
  margin-top: -35px; 
}


.avatar {
  vertical-align: middle;
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.selectBox {
   -webkit-appearance: menulist-button;
   height: 50px;
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
            <div class="col-md-10 col-sm-11 display-table-cell v-align">
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
                            <div class="header-rightside">
                                <ul class="list-inline header-top pull-right">
                                    <li class="hidden-xs"><a href="#" class="add-project" data-toggle="modal" data-target="#add_project">Add Note</a></li>
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
                                                    <span>${email_id}</span>
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
     <div class="user-dashboard">
					<div>
						<div class="row">
							<div class="col-md-12">
							<h2 style="color:#86c232"><strong>Notes</strong></h2>
        						<div class="table-responsive">
              						    <c:forEach var="note" items="${notes}">
    											<div class="myDiv">
    											<br>
                        					<h4><a style="color:black" href="notedetails?note_name=<c:out value='${note.note_name}' />"><b><c:out value="${note.note_name}" /></b></a></h4>
                        					
                        					<c:if test="${note.status == 'Not Started'}">
                        					<div style="float:left">Starts on ${note.start_date}</div>
                        					<div class="myDiv1"; style="color:white">
  												Not Started
											</div>
                        					</c:if>
                        					<c:if test="${note.status == 'Started'}">
                        					<div style="float:left">Started on ${note.start_date}</div>
                        					<div class="myDiv1" ; style="color:white">
  												Started
											</div>
                        					</c:if>
                        					<c:if test="${note.status == 'Completed'}">
                        					<div style="float:left">Starts on ${note.start_date}</div>
                        					<div class="myDiv1" ; style="color:white">
  												Completed
											</div>
                        					</c:if>
                        					<div style="float:right;"><a style="color:black" href="editnote?note_name=<c:out value='${note.note_name}' />"><i class="fa fa-edit"></i><em> Edit</em></a>
											&nbsp;&nbsp;&nbsp;&nbsp; 
											<a style="color:black" href="deletenote?note_name=<c:out value='${note.note_name}' />"><i class="fas fa-trash-alt"></i><em> Delete</em></a>
                       						
												</div>
												</div>
										</c:forEach>
            					</div>
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
            <form method = "POST" action = "<%=request.getContextPath()%>/insertnotes">
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">Add Note</h4>
                </div>
                <div class="modal-body">
                            <input type="text" placeholder="Your Note" name="note_name" autocomplete="off" required>
                            <input type="text" placeholder="Start Date" name="start_date" id = "start" autocomplete="off" required>
                            <input type="text" placeholder="End Date" name="end_date" id = "end" autocomplete="off" required>
                            <input type="text" placeholder="Reminder Date" name="reminder_date" id = "remind" autocomplete="off" required>
                            <!-- <input type="text" placeholder="Status" name="status"> -->
                          
                            <input type="text" placeholder="Tag" name="tag" required>
                            <input type="text" placeholder="Description" name="description" required>
                            <input type="text" name="notebook_name" value='${notebook_name}' readonly>
                            
							
							<input type="radio" id="male" name="status" value="Started">
							<label for="male">Started</label><br>
							<input type="radio" id="female" name="status" value="Not Started">
							<label for="female">Not Started</label><br>
							<input type="radio" id="other" name="status" value="Completed">
							<label for="other">Completed</label> 
							
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notifier Application | Edit User</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("email_id")==null && (int)session.getAttribute("user_id") == 0)
      response.sendRedirect("index.jsp");

  %> 

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<div class="container">
    <h1  style="color:#86c232">Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <h3 style="color:#86c232">Personal info</h3>
        
        <form class="form-horizontal" role="form"method="POST" action="<%=request.getContextPath() %>/savedetails">
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="email" name="email" value="${signupbean.email_id}" readonly>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="name" value="${signupbean.name}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">User Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="username" value="${signupbean.username}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Mobile Number:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="mobile" value="${signupbean.mobile_number}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="pass" value="${signupbean.password}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit"  style="background-color:#86c232 ;color:white" class="btn btn-default" value="Save Changes">
              <span></span>
              <input type="submit"  style="background-color:#86c232 ;color:white" formaction="dashboard.jsp"  class="btn btn-default" value="Cancel">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
</body>
</html>
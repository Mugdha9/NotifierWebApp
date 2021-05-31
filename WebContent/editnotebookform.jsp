<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notifier Application | Edit Notebook</title>
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
    <h1 style="color:#86c232">Edit Notebook</h1>
  	<hr>
	<div class="row">
            
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <form class="form-horizontal" role="form" method="POST" action="<%=request.getContextPath()%>/updatenotebook">
          <div class="form-group">
            <label class="col-lg-3 control-label">Notebook Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="notebook_name" value="${notebook_name}" readonly/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Update Notebook Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="newnotebook_name" id="name" required/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit"  style="background-color:#86c232;color:white" class="btn btn-default" value="Save Changes">
              <span></span>
              <input type="submit" style="background-color:#86c232;color:white" formaction="notebooks" class="btn btn-default" value="Cancel">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
</body>
</html>
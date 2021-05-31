<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notifier Application | Edit Note</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<script>
$(document).ready(function()
{
	var minDate = new Date();
	var maxDate = new Date();
	$("#start").datepicker({
		showAnim: 'drop',
		numberOfMonth: 1,
		minDate: minDate,
		maxDate: maxDate,
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
		maxDate: maxDate,
		maxDate: $("#end").datepicker,
		dateFormat: 'yy-mm-dd',
		onClose: function (selectedDate){
			$('#end').datepicker("option","minDate",selectedDate);
		}
	});
});
</script>    

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
    <h1>Edit Note</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        
        <form class="form-horizontal" role="form"method="POST" action="<%=request.getContextPath() %>/updatenote">
          <div class="form-group">
            <label class="col-lg-3 control-label">Note Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="note_name" value="${note.note_name}" readonly>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Start Date:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="start_date" id="start" value="${note.start_date}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">End Date:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="end_date" id="end" value="${note.end_date}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Reminder Date:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="reminder_date" id="remind" value="${note.reminder_date}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Status:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="status" value="${note.status}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Tag:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="tag" value="${note.tag}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Description:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="description" value="${note.description}" required>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-8">
              <input class="form-control" type="hidden" name="note_id" value="${note.note_id}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="modal-footer">
            		<input type="submit" style="background-color:#86c232;color:white" name="save" id="signin" class="btn btn-default" value="Save"/>
                    <input type="submit" style="background-color:#86c232;color:white" formaction="viewnotesafternotediting?note_id=${note.note_id}"  value="Cancel" class="btn btn-default"/>
                </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
</body>
</html>
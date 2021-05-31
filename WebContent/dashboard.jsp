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
<title>Notifier Application | Dashboard</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="dashboard/main.css">
</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/notifier_application";%>
<%!String user = "root";%>
<%!String psw = "@Mugdha123";%>

<body style="height: 100% width: 100% position: absolute;" class="home">
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
                                                    <span>${email_id} <%request.getAttribute("email_id"); %></span>
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
                </div>
            </div>
        </div>

    </div>

    <script>
    $(document).ready(function(){
    	   $('[data-toggle="offcanvas"]').click(function(){
    	       $("#navigation").toggleClass("hidden-xs");
    	   });
    	});



    </script>

</body>
</html>
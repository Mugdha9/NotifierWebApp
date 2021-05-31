<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Notifier Application | Login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="signupandlogin/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="signupandlogin/css/style.css">
</head>
<body>

    <div class="main">

        <section class="signup">
            <div class="container">
            
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form" action="<%=request.getContextPath()%>/login">
                        <h2 class="form-title">Login</h2>
                       
                        <div class="form-group">
                            <input type="email" class="form-input" name="email_id" id="email" placeholder="Your Email" required/>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password" placeholder="Password" required/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Login"/>
                        </div>
                        
                        <span style="color:red;">${errMsg}</span>
                    </form>
                    <p class="loginhere">
                        Create an account ? <a href="signup.jsp" class="loginhere-link">Signup here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="signupandlogin/vendor/jquery/jquery.min.js"></script>
    <script src="signupandlogin/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
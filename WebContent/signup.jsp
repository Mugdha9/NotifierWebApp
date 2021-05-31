<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Notifier Application | Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="signupandlogin/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="signupandlogin/css/style.css">
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form" action="<%=request.getContextPath()%>/signup">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name" required/>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="username" id="username" placeholder="Your User Name" required/>
                        </div>
                        
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Your Email" required/>
                        </div>
                        <div class="form-group">
                            <input type="tel" class="form-input" name="mobile" id="mobile" pattern="[789][0-9]{9}" placeholder="Your Mobile Number" required/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="myInput" minlength="8" placeholder="Password" required/>                            
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="re_password" id="confirm_password" minlength="8" placeholder="Repeat your password" required/>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Already have an account ? <a href="login.jsp" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    
    <script src="signupandlogin/vendor/jquery/jquery.min.js"></script>
    <script src="signupandlogin/js/main.js"></script>
    <script>
    var password = document.getElementById("password")
    , confirm_password = document.getElementById("confirm_password");

  function validatePassword(){
    if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
      confirm_password.setCustomValidity('');
    }
  }

  password.onchange = validatePassword;
  confirm_password.onkeyup = validatePassword;
    </script>
    


</body>
</html>
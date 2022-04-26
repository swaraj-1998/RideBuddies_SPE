<%
if (session.getAttribute("phone") != null){
	response.sendRedirect("home.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RideBuddies | Register</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="login/css/style.css">
</head>
<body>
    
    <div class="main">
        <!-- Sign up form -->
        <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form role="form" action="controllers/logincontroller.jsp" method="POST" class="register-form" id="register-form">
                            <input type="hidden" name="type" value="signup">
                                <div class="form-group">
                                    <label for="form-first-name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="name" id="form-first-name" placeholder="Name"/>
                                </div>
                                <div class="form-group">
                                        <label for="form-first-name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                        <input type="text" name="gender" id="form-first-name" placeholder="Gender"/>
                                </div>
                                <div class="form-group">
                                        <label for="form-last-name"><i class="zmdi zmdi-phone material-icons-name"></i></label>
                                        <input type="text" name="phone" id="form-last-name" placeholder="Phone Number"/>
                                </div>
                                <div class="form-group">
                                    <label for="form-email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="form-email" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <label for="form-password"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="form-password" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register Me!"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="login/images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="index.jsp" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->
        <script src="login/vendor/jquery/jquery.min.js"></script>
        <script src="login/js/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
    </html>
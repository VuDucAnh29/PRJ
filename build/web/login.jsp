<%-- 
    Document   : login
    Created on : Mar 3, 2022, 2:30:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/login_style.css" />
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <title>Login Page</title>
    </head>
    <body>
        <div class="login-signup-wrap">
            <div class="login-wrap">
                <div class="login-html">
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                    <input id="tab-2" type="radio" name="tab" class="sign-up" ><label for="tab-2" class="tab"><a href="signup.jsp">Sign Up</a></label>
                    <div class="login-form">
                        <form action="MainController" method="POST">
                            <div class="sign-in-htm">
                                <div class="group">
                                    <label for="user" class="label">Username</label>
                                    <input id="user" type="text" class="input" name="userID">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Password</label>
                                    <input id="pass" type="password" class="input" name="password">
                                </div>
                                <%
                                    String error = (String) request.getAttribute("ERROR");
                                    if (error != null) {
                                %>
                                <p class="error"><%= error%></p>
                                <%
                                    }
                                %>

                                <div class="group">
                                    <input type="submit" class="button" name="action" value="Sign In">
                                </div>
                                
                                <div class="g-recaptcha" style="display: flex; justify-content: center"
                                     data-sitekey="6LcGX9AeAAAAABAUt6P11CmhKbQgxsZGqp23uKiB">
                                </div>
                                <div class="group" style="display: flex; justify-content: center; margin-top: 20px">
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/PRJ-Assignment/login-google&response_type=code
                                       &client_id=869306007488-lb429foncrs3vbo8vilcbp449897iv8b.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <a href="#forgot">Forgot Password?</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : signup
    Created on : Mar 4, 2022, 9:13:05 PM
    Author     : Admin
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/signup_style.css" />
        <title>Sign Up Page</title>
    </head>
    <body>
        <div class="login-signup-wrap">
            <div class="login-wrap">
                <div class="login-html">
                    <input id="tab-1" type="radio" name="tab" class="sign-in" ><label for="tab-1" class="tab"><a href="login.jsp">Sign In</a></label>
                    <input id="tab-2" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">Sign Up</label>
                    <div class="login-form">
                        <form action="MainController" method="POST">
                            <%
                                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                if (userError == null) {
                                    userError = new UserError();
                                }
                            %>
                            <div class="sign-up-htm">
                                
                                <%
                                    if (userError.getUserID().length() > 10) {
                                        %>
                                <div class="group">
                                    <label for="user" class="label">Username</label>
                                    <input id="user" type="text" class="input" required="" name="userID" value="">
                                </div>
                                <p class="error"><%= userError.getUserID()%></p>
                                <%
                                    } else {
                                    %>
                                <div class="group">
                                    <label for="user" class="label">Username</label>
                                    <input id="user" type="text" class="input" required="" name="userID" value="<%= userError.getUserID()%>">
                                </div>
                                <%
                                    }
                                %>
                                
                                <%
                                    if (userError.getFullName().length() < 5 || userError.getFullName().length() > 40) {
                                %>
                                <div class="group">
                                    <label for="user" class="label">Full Name</label>
                                    <input id="user" type="text" class="input" required="" name="fullName" value="">
                                </div>
                                <p class="error"><%= userError.getFullName()%></p>
                                <%
                                    } else {
                                %>
                                <div class="group">
                                    <label for="user" class="label">Full Name</label>
                                    <input id="user" type="text" class="input" required="" name="fullName" value="<%= userError.getFullName()%>">
                                </div>
                                <%
                                    }
                                %>
                                
                                <%
                                    if (!userError.getPassword().equals(userError.getConfirm())) {
                                        %>
                                <div class="group">
                                    <label for="pass" class="label">Password</label>
                                    <input id="pass" type="text" class="input" required="" name="password" value="<%= userError.getPassword()%>">
                                </div>
                                <%
                                    } else {
                                    %>
                                <div class="group">
                                    <label for="pass" class="label">Password</label>
                                    <input id="pass" type="password" class="input" required="" name="password" value="<%= userError.getPassword()%>">
                                </div>
                                <%
                                    }
                                %>
                                
                                <%
                                    if (!userError.getPassword().equals(userError.getConfirm())) {
                                        %>
                                <div class="group">
                                    <label for="confirm" class="label">Repeat Password</label>
                                    <input id="confirm" type="text" class="input" required="" name="confirm" value="">
                                </div>
                                <p class="error"><%= userError.getConfirm()%></p>
                                <%
                                    } else {
                                    %>
                                <div class="group">
                                    <label for="confirm" class="label">Repeat Password</label>
                                    <input id="confirm" type="password" class="input" required="" name="confirm" value="<%= userError.getConfirm()%>">
                                </div>
                                <%
                                    }
                                %>
                                
                                <div class="group">
                                    <label for="address" class="label">Address</label>
                                    <input id="address" type="text" class="input" required="" name="address" value="<%= userError.getAddress()%>">
                                </div>
                                <div class="group">
                                    <label for="birthday" class="label">Birthday</label>
                                    <input id="birthday" type="date" class="input" max="2012-12-31" required="" name="birthday" value="<%= userError.getBirthday()%>">
                                </div>
                                <div class="group">
                                    <label for="phone" class="label">Phone</label>
                                    <input id="phone" type="tel" class="input" placeholder="xxxxxxxxxx" pattern="[0-9]{10,12}" required="" name="phone" value="<%= userError.getPhone()%>">
                                </div>
                                <div class="group">
                                    <label for="email" class="label">Email</label>
                                    <input id="email" type="email" class="input" required="" name="email" value="<%= userError.getEmail()%>">
                                </div>
                                <input type="text" name="roleID" readonly="" value="US" style="visibility: hidden">
                                <div class="group">
                                    <input type="submit" class="button" value="Sign Up" name="action">
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <label><a href="login.jsp">Already Member?</a></label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

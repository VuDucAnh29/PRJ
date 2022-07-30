<%-- 
    Document   : addInfo
    Created on : Mar 12, 2022, 11:25:06 AM
    Author     : Admin
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/addInfo_style.css" />
        <title>Add Info Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }

        %>
        <div class="login-signup-wrap">
            <div class="login-wrap">
                <div class="login-html">
                    <!--<input id="tab-1" type="radio" name="tab" class="sign-in" ><label for="tab-1" class="tab"><a href="login.jsp">Sign In</a></label>-->
                    <input id="tab-2" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">Additional Information</label>
                    <div class="login-form">
                        <form action="MainController" method="POST">
                            <div class="sign-up-htm">
                                <div class="group">
                                    <label for="address" class="label">Address</label>
                                    <input id="address" type="text" class="input" required="" name="address" value="">
                                </div>
                                <div class="group">
                                    <label for="phone" class="label">Phone</label>
                                    <input id="phone" type="tel" class="input" placeholder="xxxxxxxxxx" pattern="[0-9]{10,12}" required="" name="phone" value="">
                                </div>
                                
                                <%
                                    if (loginUser.getEmail() == "") {
                                            %>
                                <div class="group">
                                    <label for="email" class="label">Email</label>
                                    <input id="email" type="email" class="input" required="" name="email" value="" >
                                </div>
                                <%
                                        } else {
                                            %>
                                <div class="group">
                                    <label for="email" class="label">Email</label>
                                    <input id="email" type="email" class="input" required="" name="email" value="<%= loginUser.getEmail() %>" readonly="">
                                </div>
                                <%
                                        }
                                %>
                                <input type="text" name="roleID" readonly="" value="US" style="visibility: hidden">
                                <div class="group">
                                    <input type="submit" class="button" value="Add Information" name="action">
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <label><a href="cart.jsp">Back to your cart</a></label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

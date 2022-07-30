<%-- 
    Document   : create
    Created on : Mar 10, 2022, 4:30:09 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.shopping.ProductError"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/create_style.css" />
        <title>Add New Product Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
            }
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
        %>
        <%
            LocalDate localDate = LocalDate.now();
            LocalDate localDate1 = LocalDate.now().plusDays(1);
            DecimalFormat decimalFormat = new DecimalFormat("###.##");
        %>
        <div class="login-signup-wrap">
            <div class="login-wrap">
                <div class="login-html">
                    <input
                        id="tab-2"
                        type="radio"
                        name="tab"
                        class="sign-up"
                        checked
                        style="visibility: hidden"
                        /><label for="tab-2" class="tab">New Product Info</label>
                    <div class="login-form">
                        <form action="MainController" method="POST">
                            <%
                                ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                                if (productError == null) {
                                    productError = new ProductError();
                                }
                            %>
                            <div class="sign-up-htm">
                                <div class="half-input-wrap">
                                    <div class="half-input">

                                        <%
                                            if (productError.getProductID().length() > 10) {
                                        %>
                                        <div class="group">
                                            <label for="user" class="label">Product ID</label>
                                            <input
                                                id="user"
                                                type="text"
                                                class="input"
                                                required=""
                                                name="productID"
                                                value=""
                                                />
                                        </div>
                                        <p class="error"><%= productError.getProductID()%></p>
                                        <%
                                        } else {
                                        %>
                                        <div class="group">
                                            <label for="user" class="label">Product ID</label>
                                            <input
                                                id="user"
                                                type="text"
                                                class="input"
                                                required=""
                                                name="productID"
                                                value="<%= productError.getProductID()%>"
                                                />
                                        </div>
                                        <%
                                            }
                                        %>

                                        <%
                                            if (productError.getProductName().length() < 5 || productError.getProductName().length() > 40) {
                                        %>
                                        <div class="group">
                                            <label for="name" class="label">Product Name</label>
                                            <input
                                                id="name"
                                                type="text"
                                                class="input"
                                                required=""
                                                name="productName"
                                                value=""
                                                />
                                        </div>
                                        <p class="error"><%= productError.getProductName()%></p>
                                        <%
                                        } else {
                                        %>
                                        <div class="group">
                                            <label for="name" class="label">Product Name</label>
                                            <input
                                                id="name"
                                                type="text"
                                                class="input"
                                                required=""
                                                name="productName"
                                                value="<%= productError.getProductName()%>"
                                                />
                                        </div>
                                        <%
                                            }
                                        %>

                                        <div class="group">
                                            <label for="quantity" class="label">Quantity</label>
                                            <input
                                                id="quantity"
                                                type="number"
                                                class="input"
                                                required=""
                                                name="quantity"
                                                min="1" max="1000"
                                                value="<%= productError.getQuantity()%>"
                                                />
                                        </div>
                                        <div class="group">
                                            <label for="price" class="label">Price ($)</label>
                                            <input
                                                id="price"
                                                type="number"
                                                class="input"
                                                required=""
                                                name="price"
                                                min="1.00" max="100000.00" step="0.01"
                                                value="<%= decimalFormat.format(productError.getPrice())%>"
                                                />
                                        </div>
                                    </div>
                                    <div class="half-input">
                                        <div class="group">
                                            <label for="categoryID" class="label">Category ID</label>
                                            <select class="input input-select" 
                                                    id="categoryID"
                                                    required=""
                                                    name="categoryID"
                                                    value="<%= productError.getCategoryID()%>"
                                                    >
                                                <option value="RAU">RAU</option>
                                                <option value="CU">CU</option>
                                                <option value="QUA">QUA</option>
                                            </select>
                                        </div>
                                        <div class="group">
                                            <label for="image" class="label">Image link</label>
                                            <input
                                                id="image"
                                                type="text"
                                                class="input"
                                                required=""
                                                name="image"
                                                value="<%= productError.getImageLink()%>"
                                                />
                                        </div>
                                        <div class="group">
                                            <label for="importDate" class="label">Import Date</label>
                                            <input
                                                id="importDate"
                                                type="date"
                                                class="input"
                                                value="<%= localDate%>"
                                                readonly=""
                                                name="importDate"
                                                />
                                        </div>
                                        <div class="group">
                                            <label for="usingDate" class="label">Using Date</label>
                                            <input
                                                id="usingDate"
                                                type="date"
                                                class="input"
                                                min="<%= localDate1 %>"
                                                required=""
                                                value="<%= productError.getUsingDate() %>"
                                                name="usingDate"
                                                />
                                        </div>
                                    </div>
                                </div>
                                <div class="submit-btn-warp">
                                    <div class="group" style="width: 300px">
                                        <input
                                            type="submit"
                                            class="button"
                                            value="Add Product"
                                            name="action"
                                            />
                                    </div>
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <label for="tab-1"
                                           ><a href="MainController?action=Search&search=">Back to admin page</a>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

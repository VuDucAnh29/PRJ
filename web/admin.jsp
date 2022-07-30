<%-- 
    Document   : admin
    Created on : Mar 8, 2022, 1:59:13 PM
    Author     : Admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/9cabf0bd60.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/admin_style.css" />
        <title>Admin Page</title>
    </head>
    <body>
        <%
            String search = (String) request.getAttribute("SEARCH");
        %>
        <header>
            <div class="header">
                <div id="logo-name">
                    <img src="./img/mall1.png" alt="">
                    <h1>DA Mall</h1>
                </div>
                <div id="search-bar">
                    <form action="MainController" method="post">
                        <input type="text" name="search" class="input-bar" value="<%= search %>">
                        <button type="submit" name="action" value="Search" class="search-btn">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
                <div id="logout">
                    <form action="MainController" method="post">
                        <button type="submit" name="action" value="Log Out" class="logout-btn">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        </button>
                    </form>
                </div>
            </div>
        </header>
        <%
            LocalDate localDate = LocalDate.now();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
            }
            if (loginUser == null) {
                loginUser = new UserDTO();
            }

        %>
        <div id="container">
            <div>
                <h1 id="welcome">Welcome <%= loginUser.getFullName()%> </h1>
            </div>
            <div id="create-btn">
                <a href="MainController?action=Search&search="><button class="green-btn" style="margin-right: 8px;">Show All</button></a>
                <a href="create.jsp"><button class="green-btn">Add New Product</button></a>
            </div>
            <ul class="list">
                <%
                    List<Product> listProduct = (List) request.getAttribute("LIST_PRODUCT");
                    if (listProduct != null) {
                        if (listProduct.size() > 0) {
                            for (Product product : listProduct) {

                %>
                <li>
                    <div class="wrapper">
                        <div class="img-wrapper">
                            <img src="<%= product.getImageLink()%>"
                                 alt="">
                        </div>
                        <div class="info-wrapper">
                            <form action="MainController" method="POST">
                                <h2><input type="text" value="<%= product.getProductName()%>" name="productName" required=""></h2>

                                <table>
                                    <thead>
                                        <tr>
                                            <td><span class="author">Product ID</span></td>
                                            <td><span class="author">Import Date</span></td>
                                            <td><span class="author">Using Date</span></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <span class="author">
                                                    <input type="text" value="<%= product.getProductID()%>" readonly="" style="text-align: center" name="productID">
                                                </span>
                                            </td>
                                            <td><span class="date">
                                                    <input type="date" value="<%= product.getImportDate() %>" name="importDate" readonly="">
                                                </span>
                                            </td>
                                            <td><span class="date">
                                                    <input type="date" value="<%= product.getUsingDate()%>" name="usingDate" required="" min="<%= localDate %>">
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div>
                                    <p style="display: inline-block; font-size: 1.6rem;">Quantity: </p> 
                                    <input type="button" class="num-btn" value="−" disabled="">
                                    <input type="number" class="number-input" value="<%= product.getFullQuantity() %>" min="1" name="quantity">
                                    <input type="button" class="num-btn" value="+" disabled="">
                                    <p style="display: inline-block; font-size: 1.6rem;">Price: </p> 
                                    <input type="button" class="num-btn" value="−" disabled="">
                                    <input type="number" class="number-input" value="<%= product.getPrice() %>" min="0.00" max="100000.00" step="0.01" name="price" style="width: 90px">
                                    <input type="button" class="num-btn" value="+" disabled=""> <p style="display: inline-block; font-size: 1.6rem;">$</p>
                                </div>

                                <input type="submit" value="Update" class="edit-btn" name="action">
                                <input type="submit" value="Delete" class="edit-btn delete-btn" name="action">
                            </form>
                        </div>
                </li>
                <%
                            }
                        }
                    }
                %>
                
            </ul>
        </div>
    </body>
</html>

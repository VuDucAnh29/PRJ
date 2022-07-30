<%-- 
    Document   : shopping
    Created on : Mar 11, 2022, 10:59:43 PM
    Author     : Admin
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/9cabf0bd60.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/shopping_style.css" />
        <title>Shopping Page</title>
    </head>
    <body>
        <%
            String search = (String) request.getAttribute("SEARCH");
            if (search == null) {
                    search = "";
                }
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }

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
                        <button type="submit" name="action" value="View" class="cart-btn">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </button>
                    </form>
                    <form action="MainController" method="post">
                        <button type="submit" name="action" value="Log Out" class="logout-btn">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        </button>
                    </form>
                </div>
            </div>
        </header>
        <div id="container">
            <div>
                <h1 id="welcome">Welcome <%= loginUser.getFullName()%> to DA MALL</h1>
            </div>
            <div id="create-btn">
                <a href="MainController?action=Search&search="><button class="green-btn" style="margin-right: 8px;">Show All</button></a>
            </div>
            <%
                    String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <h1 style="color: green;"><%= message%></h1>
            <ul class="grid">
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
                                <h2><%= product.getProductName()%></h2>
                                <input type="text" name="productID" hidden value="<%= product.getProductID() %>">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td><span class="author">Import Date</span></td>
                                            <td>
                                                <span class="date">
                                                    <input type="date" value="<%= product.getImportDate()%>" name="usingDate" readonly="" disabled="">
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span class="author">Using Date</span></td>
                                            <td>
                                                <span class="date">
                                                    <input type="date" value="<%= product.getUsingDate()%>" name="usingDate" readonly="" disabled="">
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="height: 30px;">
                                    <p style="display: inline-block; font-size: 1.6rem;">Quantity: </p>
                                    <input type="number" class="number-input" value="1" min="1" step="1" max="<%= product.getFullQuantity() %>" name="quantity">
                                    <span class="author" style=" font-size: 1.6rem; ">(<%= product.getFullQuantity()%> left)</span>
                                </div>
                                <p style=" font-size: 1.6rem; ">Price : <%= product.getPrice()%> $ </p>
                                <button type="submit" name="action" value="Add To Cart" class="green-btn">
                                    <p style="display: inline-block;">Add to cart</p>
                                    <span style="margin-left: 5px;">
                                        <i class="fa-solid fa-cart-shopping"></i>
                                    </span>
                                </button>
                            </form>
                        </div>
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

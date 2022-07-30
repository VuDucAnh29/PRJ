<%-- 
    Document   : cart
    Created on : Mar 12, 2022, 9:40:37 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/9cabf0bd60.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/cart_style.css">
        <title>View Cart</title>
    </head>
    <body>
        <header>
            <div class="header">
                <div id="logo-name">
                    <a href="MainController?action=Search&search=">
                        <img src="./img/mall1.png" alt="">
                    </a>
                    <h1>DA Mall</h1>
                </div>
                <div id="search-bar">
                    <form action="MainController" method="post">
                        <input type="text" name="search" class="input-bar" placeholder="Search" disabled="">
                        <button type="submit" name="action" value="Search" class="search-btn" disabled="">
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

        <div id="container">
            <div>
                <%
                    String thank = (String) request.getAttribute("THANKS");
                    if (thank == null) {
                %>
                <h1 id="welcome">Viewing your cart </h1>
                <%
                } else {
                %>
                <h1 id="welcome" style="color: green"><%= thank%> </h1>
                <%
                    }
                %>

            </div>
            <div id="create-btn">
                <a href="MainController?action=Search&search=" ><button class="green-btn">Back to shopping page 
                        <i class="fa-solid fa-arrow-right"></i></button>
                </a>
            </div>
            <div>

                <ul class="list">
                    <%
                        DecimalFormat decimalFormat = new DecimalFormat("###.##");
                        Cart cart = (Cart) session.getAttribute("CART");
                        double totalInput = 0;
                        if (cart != null) {
                            if (cart.getCart().size() > 0) {
                    %>
                    <%
                        double total = 0;
                        for (Product product : cart.getCart().values()) {
                            total += product.getPrice() * product.getQuantity();
                            totalInput += product.getPrice() * product.getQuantity();
                    %>
                    <li>
                        <div class="wrapper">
                            <div class="img-wrapper">
                                <img
                                    src="<%= product.getImageLink()%>"
                                    alt="">
                            </div>
                            <div class="info-wrapper">
                                <form action="MainController" method="POST">
                                    <span class="author">#<%= product.getProductID()%></span>
                                    <h2><%= product.getProductName()%></h2>
                                    <input type="text" name="productID" hidden value="<%= product.getProductID()%>">
                                    <div>
                                        <p style="display: inline-block; font-size: 1.6rem;"> Price : <%= product.getPrice()%>$</p>
                                        <span style="display:inline-block; width: 30px;"></span>
                                        <p style="display: inline-block; font-size: 1.6rem;">Quantity: </p> 
                                        <input type="button" class="num-btn" value="−" disabled="">
                                        <input type="number" class="number-input" value="<%= product.getQuantity()%>" min="1" max="<%= product.getFullQuantity()%>" name="quantity">
                                        <input type="button" class="num-btn" value="+" disabled="">
                                    </div>
                                    <input type="submit" name="action" value="Edit" class="edit-btn">
                                    <input type="submit" name="action" value="Remove" class="edit-btn ">
                                </form>
                            </div>

                            <!-- <input type="submit" value="Delete" class="edit-btn delete-btn"> -->
                    </li>
                    <%
                        }
                    %>

                </ul>
                <br>

            </div>
            <div style="visibility: hidden;">
                <form>
                    <input type="submit" name="" class="green-btn ">
                </form>
            </div>
        </div>
        <div style="display: flex; justify-content: center;">
            <div>
                <h1 id="welcome" style="text-align: right; width: 1000px;"><%= decimalFormat.format(total)%>$</h1>
            </div>
        </div>
        <%
                }
            }
        %>

        <%--
            List<String> errorList = (List) session.getAttribute("ERROR_LIST");
            if (errorList != null) {
                if (errorList.size() > 0) {
        %>



        <%
                }
            }

        --%>



        <div id="checkout-btn" style="margin-bottom: 30px;">
            <form action="MainController" method="POST">
                <input type="number" name="total" value="<%= decimalFormat.format(totalInput)%>" hidden>
                <input type="submit" name="action" value="Check Out" class="green-btn">
            </form>
        </div>

    </body>
</html>

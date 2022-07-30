/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.order.Order;
import sample.order.OrderDao;
import sample.order.OrderDetail;
import sample.order.OrderDetailDao;
import sample.sendMail.SendMail;
import sample.shopping.Cart;
import sample.shopping.Product;
import sample.shopping.ProductDao;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "MainController?action=Search&search=";
    private static final String LOGIN = "login.jsp";
    private static final String ADD_INFO = "addInfo.jsp";
    private static final String SUCCESS = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }

            if (loginUser.getRoleID() == "") {
                url = LOGIN;
            } else {
                if (loginUser.getAddress() == "" || loginUser.getAddress() == null) {
                    url = ADD_INFO;
                } else {
                    if (loginUser.getUserID() == "") {
                        loginUser.setUserID(LocalDateTime.now().toString());
                    }

                    UserDAO userDao = new UserDAO();
                    ProductDao productDao = new ProductDao();
                    OrderDao orderDao = new OrderDao();
                    OrderDetailDao orderDetailDao = new OrderDetailDao();

                    float total = Float.parseFloat(request.getParameter("total"));

                    if (session != null) {
                        Cart cart = (Cart) session.getAttribute("CART");
                        if (cart != null) {

                            int checkQuantity = 0;

                            for (Product product : cart.getCart().values()) {
                                int fullQuantity = product.getFullQuantity();
                                if (product.getQuantity() > fullQuantity) {
                                    checkQuantity += 1;
                                }
                            }
                            if (checkQuantity == 0) {
                                boolean checkUser = userDao.checkUser(loginUser.getUserID());

                                if (!checkUser) {
                                    UserDTO user = new UserDTO();

                                    String userID = loginUser.getUserID();
                                    String fullName = loginUser.getFullName();
                                    String roleID = loginUser.getRoleID();
                                    String password = loginUser.getPassword();
                                    String address = loginUser.getAddress();
                                    String birthday = loginUser.getBirthday();
                                    String phone = loginUser.getPhone();
                                    String email = loginUser.getEmail();

                                    user = new UserDTO(userID, fullName, roleID, password, birthday, address, phone, email);
                                    userDao.createUser(user);
                                }

                                Order order = new Order(loginUser.getUserID(), total);
                                boolean checkOrder = orderDao.createOrder(order);
                                if (checkOrder) {
//                            int orderID = order.getOrderID(userID);
                                    for (Product product : cart.getCart().values()) {
                                        OrderDetail orderDetail = new OrderDetail(order.getOrderID(), product.getProductID(), product.getPrice(), product.getQuantity());
                                        orderDetailDao.createOrderDetail(orderDetail);
                                        int newQuantity = product.getFullQuantity() - product.getQuantity();
                                        productDao.updateQuantity(product.getProductID(), newQuantity);
                                    }
                                    url = SUCCESS;
                                    session.removeAttribute("CART");
                                    request.setAttribute("THANKS", "Thanks for buying our good! <3");
                                    SendMail sendMail = new SendMail( loginUser.getEmail());
                                    sendMail.sendMail();                                    
                                }

                            } else {
                                session.setAttribute("ERROR_QUANTITY", "Exceed storehouse's quantity");
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

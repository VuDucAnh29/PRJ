/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    private static final String ERROR = "signup.jsp";
    private static final String SUCCESS = "login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        boolean checkValidation = true;
        boolean checkDuplicate = true;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String birthday = request.getParameter("birthday");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            userError = new UserError(userID, fullName, roleID, password, confirm, birthday, address, phone, email);
            UserDAO dao = new UserDAO();
//            boolean checkDuplicate = dao.checkDuplicate(userID);
//            if (checkDuplicate) {
//                userError.setUserID("Duplicate!!!!!!");
//                checkValidation = false;
//            }
            checkDuplicate = dao.checkDuplicateUser(userID);
            if (checkDuplicate) {
                userError.setUserID("User ID is already exist");
                request.setAttribute("USER_ERROR", userError);
            }
            if (userID.length() < 3 || userID.length() > 10) {
                userError.setUserID("UserID must be from 3 and 10 words");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 40) {
                userError.setFullName("Full name must be from 5 and 40 words");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirm("Password and repeat password is not the same!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password, birthday, address, phone, email);
                boolean checkCreate = dao.createUser(user);
//                boolean checkCreate = dao.createUser(user);
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
                request.setAttribute("CHECK_DUPLICATE", checkDuplicate);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userError.setUserID("The User ID already exist!");
                request.setAttribute("USER_ERROR", userError);
            }
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

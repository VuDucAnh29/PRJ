/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.shopping.Product;
import sample.shopping.ProductDao;
import sample.shopping.ProductError;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "MainController?action=Search&search=";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError porductError = new ProductError();
        
        boolean checkValidation = true;
        boolean checkDuplicate = true;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            int fullQuantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));
            String categoryID = request.getParameter("categoryID");
            String image = request.getParameter("image");
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            porductError = new ProductError(productID, productName, categoryID, price, fullQuantity, image, importDate, usingDate);
            ProductDao dao = new ProductDao();
            
            checkDuplicate = dao.checkDuplicateProduct(productID);
            if (checkDuplicate) {
                porductError.setProductID("Product ID is already exist!");
                request.setAttribute("PRODUCT_ERROR", porductError);
            }
            if (productID.length() < 3 || productID.length() > 10) {
                porductError.setProductID("Product ID must be from 3 and 10 words!");
                checkValidation = false;
            }
            if (productName.length() < 5 || productName.length() > 40) {
                porductError.setProductName("Product name must be from 5 and 40 words!");
                checkValidation = false;
            }
            if (checkValidation) {
                Product product = new Product(productID, productName, categoryID, price, fullQuantity, 0, image, importDate, usingDate);
                boolean checkCreate = dao.createProduct(product);
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", porductError);
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

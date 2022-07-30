/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.shopping.Product;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDao {
    
    private static final String CREATE = "INSERT INTO tblOrder(orderID, orderDate, total, userID) VALUES(?,?,?,?)";
    
    public boolean createOrder(Order order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, order.getOrderID());
                ptm.setString(2, order.getOrderDate());
                ptm.setFloat(3, order.getTotal());
                ptm.setString(4, order.getUserID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}

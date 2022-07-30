/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDetailDao {
    
    private static final String CREATE = "INSERT INTO tblOrderDetail(detailID, price, quantity, orderID, productID) VALUES(?,?,?,?,?)";
    
    public boolean createOrderDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, orderDetail.getDetailID());
                ptm.setFloat(2, orderDetail.getPrice());
                ptm.setInt(3, orderDetail.getQuantity());
                ptm.setString(4, orderDetail.getOrderID());
                ptm.setString(5, orderDetail.getProductID());
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

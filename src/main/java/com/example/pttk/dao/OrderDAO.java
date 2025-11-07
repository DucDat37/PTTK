package com.example.pttk.dao;

import com.example.pttk.model.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DAO {

    public List<Order> getOrdersByCustomerAndDateRange(int idCustomer, String startDate, String endDate) {
        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT o.idOrder, o.orderDate, SUM(od.quantity * od.price) AS totalAmount " +
                        "FROM `Order` o " +
                        "JOIN OrderDetail od ON o.idOrder = od.idOrder " +
                        "JOIN Item i ON od.idItem = i.idItem " +
                        "WHERE o.idCustomer = ? " +
                        "AND o.orderDate BETWEEN ? AND ? " +
                        "GROUP BY o.idOrder, o.orderDate " +
                        "ORDER BY o.orderDate DESC";



        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idCustomer);
            ps.setString(2, startDate);
            ps.setString(3, endDate);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setIdOrder(rs.getInt("idOrder"));
                    order.setOrderDate(rs.getDate("orderDate"));
                    order.setTotalAmount(rs.getDouble("totalAmount"));
                    order.setIdCustomer(idCustomer);
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}

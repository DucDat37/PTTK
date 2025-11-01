package com.example.pttk.dao;

import com.example.pttk.model.CustomerStatistic;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerStatisticsDAO extends DAO {

    public CustomerStatisticsDAO() {
        super();
    }

    public List<CustomerStatistic> getTKKhachHang(String startDate, String endDate) {
        List<CustomerStatistic> list = new ArrayList<>();

        String sql =
                "SELECT " +
                        "    c.idMember AS idCustomer, " +
                        "    m.fullname AS customerName, " +
                        "    m.email, " +
                        "    m.phone, " +
                        "    SUM(od.quantity * i.price) AS totalRevenue " +
                        "FROM `Order` o " +
                        "    JOIN OrderDetail od ON o.idOrder = od.idOrder " +
                        "    JOIN Item i ON od.idItem = i.idItem " +
                        "    JOIN Customer c ON o.idCustomer = c.idMember " +
                        "    JOIN Member m ON c.idMember = m.idMember " +
                        "WHERE o.orderDate BETWEEN ? AND ? " +
                        "GROUP BY c.idMember, m.fullname, m.email, m.phone " +
                        "ORDER BY totalRevenue DESC;";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerStatistic cs = new CustomerStatistic();
                cs.setIdCustomer(rs.getInt("idCustomer"));
                cs.setCustomerName(rs.getString("customerName"));
                cs.setEmail(rs.getString("email"));
                cs.setPhone(rs.getString("phone"));
                cs.setTotalRevenue(rs.getFloat("totalRevenue"));
                list.add(cs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}

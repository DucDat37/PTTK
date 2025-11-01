package com.example.pttk.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    protected Connection conn;

    // Constructor: tự kết nối đến MySQL khi khởi tạo
    public DAO() {
        try {
            String url = "jdbc:mysql://localhost:3306/QLST";
            String user = "root";
            String password = "123456";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            System.out.println("✅ Kết nối database thành công!");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Không tìm thấy Driver MySQL!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Kết nối database thất bại!");
            e.printStackTrace();
        }
    }

    // Đóng kết nối khi không cần thiết
    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("🔒 Đã đóng kết nối database.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

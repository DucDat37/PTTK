package com.example.pttk.dao;

import com.example.pttk.model.Member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO extends DAO {

    public String createMember(Member member) {
        // Kiểm tra email đã tồn tại chưa
        String checkEmailSql = "SELECT * FROM member WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(checkEmailSql)) {
            ps.setString(1, member.getEmail());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "email_exists";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }

        // Kiểm tra số điện thoại đã tồn tại chưa
        String checkPhoneSql = "SELECT * FROM member WHERE phone = ?";
        try (PreparedStatement ps = conn.prepareStatement(checkPhoneSql)) {
            ps.setString(1, member.getPhone());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "phone_exists";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }

        // Thêm thành viên mới
        String sql = "INSERT INTO member (fullName, gender, dob, phone, email, address, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, member.getFullName());
            ps.setString(2, member.getGender());
            ps.setString(3, member.getDob());
            ps.setString(4, member.getPhone());
            ps.setString(5, member.getEmail());
            ps.setString(6, member.getAddress());
            ps.setString(7, member.getPassword());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                return "success";
            } else {
                return "error";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    }

    public Member checkLogin(Member member) {
        String sql = "SELECT * FROM member WHERE email = ? AND password = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, member.getEmail());
            ps.setString(2, member.getPassword());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Member m = new Member();
                m.setIdMember(rs.getInt("idMember"));
                m.setFullName(rs.getString("fullName"));
                m.setGender(rs.getString("gender"));
                m.setDob(rs.getString("dob"));
                m.setPhone(rs.getString("phone"));
                m.setEmail(rs.getString("email"));
                m.setAddress(rs.getString("address"));
                m.setPassword(rs.getString("password"));
                return m;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isManager(int idMember) {
        String sql = "SELECT * FROM manager WHERE idMember = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idMember);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Có dữ liệu => là quản lý
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



    // Lấy toàn bộ danh sách thành viên
    public List<Member> getAllMembers() {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM member";

        try (Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Member m = new Member();
                m.setFullName(rs.getString("fullName"));
                m.setGender(rs.getString("gender"));
                m.setDob(rs.getString("dob"));
                m.setPhone(rs.getString("phone"));
                m.setEmail(rs.getString("email"));
                m.setAddress(rs.getString("address"));
                m.setPassword(rs.getString("password"));
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}


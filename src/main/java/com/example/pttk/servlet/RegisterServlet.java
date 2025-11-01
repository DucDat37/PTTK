package com.example.pttk.servlet;

import com.example.pttk.dao.MemberDAO;
import com.example.pttk.model.Member;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private MemberDAO memberDAO = new MemberDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("Customer/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");
        String dob = req.getParameter("dob");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            req.setAttribute("message", "Mật khẩu xác nhận không khớp!");
            req.setAttribute("status", "error");
            req.getRequestDispatcher("Customer/register.jsp").forward(req, resp);
            return;
        }

        Member member = new Member(fullName, gender, dob, phone, email, address, password);
        String result = memberDAO.createMember(member);

        if ("success".equals(result)) {
            req.setAttribute("message", "Đăng ký thành công!");
            req.setAttribute("status", "success");
        } else if ("email_exists".equals(result)) {
            req.setAttribute("message", "Email này đã được sử dụng");
            req.setAttribute("status", "error");
        } else if ("phone_exists".equals(result)) {
            req.setAttribute("message", "Số điện thoại này đã được sử dụng");
            req.setAttribute("status", "error");
        } else {
            req.setAttribute("message", "Đăng ký thất bại! Vui lòng thử lại sau.");
            req.setAttribute("status", "error");
        }

        req.getRequestDispatcher("Customer/register.jsp").forward(req, resp);
    }
}

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
        req.getRequestDispatcher("register.jsp").forward(req, resp);
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
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        Member member = new Member(fullName, gender, dob, phone, email, address, password);
        boolean success = memberDAO.createMember(member);

        if (success) {
            req.setAttribute("message", "Đăng ký thành công!");
            req.setAttribute("status", "success");
        } else {
            req.setAttribute("message", "Đăng ký thất bại!");
            req.setAttribute("status", "error");
        }

        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }
}

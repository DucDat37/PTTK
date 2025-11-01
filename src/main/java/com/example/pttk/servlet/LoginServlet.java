package com.example.pttk.servlet;

import com.example.pttk.dao.MemberDAO;
import com.example.pttk.model.Member;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form đăng nhập
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        MemberDAO memberDAO = new MemberDAO();
        Member member = memberDAO.checkLogin(email, password);

        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", member);
            session.setAttribute("fullName", member.getFullName());

            // ✅ Kiểm tra xem có phải quản lý không
            boolean isManager = memberDAO.isManager(member.getIdMember());

            if (isManager) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/gdChinhQL.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("Customer/home.jsp");
                dispatcher.forward(request, response);
            }

        } else {
            // Sai tài khoản hoặc mật khẩu
            request.setAttribute("errorMessage", "Sai email hoặc mật khẩu!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Customer/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}




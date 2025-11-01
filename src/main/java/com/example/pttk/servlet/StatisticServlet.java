package com.example.pttk.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/StatisticServlet")
public class StatisticServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Chuyển hướng sang giao diện chọn thống kê
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/gdChonTK.jsp");
        dispatcher.forward(request, response);
    }
}

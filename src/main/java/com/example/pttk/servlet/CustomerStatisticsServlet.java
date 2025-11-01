package com.example.pttk.servlet;

import com.example.pttk.dao.CustomerStatisticsDAO;
import com.example.pttk.model.CustomerStatistic;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CustomerStatisticsServlet")
public class CustomerStatisticsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // Chỉ xử lý nếu chọn đúng loại "customer_revenue"
        if ("customer_revenue".equals(type)
                || (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty())) {
            CustomerStatisticsDAO dao = new CustomerStatisticsDAO();
            List<CustomerStatistic> stats = dao.getTKKhachHang(startDate, endDate);

            request.setAttribute("stats", stats);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);

            RequestDispatcher rd = request.getRequestDispatcher("Admin/gdThongkeKH.jsp");
            rd.forward(request, response);
        }
        else {
            startDate = request.getParameter("startDate");
            endDate = request.getParameter("endDate");
            response.sendRedirect(request.getContextPath() + "/CustomerStatisticsServlet?startDate="
                    + (startDate != null ? startDate : "")
                    + "&endDate=" + (endDate != null ? endDate : ""));
        }

    }
}

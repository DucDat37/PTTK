package com.example.pttk.servlet;

import com.example.pttk.dao.OrderDAO;
import com.example.pttk.model.Order;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idCustomerStr = request.getParameter("idCustomer");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (idCustomerStr != null && startDate != null && endDate != null) {
            int idCustomer = Integer.parseInt(idCustomerStr);
            List<Order> orders = orderDAO.getOrdersByCustomer(idCustomer, startDate, endDate);

            request.setAttribute("orders", orders);
            request.setAttribute("idCustomer", idCustomer);
            request.setAttribute("customerName", customerName);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/gdGiaodichKH.jsp");
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

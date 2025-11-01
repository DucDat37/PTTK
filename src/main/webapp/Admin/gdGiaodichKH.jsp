<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, com.example.pttk.model.Order" %>

<%
    List<Order> listOrder = (List<Order>) request.getAttribute("orders");
    String startDate = (String) request.getAttribute("startDate");
    String endDate = (String) request.getAttribute("endDate");
    String customerName = (String) request.getAttribute("customerName");
    String email = (String) request.getAttribute("email");
    String phone = (String) request.getAttribute("phone");
    int idCustomer = (int) request.getAttribute("idCustomer");

    double totalRevenue = 0;
    if (listOrder != null) {
        for (Order o : listOrder) {
            totalRevenue += o.getTotalAmount();
        }
    }
    
    // Format dates
    String formattedStartDate = startDate;
    String formattedEndDate = endDate;
    java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
    try {
        java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.text.SimpleDateFormat outputFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");
        if (startDate != null && !startDate.isEmpty()) {
            formattedStartDate = outputFormat.format(inputFormat.parse(startDate));
        }
        if (endDate != null && !endDate.isEmpty()) {
            formattedEndDate = outputFormat.format(inputFormat.parse(endDate));
        }
    } catch (Exception e) {
        // Keep original format if parsing fails
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết giao dịch khách hàng</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/admin-panel.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<header class="text-white py-4 text-center text-xl font-bold shadow-md" style="background-color: #35c5e2;">
    <iconify-icon icon="mdi:chart-bar"></iconify-icon> Thống kê khách hàng theo doanh thu
</header>

<main class="flex-1 p-8">
    <div class="max-w-5xl mx-auto bg-white rounded-2xl shadow-lg p-8">
        <h2 class="text-2xl font-bold text-center mb-6 text-gray-700">Chi tiết giao dịch khách hàng</h2>
        <!-- Thông tin khách hàng -->
        <div class="mb-6 border-b pb-4">
            <h2 class="text-xl font-semibold mb-2" style="color: #35c5e2;">Thông tin khách hàng</h2>
            <p><strong>Mã KH:</strong> <%= idCustomer %></p>
            <p><strong>Tên KH:</strong> <%= customerName %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Số điện thoại:</strong> <%= phone %></p>
        </div>

        <!-- Thông tin thời gian -->
        <div class="text-center mb-6">
            <p class="text-gray-700 text-lg">
                Thời gian thống kê:
                <span class="font-semibold" style="color: #35c5e2;"><%= formattedStartDate %></span> đến
                <span class="font-semibold" style="color: #35c5e2;"><%= formattedEndDate %></span>
            </p>
        </div>

        <!-- Bảng đơn hàng -->
        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-300 rounded-lg overflow-hidden">
                <thead class="text-white" style="background-color: #35c5e2;">
                <tr>
                    <th class="px-4 py-2 border">Mã đơn hàng</th>
                    <th class="px-4 py-2 border">Ngày đặt</th>
                    <th class="px-4 py-2 border text-right">Tổng tiền (₫)</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (listOrder != null && !listOrder.isEmpty()) {
                        for (Order o : listOrder) {
                %>
                <tr class="hover:bg-gray-100 text-gray-700">
                    <td class="border px-4 py-2 text-center"><%= o.getIdOrder() %></td>
                    <td class="border px-4 py-2 text-center"><%= dateFormatter.format(o.getOrderDate()) %></td>
                    <td class="border px-4 py-2 text-right text-black-600 font-bold">
                        <%= String.format("%,.0f", o.getTotalAmount()) %>₫
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="3" class="text-center py-4 text-gray-500">
                        Không có giao dịch nào trong thời gian này.
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <!-- Tổng doanh thu -->
        <div class="mt-6 text-right">
            <p class="text-lg font-bold text-gray-800">
                Tổng doanh thu trong thời gian này:
                <span class="text-green-600"><%= String.format("%,.0f", totalRevenue) %>₫</span>
            </p>
        </div>

        <!-- Nút trở lại -->
        <div class="text-center mt-8">
            <a href="${pageContext.request.contextPath}/CustomerStatisticsServlet?startDate=<%= startDate %>&endDate=<%= endDate %>"
               class="inline-flex items-center gap-2 text-white bg-[#35c5e2] hover:bg-[#1E93AB] px-6 py-2 rounded-full font-medium transition">
                <iconify-icon icon="ant-design:arrow-left-outlined" width="18"></iconify-icon>
                <span>Trở lại thống kê khách hàng</span>
            </a>
        </div>
        
    </div>
</main>

<footer class="bg-gray-800 text-white text-center py-3 mt-8">
    © 2025 - Nhóm QLST | Quản lý siêu thị điện máy
</footer>

</body>
</html>

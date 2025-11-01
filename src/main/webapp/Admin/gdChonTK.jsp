<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String userName = (userSession != null && userSession.getAttribute("fullName") != null)
            ? (String) userSession.getAttribute("fullName")
            : "Quản lý";
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chọn loại thống kê</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/admin-panel.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>

</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<header class="text-white py-4 px-6 flex justify-between items-center shadow" style="background-color: #35c5e2;">
    <h1 class="text-xl font-bold"><iconify-icon icon="mdi:chart-bar"></iconify-icon> XEM BÁO CÁO - HỆ THỐNG QUẢN LÝ SIÊU THỊ</h1>
    <div>
        <span>Xin chào, <b><%= userName %></b></span>
        <a href="<%= request.getContextPath() %>/LogoutServlet"  class="ml-4 bg-[#468A9A] hover:bg-[#1E93AB] px-4 py-2 rounded-full text-white">Đăng xuất</a>
    </div>
</header>

<main class="flex-1 flex flex-col items-center justify-center p-8">
    <div class="bg-white p-8 rounded-2xl shadow-lg w-full max-w-xl">
        <h2 class="text-2xl font-bold text-center mb-6 text-gray-700">Chọn loại thống kê</h2>

        <form action="${pageContext.request.contextPath}/CustomerStatisticsServlet" method="get" class="space-y-6">


        <div>
                <label class="block mb-2 text-gray-600 font-medium">Loại thống kê</label>
                <select name="type" class="w-full border rounded-lg p-2 focus:outline-none focus:ring-2" style="focus:ring-color: #4ED7F1;">
                    <option value="customer_revenue">Thống kê KH theo doanh thu</option>
                    <option value="product_revenue">Thống kê sản phẩm bán chạy</option>
                    <option value="supplier_revenue">Thống kê nhà cung cấp</option>
                </select>
            </div>

            <div>
                <label class="block mb-2 text-gray-600 font-medium">Thời gian bắt đầu</label>
                <input type="date" name="startDate" required
                       class="w-full border rounded-lg p-2 focus:outline-none focus:ring-2" style="focus:ring-color: #4ED7F1;">
            </div>

            <div>
                <label class="block mb-2 text-gray-600 font-medium">Thời gian kết thúc</label>
                <input type="date" name="endDate" required
                       class="w-full border rounded-lg p-2 focus:outline-none focus:ring-2" style="focus:ring-color: #4ED7F1;">
            </div>

            <div class="text-center">
                <button type="submit"
                        class="inline-flex items-center bg-[#468A9A] hover:bg-[#1E93AB] text-white px-6 py-2 rounded-full font-semibold space-x-2">
                    <iconify-icon icon="ant-design:bar-chart-outlined" width="20"></iconify-icon>
                    <span>Xem thống kê</span>
                </button>
            
                <a href="${pageContext.request.contextPath}/Admin/gdChinhQL.jsp"
                   class="inline-flex items-center ml-4 px-4 py-2 bg-[#35c5e2] hover:bg-[#1E93AB] text-white font-medium rounded-full shadow transition space-x-2">
                    <iconify-icon icon="ant-design:arrow-left-outlined" width="20"></iconify-icon>
                    <span>Trở lại</span>
                </a>
            </div>
            

        </form>
    </div>
</main>

<footer class="bg-gray-800 text-white text-center py-3">
    © 2025 - Nhóm QLST | Quản lý siêu thị điện máy
</footer>

</body>
</html>

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
    <title>Quản lý siêu thị</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/admin-panel.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>

</head>
<body class="bg-gray-100 flex">

<!-- Sidebar -->
<aside class="w-64 bg-white h-screen shadow-lg flex flex-col">
    <div class="p-6 border-b">
        <h1 class="text-2xl font-bold" style="color: #35c5e2;">Admin Dashboard</h1>
    </div>

    <div class="p-4 flex items-center space-x-3 border-b">
        <img src="https://i.pinimg.com/736x/1d/06/fb/1d06fb70b75dfd2928e69ce729aa7a41.jpg" class="rounded-full w-10 h-10">
        <div>
            <p class="font-semibold"><%= userName %></p>
            <p class="text-sm text-gray-500">Quản lý siêu thị</p>
        </div>
    </div>

    <nav class="flex-1 p-4 space-y-2">
        <a href="#" class="flex items-center space-x-2 p-2 rounded-lg font-semibold" style="color: #35c5e2; background-color: rgba(78, 215, 241, 0.1);">
            <iconify-icon icon="ant-design:home-outlined"></iconify-icon><span>Dashboard</span>
        </a>

        <a href="<%= request.getContextPath() %>/StatisticServlet" class="flex items-center space-x-2 hover:bg-gray-100 p-2 rounded-lg">
            <iconify-icon icon="ant-design:file-outlined"></iconify-icon><span>Xem báo cáo</span>
        </a>
    </nav>

    <div class="p-4 border-t">
        <a href="<%= request.getContextPath() %>/LogoutServlet" 
            class="block text-center bg-[#34c5e2] hover:bg-[#6FE6FC] text-white py-2 rounded-full">
             Đăng xuất
         </a>
         
    </div>
</aside>

<!-- Main content -->
<main class="flex-1 p-8">
    <header class="flex justify-between items-center mb-6">
        <h2 class="text-3xl font-bold text-gray-700">Dashboard</h2>
    </header>

</main>
</body>
</html>

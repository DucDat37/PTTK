<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, com.example.pttk.model.CustomerStatistic" %>

<%
    List<CustomerStatistic> listCustomerStatistic = (List<CustomerStatistic>) request.getAttribute("stats");
    String startDate = (String) request.getAttribute("startDate");
    String endDate = (String) request.getAttribute("endDate");

    double totalAll = 0;
    if (listCustomerStatistic != null) {
        for (CustomerStatistic c : listCustomerStatistic) {
            totalAll += c.getTotalRevenue();
        }
    }
    
    // Format dates
    String formattedStartDate = startDate;
    String formattedEndDate = endDate;
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
    <title>Thống kê khách hàng theo doanh thu</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/admin-panel.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
</head>

<body class="bg-gray-100 min-h-screen flex flex-col">

<header class="text-white py-4 text-center text-xl font-bold shadow-md" style="background-color: #35c5e2;">
    <iconify-icon icon="mdi:chart-bar"></iconify-icon> Thống kê khách hàng theo doanh thu
</header>

<main class="flex-1 p-8">
    <div class="max-w-6xl mx-auto bg-white rounded-2xl shadow-lg p-8">

        <!-- Thông tin thời gian -->
        <div class="text-center mb-6">
            <p class="text-lg text-gray-600">
                Thời gian thống kê:
                <span class="font-semibold" style="color: #35c5e2;"><%= formattedStartDate %></span>
                đến
                <span class="font-semibold" style="color: #35c5e2;"><%= formattedEndDate %></span>
            </p>
        </div>

        <!-- Bảng thống kê -->
        <div class="overflow-x-auto">
            <table id="tableData" class="min-w-full border border-gray-300 rounded-lg overflow-hidden">
                <thead class="text-white" style="background-color: #35c5e2;">
                <tr>
                    <th class="px-4 py-2 border">Mã KH</th>
                    <th class="px-4 py-2 border">Tên khách hàng</th>
                    <th class="px-4 py-2 border">Email</th>
                    <th class="px-4 py-2 border">Số điện thoại</th>
                    <th class="px-4 py-2 border text-right">Tổng doanh thu</th>
                    <th class="px-4 py-2 border text-center">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (listCustomerStatistic != null && !listCustomerStatistic.isEmpty()) {
                        for (CustomerStatistic c : listCustomerStatistic) {
                %>
                <tr class="hover:bg-gray-100 text-gray-700">
                    <td class="border px-4 py-2 text-center"><%= c.getIdCustomer() %></td>
                    <td class="border px-4 py-2"><%= c.getCustomerName() %></td>
                    <td class="border px-4 py-2"><%= c.getEmail() %></td>
                    <td class="border px-4 py-2 text-center"><%= c.getPhone() %></td>
                    <td class="border px-4 py-2 text-right text-black-600 font-bold">
                        <%= String.format("%,.0f", c.getTotalRevenue()) %>₫
                    </td>
                    <td class="border px-4 py-2 text-center">
                        <form action="OrderServlet" method="get">
                            <input type="hidden" name="idCustomer" value="<%= c.getIdCustomer() %>">
                            <input type="hidden" name="customerName" value="<%= c.getCustomerName() %>">
                            <input type="hidden" name="email" value="<%= c.getEmail() %>">
                            <input type="hidden" name="phone" value="<%= c.getPhone() %>">
                            <input type="hidden" name="startDate" value="<%= startDate %>">
                            <input type="hidden" name="endDate" value="<%= endDate %>">
                            <button type="submit"
                             class="inline-flex items-center justify-center bg-[#35c5e2] hover:bg-[#1E93AB] text-white px-4 py-2 rounded-full text-sm font-medium transition">
                                <iconify-icon icon="ant-design:search-outlined" width="20"></iconify-icon>
                                <span>Xem chi tiết</span>
                            </button>

                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center py-4 text-gray-500">
                        Không có dữ liệu thống kê trong khoảng thời gian này.
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <!-- Phân trang -->
        <div id="pagination" class="flex justify-center mt-4 space-x-2"></div>

        <!-- Tổng doanh thu -->
        <div class="mt-6 text-right pr-4">
            <p class="text-lg font-bold text-gray-800">
                Tổng doanh thu tất cả khách hàng:
                <span class="text-green-600"><%= String.format("%,.0f", totalAll) %>₫</span>
            </p>
        </div>

        <!-- Nút điều hướng -->
        <div class="text-center mt-8">
            <a href="${pageContext.request.contextPath}/Admin/gdChonTK.jsp"
               class="inline-flex items-center justify-center text-white bg-[#35c5e2] px-6 py-2 rounded-full font-medium transition hover:bg-[#1E93AB] space-x-2">
                <iconify-icon icon="ant-design:arrow-left-outlined" width="20"></iconify-icon>
                <span>Trở lại</span>
            </a>
        </div>
        
    </div>
</main>

<footer class="bg-gray-800 text-white text-center py-3 mt-8">
    © 2025 - Nhóm QLST | Quản lý siêu thị điện máy
</footer>

<script>
    const rowsPerPage = 5;
    const table = document.querySelector("#tableData tbody");
    const rows = Array.from(table.querySelectorAll("tr"));
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    const pagination = document.getElementById("pagination");

    function showPage(page) {
        rows.forEach((row, i) => {
            row.style.display = (i >= (page - 1) * rowsPerPage && i < page * rowsPerPage) ? "" : "none";
        });
      
        document.querySelectorAll('#pagination button').forEach(btn => {
            btn.classList.remove('text-white');
            btn.style.backgroundColor = '';
            btn.classList.add('bg-gray-200', 'text-gray-800');
            btn.style.color = 'gray-800';
        });
        const activeBtn = document.getElementById('page-' + page);
        activeBtn.style.color = 'white';
        activeBtn.style.backgroundColor = '#35c5e2';
    }

    if (totalPages > 1) {
        for (let i = 1; i <= totalPages; i++) {
            const btn = document.createElement("button");
            btn.textContent = i;
            btn.id = "page-" + i;
            btn.className = "px-3 py-1 rounded bg-gray-200";
            btn.style.hoverBackgroundColor = '#1E93AB';
            btn.onclick = () => showPage(i);
            pagination.appendChild(btn);
        }
    }
    showPage(1);
</script>

</body>
</html>

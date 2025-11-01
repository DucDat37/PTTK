<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String userName = (userSession != null && userSession.getAttribute("fullName") != null)
            ? (String) userSession.getAttribute("fullName")
            : "Khách hàng";
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Điện Máy Online - Trang chủ</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/add-to-cart.png">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 flex flex-col min-h-screen">

<!-- HEADER -->
<header class="bg-blue-700 text-white px-8 py-4 flex justify-between items-center shadow-md">
    <h1 class="text-2xl font-bold">⚡ Điện Máy Online</h1>
    <nav class="flex items-center space-x-6">
        <a href="${pageContext.request.contextPath}/Customer/home.jsp" class="hover:text-yellow-300">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/product.jsp" class="hover:text-yellow-300">Sản phẩm</a>
        <a href="${pageContext.request.contextPath}/about.jsp" class="hover:text-yellow-300">Giới thiệu</a>
        <a href="${pageContext.request.contextPath}/contact.jsp" class="hover:text-yellow-300">Liên hệ</a>
        <span class="border-l border-white pl-4">Xin chào, <b><%= userName %></b></span>
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="ml-4 bg-red-500 hover:bg-red-600 px-3 py-1 rounded">Đăng xuất</a>
    </nav>
</header>

<!-- BANNER -->
<section class="relative bg-cover bg-center h-72" style="background-image: url('https://cdn.tgdd.vn/2023/12/banner/banner-dienmayxanh-800-300.jpg');">
    <div class="absolute inset-0 bg-black bg-opacity-40 flex flex-col items-center justify-center text-white text-center">
        <h2 class="text-3xl font-bold mb-2">Mua sắm đồ điện máy chính hãng</h2>
        <p class="text-lg mb-4">Giảm giá sốc lên tới 50% cho khách hàng thân thiết!</p>
        <a href="product.jsp" class="bg-yellow-400 hover:bg-yellow-500 text-black font-semibold px-5 py-2 rounded-lg shadow">Mua ngay</a>
    </div>
</section>

<!-- DANH MỤC -->
<section class="py-10 px-8">
    <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">Danh mục sản phẩm</h2>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <div class="bg-white p-6 rounded-lg shadow hover:shadow-xl text-center cursor-pointer hover:bg-blue-50 transition">
            🖥️ <p class="mt-2 font-semibold">Tivi - Màn hình</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow hover:shadow-xl text-center cursor-pointer hover:bg-blue-50 transition">
            ❄️ <p class="mt-2 font-semibold">Tủ lạnh - Máy lạnh</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow hover:shadow-xl text-center cursor-pointer hover:bg-blue-50 transition">
            🍳 <p class="mt-2 font-semibold">Gia dụng nhà bếp</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow hover:shadow-xl text-center cursor-pointer hover:bg-blue-50 transition">
            📱 <p class="mt-2 font-semibold">Điện thoại - Phụ kiện</p>
        </div>
    </div>
</section>

<section class="py-10 px-8 bg-gray-100 flex-1">
    <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">Sản phẩm nổi bật</h2>

    <div class="grid grid-cols-2 md:grid-cols-4 gap-8">

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.002852_DESKTOP_112323.jpg"
                 alt="Tivi Samsung Crystal UHD" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi Samsung Crystal UHD 4K 55 inch</h3>
            <p class="text-red-500 font-bold mb-2">11.990.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.003760_DESKTOP_166722.jpg"
                 alt="Tivi LG Nanocell" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi LG Nanocell 4K 50 inch</h3>
            <p class="text-red-500 font-bold mb-2">14.590.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.003769_DESKTOP_168742.jpg"
                 alt="Tivi Sony Bravia" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi Sony Bravia 4K 55 inch</h3>
            <p class="text-red-500 font-bold mb-2">17.990.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.003770_DESKTOP_168735.jpg"
                 alt="Tivi TCL QLED" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi TCL QLED 55 inch 4K</h3>
            <p class="text-red-500 font-bold mb-2">10.990.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.003257_DESKTOP_126770.jpg"
                 alt="Tivi Panasonic 4K" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi Panasonic 4K 43 inch</h3>
            <p class="text-red-500 font-bold mb-2">9.490.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.002714_DESKTOP_106904.jpg"
                 alt="Tivi Sharp Full HD" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi Sharp Full HD 43 inch</h3>
            <p class="text-red-500 font-bold mb-2">6.990.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.003559_DESKTOP_143012.jpg"
                 alt="Tivi Casper UHD" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi Casper UHD 50 inch</h3>
            <p class="text-red-500 font-bold mb-2">8.990.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

        <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition hover:scale-105">
            <img src="https://hc.com.vn/i/ecommerce/media/AV.003648_DESKTOP_172031.png"
                 alt="Tivi Samsung QLED" class="rounded-lg mb-3">
            <h3 class="text-gray-800 font-semibold mb-1">Tivi Samsung QLED 4K 65 inch</h3>
            <p class="text-red-500 font-bold mb-2">23.490.000₫</p>
            <button class="bg-blue-600 hover:bg-blue-700 text-white w-full py-2 rounded">Thêm vào giỏ</button>
        </div>

    </div>
</section>


<!-- FOOTER -->
<footer class="bg-blue-800 text-white text-center py-4 mt-10">
    © 2025 - Điện Máy Online | Liên hệ: 1800-6868 | Email: support@dienmay.vn
</footer>

</body>
</html>


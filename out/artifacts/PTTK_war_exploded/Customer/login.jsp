<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/add-to-cart.png">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex">

<!-- Khối bên trái: ảnh nền + chào mừng -->
<div class="hidden md:flex w-3/5 text-white flex-col justify-center items-start relative overflow-hidden pl-20"
     style="background-image: url('${pageContext.request.contextPath}/assets/images/login-bg.png');
             background-size: cover;
             background-position: center;">

    <!-- (nếu muốn ảnh rõ hoàn toàn thì xoá dòng dưới đi) -->
    <div class="absolute inset-0 bg-black/20"></div>

    <div class="z-10 max-w-lg">
        <h1 class="text-6xl font-extrabold mb-4 drop-shadow-lg text-white leading-tight">
            CHÀO MỪNG TRỞ LẠI
        </h1>
        <p class="text-2xl font-semibold mb-6 text-white">Rất vui được gặp lại bạn!</p>
        <p class="text-base leading-relaxed text-gray-100">
            Hãy đăng nhập để tiếp tục hành trình mua sắm và khám phá các sản phẩm tuyệt vời cùng chúng tôi.
        </p>
    </div>
</div>

<!-- Khối bên phải: form đăng nhập -->
<div class="flex w-full md:w-2/5 justify-center items-center bg-white shadow-2xl">
    <div class="w-4/5 max-w-md bg-white p-8 rounded-2xl shadow-2xl">
        <h2 class="text-2xl font-bold text-blue-600 text-center mb-6">Đăng nhập tài khoản</h2>
        <p class="text-gray-500 text-center mb-8 text-sm">
            Vui lòng đăng nhập để tiếp tục mua sắm cùng chúng tôi.
        </p>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post" class="space-y-4">
            <input type="text" name="email" placeholder="Email"
                   class="w-full px-4 py-3 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <input type="password" name="password" placeholder="Mật khẩu"
                   class="w-full px-4 py-3 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <div class="flex items-center justify-between text-sm text-gray-600">
                <label class="flex items-center space-x-2">
                    <input type="checkbox" class="accent-blue-500">
                    <span>Giữ tôi đăng nhập</span>
                </label>
                <a href="#" class="text-blue-600 hover:underline">Quên mật khẩu?</a>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 text-white py-3 rounded-full shadow-md hover:bg-blue-700 transition font-semibold">
                Đăng nhập
            </button>
        </form>

        <p class="text-center text-sm text-gray-600 mt-6">
            Chưa có tài khoản?
            <a href="${pageContext.request.contextPath}/RegisterServlet" class="text-blue-600 font-medium hover:underline">Đăng ký ngay</a>
        </p>
    </div>
</div>

</body>
</html>


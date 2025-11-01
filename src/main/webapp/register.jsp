<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký thành viên</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/add-to-cart.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        window.onload = function () {
            const status = "<%= request.getAttribute("status") %>";
            const message = "<%= request.getAttribute("message") %>";
            if (message && message !== "null") {
                const popup = document.getElementById("popupMessage");
                const popupText = document.getElementById("popupText");
                popupText.innerText = message;
                popup.classList.remove("hidden");

                if (status === "success") {
                    setTimeout(() => {
                        popup.classList.add("hidden");
                        window.location.href = "login.jsp";
                    }, 2000);
                } else {
                    setTimeout(() => {
                        popup.classList.add("hidden");
                    }, 2000);
                }
            }
        }
    </script>
</head>
<body class="min-h-screen flex">

<!-- Bên trái: ảnh nền xanh -->
<div class="hidden md:flex w-3/5 text-white flex-col justify-center items-start pl-20 relative overflow-hidden"
     style="background-image: url('${pageContext.request.contextPath}/assets/images/login-bg.png');
             background-size: cover;
             background-position: center;">
    <div class="absolute inset-0 bg-black/30"></div>
    <div class="z-10 max-w-lg">
        <h1 class="text-5xl font-bold mb-4 text-white">TẠO TÀI KHOẢN MỚI</h1>
        <p class="text-lg mb-4">Gia nhập cộng đồng của chúng tôi ngay hôm nay!</p>
        <p class="text-sm text-gray-100 leading-relaxed">
            Cùng khám phá hàng ngàn sản phẩm chất lượng, nhận ưu đãi hấp dẫn và trải nghiệm mua sắm tuyệt vời.
        </p>
    </div>
</div>

<!-- Bên phải: form đăng ký -->
<div class="flex w-full md:w-2/5 justify-center items-center bg-white shadow-2xl">
    <div class="w-4/5 max-w-md bg-white p-8 rounded-2xl shadow-2xl">
        <h2 class="text-2xl font-bold text-blue-600 text-center mb-6">Điền thông tin thành viên</h2>

        <form action="RegisterServlet" method="post" class="space-y-4">
            <input type="text" name="fullName" placeholder="Họ tên"
                   class="w-full px-4 py-1.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <!-- Giới tính -->
            <div>
                <label class="block mb-2 font-medium">Giới tính:</label>
                <div class="flex space-x-6">
                    <label class="flex items-center">
                        <input type="radio" name="gender" value="Nam" class="mr-2 accent-blue-500"> Nam
                    </label>
                    <label class="flex items-center">
                        <input type="radio" name="gender" value="Nữ" class="mr-2 accent-blue-500"> Nữ
                    </label>
                </div>
            </div>

            <!-- Ngày sinh -->
            <div>
                <label class="block mb-2 font-medium">Ngày sinh:</label>
                <input type="date" name="dob"
                       class="w-full px-4 py-2.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>
            </div>

            <input type="text" name="phone" placeholder="Số điện thoại"
                   class="w-full px-4 py-2.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <input type="email" name="email" placeholder="Email"
                   class="w-full px-4 py-2.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <input type="text" name="address" placeholder="Địa chỉ"
                   class="w-full px-4 py-2.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <input type="password" name="password" placeholder="Mật khẩu"
                   class="w-full px-4 py-2.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu"
                   class="w-full px-4 py-2.5 border rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>

            <button type="submit"
                    class="w-full bg-blue-600 text-white py-1.5 rounded-full shadow-md hover:bg-blue-700 transition font-semibold">
                Đăng ký
            </button>
        </form>

        <p class="text-center text-sm text-gray-600 mt-6">
            Đã có tài khoản?
            <a href="login.jsp" class="text-blue-600 font-medium hover:underline">Đăng nhập</a>
        </p>
    </div>
</div>

<!-- Popup -->
<div id="popupMessage" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-40 z-50">
    <div class="bg-white px-8 py-6 rounded-xl shadow-2xl text-center w-[360px] animate-fadeIn">
        <p id="popupText" class="text-lg font-semibold text-gray-800 mb-4"></p>
        <button onclick="document.getElementById('popupMessage').classList.add('hidden')"
                class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg">
            Đóng
        </button>
    </div>
</div>

<style>
    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }
    .animate-fadeIn {
        animation: fadeIn 0.3s ease-out;
    }
</style>

</body>
</html>

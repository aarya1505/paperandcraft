<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj != null && sessionObj.getAttribute("users") != null) {
        response.sendRedirect("home.jsp");  // Redirect logged-in users
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | Paper & Craft</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F9EAE1;
            color: #333;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #333;
            padding: 10px;
            text-align: right;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: inline-block;
        }

        nav a:hover {
            background-color: #575757;
        }

        img {
            max-width: 400px;
            height: auto;
            margin: 10px 80px 20px 20px;
        }

        .register-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 10px 50px;
            background-color: #7D4F50;
            border-radius: 8px;
            box-shadow: 0 0 10px white;
            color: white;
        }

        .register-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: black;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #000000;
        }

        #copyright {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
    </style>

    <script>
        // Password confirmation validation
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <center>
        <img src="images/name.jpeg" alt="Paper & Craft Logo">
    </center>

    <nav>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Signup</a>
    </nav>

    <div class="register-container">
        <h2>Register</h2>

        <form method="POST" action="RegisterServlet" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" placeholder="1234567890" required>
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <select id="role" name="role" required>
                    <option value="Customer">Customer</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" minlength="6" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <button type="submit">Register</button>
        </form>
    </div>

    <div id="copyright">
        <p>&copy; 2025 Paper & Craft. All rights reserved.</p>
    </div>
</body>
</html>

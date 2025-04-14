<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj != null && sessionObj.getAttribute("users") != null) {
        response.sendRedirect("home.jsp");
    }
    %>
<html>
    <head>
    <title>Login | Paper & Craft</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F9EAE1;
            color: #333;
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

        img {
            max-width: 400px;
            height: auto;
            margin: 10px 80px 20px 20px;
        }
        
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #7D4F50;
            border-radius: 8px;
            box-shadow: 0 0 10px white;
        }

        .login-container h2 {
            text-align: center;
            color: white;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            font-color : white;
        }

        input[type="email"], input[type="password"] {
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
            
        #copyright {
            text-align: center;
            padding: 20px 0;
            background-color: #333;
            color: #fff;
            font-size: 16px;
        }
            
        </style>
</head>
<body>
    <center>
        <img src="images/name.jpeg" alt="Paper & Craft Logo">
    </center>

    <nav>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Signup</a>
    </nav>
    <div class="login-container">
        <h2>Login</h2>
        <form method="POST" action="LoginServlet">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit">Login</button>
        </form>
    </div>
<div id="copyright">
    <p>&copy; 2025 Paper & Craft. All rights reserved.</p>
</div>
</body>
</html>
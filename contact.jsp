<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Us</title>
    <style type="text/css">
        body {
            color: #F9EAE1;
            font-family: 'Arial', sans-serif;
            background-color: #F9EAE1;
            margin: 0;
        }

        img {
            max-width: 400px; /* Increased the max-width */
            margin: 10px 80px 20px 20px;
        }

        section {
            max-width: 500px;
            margin: 20px 50px 80px 70px;
            padding: 20px;
            background-color: rosybrown;
            box-shadow: 0 0 10px white;
            border-radius: 8px;
            font-family: "Garamond", Garamond, serif;
            background-image: url(/static/images/background1.jpg);
        }

        nav {
            background-color: #333;
            overflow: hidden;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav ul li {
            position: relative;
        }

        nav ul li a {
            display: block;
            color: white;
            padding: 14px 20px;
            text-decoration: none;
        }

        nav ul li a:hover {
            background-color: #575757;
        }

        nav ul li .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        nav ul li .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        nav ul li .dropdown-content a:hover {
            background-color: #ddd;
        }

        nav ul li:hover .dropdown-content {
            display: block;
        }

        .contact-form-container {
            position: relative;
            right: 0;
            width: 100%;
        }

        .contact-info {
            max-width: 50%;
        }

        .contact-info h1 {
            margin-bottom: 10px;
            color: black;
        }

        .contact-info p {
            margin-bottom: 20px;
            color: black;
        }

        .contact-form {
            max-width: 100%;
        }

        .contact-form form {
            display: flex;
            flex-direction: column;
            color: black;
        }

        .contact-form label {
            margin-bottom: 5px;
            font-weight: bolder;
            text-align: left;
        }

        .contact-form input,
        .contact-form textarea {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 5px;
            border-color: black;
            outline: none;
            background: white;
            color: black;
        }

        .radio-buttons {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .contact-form button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: black;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #000000;
        }

        #copyright {
            text-align: center;
            padding: 20px 0;
            background-color: #333;
            color: #fff;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <img class="name" src="images/name.jpeg">
    <nav>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Products</a>
                <div class="dropdown-content">
                    <a href="pens.jsp">Pens</a>
                    <a href="notebooks.jsp">Notebooks</a>
                    <a href="planners.jsp">Planners</a>
                </div>
            </li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
    <br><br>
    <center>
        <div class="contact-info">
            <h1>Contact Us</h1>
            <p>Get in touch with us! Whether you have questions, feedback, or just want to say hello, we're here for you.</p>
            <br>
            <div class="contact-form-container">
                <section>
                    <div class="contact-form">
                        <form action="ContactServlet" method="POST">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" required>

                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>

                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" name="phone" required>

                            <label for="contact-method">Preferred contact method of communication</label>
                            <div class="radio-buttons">
                                <input type="radio" id="email-method" name="contact-method" value="email">
                                <label for="email-method">Email</label>
                                <input type="radio" id="phone-method" name="contact-method" value="phone" checked>
                                <label for="phone-method">Phone</label>
                            </div>

                            <label for="message">Message</label>
                            <textarea id="message" name="message" rows="5" required></textarea>

                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </center>

    <div id="copyright">
        <p>&copy; 2025 Paper & Craft . All rights reserved.</p>
    </div>
</body>
</html>
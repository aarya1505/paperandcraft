
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
 <style type="text/css">
 
 body {
   color: #F9EAE1;
   font-family: 'Arial', sans-serif;
   background-color: #F9EAE1;
   margin: 0;
 }

section {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: rosybrown;
    box-shadow: 0 0 10px white;
    border-radius: 8px;
    font-family: "Garamond", Garamond, serif;
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
h1 {
    font-size: 50px;
    font-family:'Trebuchet MS', sans-serif;
    font-weight: 400;
    font-style: normal;
    text-align: center;
    margin-top: 20px;
    color: black;
 }

h2 {
    font-size: 40px;
    margin-top: 20px;
    color :rgb(0, 0, 0);
}
 
 h3 {
  font-size: 30px;
  color:black;
 }

p {
    line-height: 1.6;
    font-size: 25px;
}

img {
      max-width: 400px; 
      margin: 10px 80px 20px 20px;
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
    <img class = "name" src="images/name.jpeg" > 
<br><br>
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
        <<section>
    <h2><b>About Paper & Craft</b></h2>

    <h3><b>Bringing Stationery to Your Fingertips</b></h3>
    <p>At <strong>Paper & Craft</strong>, we believe that creativity and productivity go hand in hand. Established with a passion for providing high-quality stationery, our platform is designed to offer a seamless shopping experience for students, professionals, and artists alike. </p>
    <h3><b>A Smarter Way to Shop for Stationery</b></h3>
    <p>We understand the importance of convenience, which is why our <strong>Online Stationery Store</strong> offers a user-friendly interface to browse, select, and purchase products with ease. Our intuitive cart management system ensures that you can add, update, or remove items effortlessly while enjoying a smooth checkout experience.</p>

    <h3><b>Thank You for Choosing Us!</b></h3>
    <p>At <strong>Paper & Craft</strong>, we are committed to making every purchase a delightful experience. Let’s redefine the way you shop for stationery—one order at a time!</p>
</section>
  
    <br><br>    
    <div id="copyright">
      <p>&copy; 2025 Paper & Craft . All rights reserved.</p>
    </div>
</body>
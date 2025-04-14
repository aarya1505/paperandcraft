<%@ page import="javax.servlet.http.HttpSession" %>
<% 
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userRole") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = (String) sessionObj.getAttribute("userRole");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <title>Home - Paper & Craft</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F9EAE1;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        
        .image img {
            max-width: 50%;
            height: auto;
            display: block;
            margin: 20px auto;
        }
        
        nav {
    width: 100%;
    background-color: #333;
    display: flex;
    justify-content: space-between; 
    align-items: center;
}

    nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
}

    .nav-right {
    margin-left: 980px;
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
.carousel-caption {
    background: rgba(0, 0, 0, 0.5); 
    padding: 15px;
    border-radius: 10px;
}
.carousel-item img {
    height: 500px; 
    object-fit: cover;
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

        nav ul li:hover .dropdown-content {
            display: block;
        }

       
        .container1 {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            max-width: 900px;
            
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;

        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            border-radius: 10px;
            transition: transform 0.3s;
        }
        .card h2 {
            font-size: 22px;
            margin: 15px 0;
            font-weight: bold;
        }
        .card:hover img {
            transform: scale(1.1);
        }
        .shop-btn {
            background: #ff4081;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            border-radius: 5px;
            transition: 0.3s;
        }
        .shop-btn:hover {
            background: #e60073;
        }

        footer {
            width: 100%;
            text-align: center;
            padding: 20px 0;
            background-color: #333; 
            color: #fff;
            font-size: 16px;
        }
        
        .hero {
            width: 100vw;
            height: 100vh;
            background: #CC8B86;
            color: white;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }
        .hero .text {
            max-width: 500px;
            margin: 20px;
        }
        .hero h1 {
            font-size: 42px;
            margin: 0 0 10px;
        }
        .hero p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .hero button {
            background: #f1c40f;
            padding: 12px 24px;
            border: none;
            font-size: 18px;
            cursor: pointer;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s;
        }
        .hero button:hover {
            background: #d4a70f;
        }
        .hero .image img {
            width: 100%;
            max-width: 400px;
            border-radius: 10px;
        }

        @media (max-width: 768px) {
            .containerslide container {
                flex-direction: column;
            }
            .image-side {
                min-height: 200px;
            }
            nav ul {
                flex-direction: column;
                align-items: flex-start;
            }
            .nav-right {
                margin-left: 0;
                justify-content: center;
                width: 100%;
            }
            .container1 container{
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        }

        }
    </style>
</head>
<body>
    <div class="image">    
        <img src="images/name.jpeg" alt="Paper & Craft Logo">
    </div>
    
    <nav>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li class="dropdown">
            <a href="javascript:void(0)">Products</a>
            <div class="dropdown-content">
                <a href="pens.jsp">Pens</a>
                <a href="notebook.jsp">Notebooks</a>
                <a href="planner.jsp">Planners</a>
                <a href="folders.jsp">Files & Folders</a>
                <a href="annotation.jsp">Annotation</a>
                <a href="pouches.jsp">Pouches</a>
            </div>
        </li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>

        <div class="nav-right">
            <li><a href="LogoutServlet">Logout</a></li>
        </div>
    </ul>
</nav>
    <div class="hero">
        <div class="text">
            <h1>Experience the Best Stationery</h1>
            <p>Find high-quality stationery products at affordable prices. Explore our exclusive collection now!</p>
            <a href="#down" class="btn btn-dark">Shop now</a>
        </div>
        <div class="image">
            <img src="images/stationery-hero.jpg" alt="Stationery Products">
        </div>
    </div>
    <br><br>
<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/green.jpg" class="d-block w-100" alt="Slide 1">
            <div class="carousel-caption">
                <h5>Perfect Your Notes</h5>
                <p>Jot down your thoughts with our premium notebooks.</p>
                <a href="annotation.jsp" class="btn btn-dark">Explore More</a>
            </div>
        </div>

        <div class="carousel-item">
            <img src="images/nbs.jpg" class="d-block w-100" alt="Slide 2">
            <div class="carousel-caption">
                <h5>Premium Quality</h5>
                <p>Discover handcrafted paper products for all your needs.</p>
                <a href="notebook.jsp" class="btn btn-dark">Shop Now</a>
            </div>
        </div>

        <div class="carousel-item">
            <img src="images/journal.jpg" class="d-block w-100" alt="Slide 3">
            <div class="carousel-caption">
                <h5>Creative Journals</h5>
                <p>Bring your ideas to life with our designer journals.</p>
                <a href="planner.jsp" class="btn btn-dark">Start Writing</a>
            </div>
        </div>
    </div>

    
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

    <br><hr><br>
    
    <section id="down">

    <div class="container1">
        <div class="card">
            <img src="images/pen1.webp" alt="PENS">
            <h2>PENS</h2>
            <a href="pens.jsp" class="shop-btn">SHOP NOW</a>
        </div>
        <div class="card">
            <img src="images/nb1.jpg" alt="Notebook">
            <h2>NOTEBOOKS</h2>
            <a href="notebook.jsp" class="shop-btn">SHOP NOW</a>
        </div>
        <div class="card">
            <img src="images/fol1.jpg" alt="folders">
            <h2>FOLDERS</h2>
            <a href="folders.jsp" class="shop-btn">SHOP NOW</a>
        </div>
        <div class="card">
            <img src="images/ann1.jpg" alt="Annotation">
            <h2>ANNOTATIONS</h2>
            <a href="annotation.jsp" class="shop-btn">SHOP NOW</a>
        </div>
         <div class="card">
            <img src="images/plan1.jpg" alt="Plan">
            <h2>PLANNERS</h2>
            <a href="planner.jsp" class="shop-btn">SHOP NOW</a>
        </div>
         <div class="card">
            <img src="images/pouch1.jpg" alt="Pouches">
            <h2>UNDER 99</h2>
            <a href="pouches.jsp" class="shop-btn">SHOP NOW</a>
        </div>
    </div>
    </section>

    <footer>
        <p>&copy; 2025 Paper & Craft. All rights reserved.</p>
    </footer>

   
   
</body>
</html>
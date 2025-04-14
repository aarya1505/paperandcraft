<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Paper & Craft</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color:  #d1be9c
        }

        .header {
            background-color: #F9EAE1;
            text-align: center;
            padding: 20px 0;
        }

        .header img {
            max-width: 400px;
            height: auto;
        }

        nav {
            background-color: #333; 
            overflow: visible;
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

        .main {
   margin: 2%;
 }

 
        .card {
   width: 15%;
   display: inline-block;
   box-shadow: 2px 2px 20px black;
   border-radius: 5px;
   margin: 2%;
   color: black;
 }

 .image img {
   width: 85%;
   border-top-right-radius: 5px;
   border-top-left-radius: 5px;
 }

 .title {
   text-align: center;
   padding: 10px;
 }

 h1 {
   font-size: 40px;
 }

 h2 {
   font-size: 20px;
 }

 .des {
   padding: 3px;
   text-align: center;
   padding-top: 10px;
   border-bottom-right-radius: 5px;
   border-bottom-left-radius: 5px;
 }

 button {
   margin-top: 40px;
   margin-bottom: 10px;
   background-color: black;
   border: 1px solid  white;
   color:white;
   border-radius: 5px;
   padding: 10px;
 }

 button:hover {
   background-color: white;
   color: rgb(210, 145, 156) ;
   transition: .5s;
   cursor: pointer;
 }

 .controls {
   text-align: center;
   margin-top: 20px;
 }
 
        #copyright {
            text-align: center;
            padding: 20px 0;
            background-color: #333;
            color: #fff;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .main-content img {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Section above navigation bar -->
    <div class="header">
        <img src="images/name.jpeg" alt="Paper & Craft Logo">
    

    
    <nav>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Products</a>
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
        </ul>
    </nav>

    <!-- Main Content Section -->
    <div class="main-content">
        <h1>PLANNERS</h1>
    </div>

    <div class="card">
            <div class="image">
                <img src="images/plan1.jpg">
            </div>
            <div class="title">
                <h2>2025 Planner</h2>
            </div>
            <div class="des">
                <p>₹150</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="29">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan2.jpg">
            </div>
            <div class="title">
                <h2>Work Planner</h2>
            </div>
            <div class="des">
                <p>₹180</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="30">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan3.jpg">
            </div>
            <div class="title">
                <h2>Simple Planner</h2>
            </div>
            <div class="des">
                <p>₹190</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="31">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan4.png">
            </div>
            <div class="title">
                <h2>Monthly Planner</h2>
            </div>
            <div class="des">
                <p>₹200</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="32">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan5.jpg">
            </div>
            <div class="title">
                <h2>Vintage Planner</h2>
            </div>
            <div class="des">
                <p>₹500</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="33">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
    
    <div class="card">
            <div class="image">
                <img src="images/plan6.jpg">
            </div>
            <div class="title">
                <h2>2-Planner</h2>
            </div>
            <div class="des">
                <p>₹200</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="34">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan7.jpg">
            </div>
            <div class="title">
                <h2>Leather Planner</h2>
            </div>
            <div class="des">
                <p>₹300</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="35">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan8.jpg">
            </div>
            <div class="title">
                <h2>Spiral Planner</h2>
            </div>
            <div class="des">
                <p>₹400</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="36">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan9.jpg">
            </div>
            <div class="title">
                <h2>Calendar</h2>
            </div>
            <div class="des">
                <p>₹100</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="37">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan10.jpg">
            </div>
            <div class="title">
                <h2>Day-Date</h2>
            </div>
            <div class="des">
                <p>₹100</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="38">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan11.png">
            </div>
            <div class="title">
                <h2>Calendar Notepad</h2>
            </div>
            <div class="des">
                <p>₹100</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="39">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/plan12.png">
            </div>
            <div class="title">
                <h2>Magnetic Calendar</h2>
            </div>
            <div class="des">
                <p>₹200</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="40">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
    
   </div>
    <!-- Footer -->
    <footer id="copyright">
        <p>&copy; 2025 Paper & Craft. All rights reserved.</p>
    </footer>
</body>
</html>

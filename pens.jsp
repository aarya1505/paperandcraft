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

  
    <div class="main-content">
        <h1>PENS</h1>
    </div>
         <div class="card">
            <div class="image">
                <img src="images/pen1.webp">
            </div>
            <div class="title">
                <h2>Pilot Gel Pen</h2>
            </div>
            <div class="des">
                <p>₹40</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="1">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pen2.webp">
            </div>
            <div class="title">
                <h2>Uniball Roller</h2>
            </div>
            <div class="des">
                <p>₹60</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="2">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pen3.png">
            </div>
            <div class="title">
                <h2>Parker Jotter</h2>
            </div>
            <div class="des">
                <p>₹80</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="3">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pen4.png">
            </div>
            <div class="title">
                <h2>Lamy Safari fountain</h2>
            </div>
            <div class="des">
                <p>₹70</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="4">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pen5.jpg">
            </div>
            <div class="title">
                <h2>Pentel Gel Pen</h2>
            </div>
            <div class="des">
                <p>₹50</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="5">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pen6.png">
            </div>
            <div class="title">
                <h2>Montblanc Fountain Pen</h2>
            </div>
            <div class="des">
                <p>₹100</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="6">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
    <div class="card">
            <div class="image">
                <img src="images/pencil1.jpg">
            </div>
            <div class="title">
                <h2>Steadtler Pencils</h2>
            </div>
            <div class="des">
                <p>₹150</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="7">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pencil2.jpg">
            </div>
            <div class="title">
                <h2>Lyra Graduate Pencils</h2>
            </div>
            <div class="des">
                <p>₹200</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="8">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pencil3.jpg">
            </div>
            <div class="title">
                <h2>Slate Pencils</h2>
            </div>
            <div class="des">
                <p>₹80</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="9">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pencil4.jpg">
            </div>
            <div class="title">
                <h2>Rotring PenPencil</h2>
            </div>
            <div class="des">
                <p>₹60</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="10">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pencil5.jpg">
            </div>
            <div class="title">
                <h2>Rotring Mechanical Pencil</h2>
            </div>
            <div class="des">
                <p>₹40</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="11">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
        
        <div class="card">
            <div class="image">
                <img src="images/pencil6.jpg">
            </div>
            <div class="title">
                <h2>White Pencils</h2>
            </div>
            <div class="des">
                <p>₹90</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="12">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>
    <div class="card">
            <div class="image">
                <img src="images/pencil7.jpg">
            </div>
            <div class="title">
                <h2>Gripper PenPencil</h2>
            </div>
            <div class="des">
                <p>₹70</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="13">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>

        <div class="card">
            <div class="image">
                <img src="images/pencil8.jpg">
            </div>
            <div class="title">
                <h2>Rotring WoodCase Pencils</h2>
            </div>
            <div class="des">
                <p>₹75</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="14">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>

        <div class="card">
            <div class="image">
                <img src="images/pencil9.jpg">
            </div>
            <div class="title">
                <h2>Doms Neon</h2>
            </div>
            <div class="des">
                <p>₹82</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="15">
                    <label>Quantity:</label>
                    <input type="number" name="quantity" min="1" value="1"><br>
                    <button type="submit">Add to Cart</button>
                </form>      
            </div>
        </div>

        <div class="card">
            <div class="image">
                <img src="images/pencil10.jpg">
            </div>
            <div class="title">
                <h2>Rotring Metallic Pencils</h2>
            </div>
            <div class="des">
                <p>₹30</p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="product_id" value="16">
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

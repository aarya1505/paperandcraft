# Paper and Craft 📚✏️  
An Online Stationery Buying Platform

## 📌 Overview

**Paper and Craft** is a web-based application designed as a college project for online stationery shopping. It allows users to browse, search, and purchase various stationery products. Admins can manage inventory and orders through a dedicated dashboard.

Built using Java Servlets, JSP, MySQL, HTML, and CSS, this project demonstrates a full-stack web application with CRUD functionality, authentication, and dynamic content management.

---

## 🔧 Tech Stack

- **Frontend:** HTML, CSS, JavaScript  
- **Backend:** Java Servlets, JSP  
- **Database:** MySQL  
- **Authentication:** BCrypt (for password hashing)  
- **Server:** Apache Tomcat

---

## ✨ Features

### 🛍️ User Functionality
- User registration and login
- Add items to cart
- Place orders

### 🔐 Admin Functionality
- Admin login
- Manage customer orders
- View registered users

---

## 🗃️ Database Schema

Includes tables such as:
- `users` (user_id, name, email, password, role)
- `products` (product_id, name, description, price, quantity)
- `orders` (order_id, user_id, order_date, total_amount)
- `order_items` (item_id, order_id, product_id, quantity)

---

## 🚀 Getting Started

### Prerequisites
- Java Development Kit (JDK)
- Apache Tomcat server
- MySQL
- Any IDE (e.g., Eclipse, NetBeans)

### Steps to Run
1. Clone the repository.
2. Import the project into your IDE.
3. Create the database.
4. Configure database credentials in the project.
5. Deploy the project on Apache Tomcat.
6. Access the app via `http://localhost:8080/PaperAndCraft/`.

---

## 📁 Folder Structure


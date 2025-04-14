<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession();
    String sessionId = sessionObj.getId();

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    List<Map<String, Object>> cartItems = new ArrayList<>();
    double grandTotal = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/5285_stationery", "root", "chaukul@15D");
        stmt = conn.prepareStatement("SELECT p.name, c.quantity, p.price, (c.quantity * p.price) AS total FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.session_id = ?");
        stmt.setString(1, sessionId);
        rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("name", rs.getString("name"));
            item.put("quantity", rs.getInt("quantity"));
            item.put("price", rs.getDouble("price"));
            item.put("total", rs.getDouble("total"));
            cartItems.add(item);
            grandTotal += rs.getDouble("total");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            background-color: #c98b8e;
            font-family: Arial, sans-serif;
        }
        .checkout-container {
            width: 50%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: black;
            color: white;
        }
        .place-order-btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .place-order-btn:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <h2>Checkout</h2>
        
        <form action="ConfirmOrderServlet" method="post">
            <label>Name:</label>
            <input type="text" name="name" required>
            
            <label>Email:</label>
            <input type="email" name="email" required>
            
            <label>Address:</label>
            <textarea name="address" required></textarea>

            <h3>Cart Summary</h3>
            <table>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <% for (Map<String, Object> item : cartItems) { %>
                <tr>
                    <td><%= item.get("name") %></td>
                    <td>&#8377;<%= item.get("price") %></td>
                    <td><%= item.get("quantity") %></td>
                    <td>&#8377;<%= item.get("total") %></td>
                </tr>
                <% } %>
            </table>
            
            <h3>Grand Total: &#8377;<%= grandTotal %></h3>
            
            <input type="hidden" name="total" value="<%= grandTotal %>">
            <button type="submit" class="place-order-btn">Place Order</button>
        </form>
    </div>
</body>
</html>

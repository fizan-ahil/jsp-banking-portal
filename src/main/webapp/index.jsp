<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>

<%
    String url = "jdbc:mysql://127.0.0.2:3306/bank";
    String username = "root";
    String password = "Gulzar@kpb1";

    boolean showError = false;
    int attempts = 0;

    HttpSession httpsession = request.getSession(true);

    if (httpsession.getAttribute("attempts") != null) {
        attempts = (int) httpsession.getAttribute("attempts");
    }

    if (request.getMethod().equals("POST")) {
        String enteredUsername = request.getParameter("username");
        String enteredPassword = request.getParameter("password");

        // Hash the entered password
        String hashedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(enteredPassword.getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b)); // Convert each byte to hexadecimal
            }
            hashedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // SQL query to check username and hashed password
            String sql = "SELECT * FROM creation WHERE username=? AND password=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, enteredUsername);
            pstmt.setString(2, hashedPassword); // Compare the hashed password
            rs = pstmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("authentication.jsp");
            } else {
                showError = true;
                attempts++;
                httpsession.setAttribute("attempts", attempts);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>

<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 1rem;
        }
        label {
            display: block;
            color: #555555;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #4CAF50;
            color: #ffffff;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            text-align: center;
        }
        .register-link {
            text-align: center;
            margin-top: 1rem;
            color: #333333;
        }
        .register-link a {
            color: #4CAF50;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>ABC BANK OF INDIA</h1>

        <% if (showError) { %>
            <div class="error-message">
                <% if (attempts >= 3) { %>
                    <p>You have attempted three times incorrectly. Please try again tomorrow.</p>
                <% } else { %>
                    <p>Invalid username or password. Please try again.</p>
                <% } %>
            </div>
        <% } %>

        <form action="" method="post">
            <label>Username:</label>
            <input type="text" name="username" placeholder="Enter your username" required>

            <label>Password:</label>
            <input type="password" name="password" placeholder="Enter your password" required>

            <input type="submit" value="Login">
        </form>

        <div class="register-link">
            Don't have an account? <a href="register.jsp">Register here</a>
        </div>
    </div>
</body>
</html>

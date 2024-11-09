<%@ page import="java.sql.*" %>
<%@ page import="java.security.*" %> <!-- Import for hashing -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .registration-container {
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
            margin-bottom: 1.5rem;
        }
        label {
            color: #555555;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        input[type="text"],
        input[type="password"] {
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
            background-color: #28a745;
            color: #ffffff;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="registration-container">
    <h1>User Registration</h1>
    <%
        if (request.getMethod().equals("POST")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            String url = "jdbc:mysql://127.0.0.2:3306/bank";
            String dbUsername = "root";
            String dbPassword = "Gulzar@kpb1";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Hashing the password before storing
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hashedBytes = md.digest(password.getBytes("UTF-8"));
                StringBuilder sb = new StringBuilder();
                for (byte b : hashedBytes) {
                    sb.append(String.format("%02x", b)); // Convert byte to hex
                }
                String hashedPassword = sb.toString();

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                String checkQuery = "SELECT username FROM creation WHERE username = ?";
                pstmt = conn.prepareStatement(checkQuery);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    out.println("<p style='color: red;'>Username already exists.</p>");
                } else {
                    String insertQuery = "INSERT INTO creation (username, password) VALUES (?, ?)";
                    pstmt = conn.prepareStatement(insertQuery);
                    pstmt.setString(1, username);
                    pstmt.setString(2, hashedPassword); // Store hashed password
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("index.jsp");
                    } else {
                        out.println("<p style='color: red;'>Failed to create user.</p>");
                    }
                }
            } catch (Exception e) {
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<p style='color: red;'>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        }
    %>

    <form action="" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-zA-Z]).{8,}" required>

        <input type="submit" value="Register">
    </form>
</div>

</body>
</html>

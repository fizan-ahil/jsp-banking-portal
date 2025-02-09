<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
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
        .registration-container {
            width: 100%;
            max-width: 500px;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }
        label {
            display: block;
            color: #555555;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        input[type="text"], select {
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
        .login-link {
            text-align: center;
            margin-top: 1rem;
        }
        .login-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="registration-container">
    <h1>User Registration - New Account</h1>

    <%
        if (request.getMethod().equals("POST")) {
            String name = request.getParameter("name");
            String accountNumber = request.getParameter("account_number");
            String accountType = request.getParameter("account_type");
            String branch = request.getParameter("branch");
            String city = request.getParameter("city");
            String mobileNumber = request.getParameter("mobile_number");

            String url = "jdbc:mysql://127.0.0.2:3306/bank";
            String username = "root";
            String password = "Gulzar@kpb1";

            Connection conn = null;
            PreparedStatement pstmt1 = null;
            PreparedStatement pstmt2 = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
                conn.setAutoCommit(false); // Start transaction

                // Insert into registration table
                pstmt1 = conn.prepareStatement("INSERT INTO registration (name, account_number, account_type, branch, city, mobile_number) VALUES (?, ?, ?, ?, ?, ?)");
                pstmt1.setString(1, name);
                pstmt1.setString(2, accountNumber);
                pstmt1.setString(3, accountType);
                pstmt1.setString(4, branch);
                pstmt1.setString(5, city);
                pstmt1.setString(6, mobileNumber);
                pstmt1.executeUpdate();

                // Insert into accounts table with initial balance 0
                pstmt2 = conn.prepareStatement("INSERT INTO accounts (account_number, account_holder_name, balance) VALUES (?, ?, ?)");
                pstmt2.setString(1, accountNumber);
                pstmt2.setString(2, name);
                pstmt2.setDouble(3, 0.0);
                pstmt2.executeUpdate();

                conn.commit(); // Commit transaction

                response.sendRedirect("creation.jsp");
            } catch (Exception e) {
                if (conn != null) conn.rollback(); // Rollback transaction on error
                out.println("Error: " + e.getMessage());
            } finally {
                if (pstmt1 != null) pstmt1.close();
                if (pstmt2 != null) pstmt2.close();
                if (conn != null) conn.close();
            }
        }
    %>

    <form action="" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="account_number">Account Number:</label>
        <input type="text" id="account_number" name="account_number" required>

        <label for="account_type">Account Type:</label>
        <select id="account_type" name="account_type" required>
            <option value="">Select Account Type</option>
            <option value="Savings">Savings</option>
            <option value="Current">Current</option>
        </select>

        <label for="branch">Branch:</label>
        <input type="text" id="branch" name="branch" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="mobile_number">Mobile Number:</label>
        <input type="text" id="mobile_number" name="mobile_number" required>

        <input type="submit" value="Submit">
    </form>

    <div class="login-link">
        <a href="index.jsp">Already have an account?</a>
    </div>
</div>

</body>
</html>

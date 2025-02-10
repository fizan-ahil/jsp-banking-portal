<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }
        h1 {
            color: #333;
            font-size: 22px;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            text-align: left;
        }
        input[type="text"], input[type="number"], input[type="submit"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        /* Red Submit Button */
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            background: #dc3545; /* Red */
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }
        input[type="submit"]:hover {
            background: #b52b3a; /* Darker red */
        }
        .message {
            margin-top: 15px;
            font-size: 18px;
            padding: 10px;
            border-radius: 5px;
        }
        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Withdraw Money</h1>
        <form method="post">
            <label>Account Number:</label>
            <input type="text" name="account_number" required>
            <label>Amount:</label>
            <input type="number" name="amount" step="0.01" required>
            <input type="submit" value="Withdraw">
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String accountNumber = request.getParameter("account_number");
                double amount = Double.parseDouble(request.getParameter("amount"));

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bank", "root", "Gulzar@kpb1");

                    pstmt = conn.prepareStatement("SELECT balance FROM accounts WHERE account_number = ?");
                    pstmt.setString(1, accountNumber);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        double balance = rs.getDouble("balance");

                        if (balance >= amount) {
                            pstmt.close();
                            pstmt = conn.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE account_number = ?");
                            pstmt.setDouble(1, amount);
                            pstmt.setString(2, accountNumber);
                            pstmt.executeUpdate();
                            out.println("<div class='message success'>Withdrawal Successful!</div>");
                        } else {
                            out.println("<div class='message error'>Insufficient Balance!</div>");
                        }
                    } else {
                        out.println("<div class='message error'>Account Not Found!</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='message error'>Error: " + e.getMessage() + "</div>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>

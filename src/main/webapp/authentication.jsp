<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Captcha Verification</title>
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
        .captcha-container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
        }
        h1 {
            color: #333333;
            margin-bottom: 1.5rem;
        }
        p {
            color: #555555;
            font-size: 1.1rem;
        }
        .captcha-display {
            font-size: 2rem;
            font-weight: bold;
            color: #ff6b6b;
            margin: 1rem 0;
            background-color: #f0f0f0;
            padding: 0.5rem;
            border-radius: 5px;
        }
        input[type="text"] {
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
        .error-message {
            color: #d9534f;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        .captcha-input-box {
            width: 100%;
            max-width: 375px;
            padding: 0;
            font-size: 1rem;
            margin-bottom: 0rem;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<div class="captcha-container">
    <h1>Captcha Verification</h1>
    <%
        String captcha = (String) session.getAttribute("captcha");
        if (captcha == null) {
            Random rand = new Random();
            int generatedNumber = rand.nextInt(900000) + 100000;
            captcha = Integer.toString(generatedNumber);
            session.setAttribute("captcha", captcha);
        }

        String typedCaptcha = request.getParameter("captcha");
        if (typedCaptcha != null && typedCaptcha.equals(captcha)) {
            response.sendRedirect("display.jsp");
        } else if (typedCaptcha != null) {
    %>
        <p class="error-message">Invalid captcha. Please try again.</p>
    <%
        }
    %>
    <p>Enter the following Captcha:</p>
    <div class="captcha-display"><%= captcha %></div>
    <form action="" method="post">
        <div class = "captcha-input-box">
        <input type="text" name="captcha" required placeholder="Enter captcha">
        </div>
        <input type="submit" value="Verify Captcha">
    </form>
</div>

</body>
</html>

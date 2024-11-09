<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            background-color: #2E8B57; /* Green */
            color: white;
            padding: 40px 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            font-size: 3em;
            margin-bottom: 10px;
        }
        .header p {
            font-size: 1.2em;
            margin: 0;
            color: black;
        }
        .content {
            margin: 40px 0;
            line-height: 1.6;
        }
        .paragraph {
            margin: 20px 0;
        }
        h2 {
            color: #2E8B57;
            font-size: 1.8em;
            border-bottom: 2px solid #2E8B57;
            padding-bottom: 5px;
        }
        p {
            font-size: 1.1em;
            color: #555;
            margin-top: 10px;
        }
        .footer {
            background-color: #2E8B57;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 8px;
            margin-top: 40px;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header Section -->
    <div class="header">
        <h1>Welcome to ABC Bank of India</h1>
        <p>Your trusted partner for financial growth and success</p>
    </div>

    <!-- Content Section -->
    <div class="content">
        <div class="paragraph">
            <h2>About Us</h2>
            <p>ABC Bank of India has been at the forefront of providing innovative banking solutions for over 50 years. From personal savings accounts to business loans, we strive to meet the financial needs of our customers with excellence.</p>
        </div>

        <div class="paragraph">
            <h2>Our Vision</h2>
            <p>Our vision is to be a leader in banking, empowering individuals and businesses to achieve their financial goals with trust, innovation, and customer-centric solutions.</p>
        </div>

        <div class="paragraph">
            <h2>Our Values</h2>
            <p>Customer satisfaction, transparency, integrity, and innovation are at the core of everything we do. We continuously strive to provide the best banking experience to our customers.</p>
        </div>

        <div class="paragraph">
            <h2>Why Choose Us?</h2>
            <p>With over 500 branches nationwide, ABC Bank of India offers unparalleled accessibility and a wide range of services tailored to meet every need. Our seamless digital banking experience ensures you can manage your finances anytime, anywhere.</p>
        </div>

        <!-- Call to Action Button -->
        <div class="paragraph" style="text-align: center;">
            <a href="services.jsp" class="button">Explore Our Services</a>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p> &copy; ABC Bank of India | All Rights Reserved</p>
    </div>
</div>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Services</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        h1 {
            font-size: 1.8rem;
            margin-bottom: 1rem;
            color: #333;
        }

        p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 1.5rem;
        }

        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .btn {
            padding: 1rem;
            font-size: 1.2rem;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            color: white;
            transition: all 0.3s ease-in-out;
        }

        .deposit { background-color: #007bff; }
        .withdraw { background-color: #dc3545; }
        .balance { background-color: #28a745; }

        .btn:hover {
            opacity: 0.85;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="container">
    <h1>BANK OF INDIA</h1>
    <p>Select a service to proceed:</p>

    <div class="btn-container">
        <a href="deposit.jsp" class="btn deposit">Deposit Money</a>
        <a href="withdrawal.jsp" class="btn withdraw">Withdraw Money</a>
        <a href="balance.jsp" class="btn balance">Check Balance</a>
    </div>
</div>

</body>
</html>

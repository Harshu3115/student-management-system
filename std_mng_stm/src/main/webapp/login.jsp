<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: #fff;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0px 6px 18px rgba(0,0,0,0.2);
            width: 380px;
            text-align: center;
        }
        h2 {
            margin-bottom: 25px;
            color: #2c3e50;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            font-size: 14px;
            color: #2c3e50;
            display: block;
            margin-bottom: 6px;
        }
        input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
            font-size: 15px;
            box-sizing: border-box;
        }
        input:focus {
            border-color: #2980b9;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #2980b9;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }
        button:hover {
            background: #1f6391;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }
        form a{
        text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>🔐 Admin Login</h2>

        <!-- Show error message if login fails -->
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p class="error">❌ Invalid Username or Password!</p>
        <%
            }
        %>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" placeholder="Enter Username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter Password" required>
            </div>

            <button type="submit">SIGN IN</button>
            <br>
            
            <p>Don't have an account ? <a href="RegisterAdmin.jsp">Sign up</a> </p>
        </form>
    </div>
</body>
</html>

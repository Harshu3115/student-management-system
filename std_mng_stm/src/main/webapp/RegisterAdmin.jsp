<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            margin-bottom: 15px;
            transition: 0.3s;
            font-size: 14px;
        }

        input:focus {
            border-color: #4facfe;
            box-shadow: 0px 0px 5px rgba(79, 172, 254, 0.6);
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

        p {
            margin-top: 10px;
            font-weight: 500;
        }

        p.success {
            color: green;
        }

        p.error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register Admin</h2>
        <hr>
        
        <br><br>
        <form action="RegisterAdmin" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone Number (10 digits)" pattern="[0-9]{10}" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            
            <button type="submit">Register</button>
            
            <!-- Messages -->
            <p class="success">${successMsg}</p>
            <p class="error">${errorMsg}</p>
        </form>
    </div>
</body>
</html>

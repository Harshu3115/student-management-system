<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 20px;
            background: #f4f7fa;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background: #2c3e50;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
        .btn-container {
            text-align: center;
            margin-top: 25px;
        }
        .btn-container a {
            background: #2c3e50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: 0.3s;
        }
        .btn-container a:hover {
            background: hotpink;
        }
    </style>
</head>
<body>
    <h2>Registered Student List</h2>

    <%
        String search = request.getParameter("search");
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_managment_data","root","root");
            
            if(search != null && !search.trim().isEmpty()){
                // Search by ID, Name, or Phone
                String sql = "SELECT * FROM student_data WHERE id = ? OR name LIKE ? OR mob_no LIKE ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, search);  
                ps.setString(2, "%" + search + "%"); 
                ps.setString(3, "%" + search + "%");
                rs = ps.executeQuery();
            } else {
                // Show all students
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM student_data");  // ✅ FIXED TABLE NAME
            }
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Course</th>
            <th>Year</th>
            <th>Address</th>
        </tr>
        <%
            boolean found = false;
            while(rs.next()){
                found = true;
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("mob_no") %></td>
            <td><%= rs.getString("dob") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("course") %></td>
            <td><%= rs.getString("year") %></td>
            <td><%= rs.getString("address") %></td>
        </tr>
        <%
            }
            if(!found){
        %>
        <tr>
            <td colspan="9">No student found</td>
        </tr>
        <%
            }
        } catch(Exception e){
            out.println("Error: " + e.getMessage());
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e){}
            if(stmt != null) try { stmt.close(); } catch(Exception e){}
            if(con != null) try { con.close(); } catch(Exception e){}
        }
        %>
    </table>

    <div class="btn-container">
        <a href="main.jsp">⬅ Back to Home</a>
    </div>
</body>
</html>

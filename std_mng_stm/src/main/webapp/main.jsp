<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<html>
<head>
  <meta charset="UTF-8">
  <title>Bus Tracking System — Dashboard</title>
  <style>
  	body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background: #f9f9f9;
  color: #333;
}

/* Navbar */
.navbar {
  display: flex;
  justify-content: center;
  background: #fff;
  padding: 15px;
}
.navbar a {
  margin: 0 15px;
  text-decoration: none;
  color: #333;
  font-weight: 500;
}
.navbar a:hover {
  color: blue;
  border-bottom: 2px solid #007bff;
}

/* Container */
.container {
  width: 90%;
  margin: 30px auto;
}
h1 {
  text-align: center;
  font-size: 28px;
  margin-top: 20px;
}
h2 {
  margin: 20px 0 15px;
}

/* Search Box */
.search-box {
  margin-bottom: 15px;
}
.search-box input {
  width: 300px;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.search-box button {
  padding: 8px 14px;
  background: #007bff;
  border: none;
  color: #fff;
  font-weight: 500;
  border-radius: 4px;
  margin-left: 5px;
  cursor: pointer;
}

.search-box .btn{
	background-color: transparent;
	border:1px solid #007bff;
	color: #007bff;
}

.search-box .delete{
	background-color: red;
}

.search-box .delete:hover{
	background-color: transparent;
	border: 1px solid red;
	color: red;
}

.search-box .btn:hover{
	background-color: #007bff;
	color: white;
}

.search-box button:hover {
  background: #0056b3;
}

/* Table */
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 15px;
  background: #fff;
  border-radius: 5px;
  overflow: hidden;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
th, td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
th {
  background: #f4f4f4;
}
tr:hover {
  background: #f9f9f9;
}
  	
  
  </style>
</head>
<body>

<h1>Bus Tracking System</h1>

<div class="navbar">
  <a href="#">Dashboard</a>
  <a href="index.jsp">Add Bus</a>
  <a href="Update.jsp">Update Bus</a>
  <a href="delete.jsp">Delete Bus</a>
  <a href="logout">Logout</a>
</div>

<div class="container">
  <h2>Bus List</h2>

  <!-- Search Form -->
  <form class="search-box" method="get">
    <input type="text" name="search" placeholder="Search by ID, name, or course" 
           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
    <button type="submit">Search</button>
    <a href="delete.jsp"><button type="submit" class="delete">Delete Bus</button></a>
    <a href="studentList.jsp">
     <button type="submit" class="btn">Show All Buses</button></a>
  </form>

  <table>
    <tr>
      <th>ID</th>
      <th>Bus Number</th>
      <th>Route</th>
      <th>Driver Name</th>
      <th>Conductor Name</th>
      <th>Arrival Time</th>
      <th>Departure Time</th>
      <th></th>
      
    </tr>

    <%
      String search = request.getParameter("search");
      Connection con = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      try {
          if(search != null && !search.trim().isEmpty()){   // only search when user enters something
              Class.forName("com.mysql.cj.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_managment_data","root","Harshad@3115");

              String sql = "SELECT * FROM student_data WHERE id = ? OR name LIKE ? OR mob_no LIKE ? OR course LIKE ?";
              ps = con.prepareStatement(sql);
              ps.setString(1, search);
              ps.setString(2, "%" + search + "%");
              ps.setString(3, "%" + search + "%");
              ps.setString(4, "%" + search + "%");

              rs = ps.executeQuery();

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
      <td>
    <a href="DeleteStudent?id=<%= rs.getInt("id") %>" 
       style="color: red; font-size:18px;">
        <i class="fas fa-trash"></i>
    </a>
</td>
      
    </tr>
    <%
              }
              if(!found){
    %>
    <tr><td colspan="9">No student found</td></tr>
    <%
              }
          } else {
    %>
    <tr><td colspan="9" style="text-align:center;">Enter a search term to see results</td></tr>
    <%
          }
      } catch(Exception e){
          out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
      } finally {
          if(rs != null) try { rs.close(); } catch(Exception e){}
          if(ps != null) try { ps.close(); } catch(Exception e){}
          if(con != null) try { con.close(); } catch(Exception e){}
      }
    %>
</table>

</div>

</body>
</html>

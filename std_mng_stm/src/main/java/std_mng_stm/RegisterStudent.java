package std_mng_stm;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterStudent extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String course = request.getParameter("course");
        String year = request.getParameter("year");
        String address = request.getParameter("address");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_managment_data",
                "root",
                "Harshad@3115"
            );

            String query = "INSERT INTO student_data(name,email,mob_no,dob,gender,course,year,address) VALUES(?,?,?,?,?,?,?,?)";

            ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, dob);
            ps.setString(5, gender);
            ps.setString(6, course);
            ps.setString(7, year);
            ps.setString(8, address);

            ps.executeUpdate();

            // Redirect after success
            response.sendRedirect("main.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if(ps != null) ps.close();
                if(con != null) con.close();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
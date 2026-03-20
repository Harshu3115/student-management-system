package std_mng_stm;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SelectAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
   

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_managment_data", "root", "Harshad@3115");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM student_data");
        

            ResultSet rs = ps.executeQuery();

            // ✅ Redirect to student list page
            response.sendRedirect("main.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } 
    }
}

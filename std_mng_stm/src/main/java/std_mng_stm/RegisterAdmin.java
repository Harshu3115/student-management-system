package std_mng_stm;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
        throws ServletException, IOException {
        
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_managment_data", "root", "Harshad@3115");
            
            


            ps = con.prepareStatement("INSERT INTO admin(fullname,email,phone,username,password) VALUES(?,?,?,?,?)");
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, password);

            int row = ps.executeUpdate();
            
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            
            
            if (row > 0) {
            	req.setAttribute("successMsg", "Admin Added Succefully");
            } else {
            	req.setAttribute("errorMsg", "Unable to Added Admin...");
            }
            
            rd.include(req, resp);
            con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
    }
}

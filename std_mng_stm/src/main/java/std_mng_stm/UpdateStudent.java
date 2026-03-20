package std_mng_stm;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateStudent extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


	    
	    String name = req.getParameter("fullname");
	    String email = req.getParameter("email");
	    String phone = req.getParameter("phone");
	    String year = req.getParameter("year");
	    String address = req.getParameter("address"); 
	    int id = Integer.parseInt(req.getParameter("id"));
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_managment_data", "root", "Harshad@3115");
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE student_data SET name = ?, email = ?,  mob_no = ? ,year = ?, address = ? WHERE id = ?" // Fixed query
	        );

	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, phone);
	        ps.setString(4, year);
	        ps.setString(5, address);
	        ps.setInt(6, id);

	        int rs = ps.executeUpdate();

	        if (rs > 0) {
	            System.out.println("Your update completed successfully...");
	        } else {
	            System.out.println("Your update failed...");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

		
	
	
	}


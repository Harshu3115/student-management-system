package std_mng_stm;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteStudent")   // <-- URL mapping
public class DeleteStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_managment_data", "root", "Harshad@3115");

            PreparedStatement ps = con.prepareStatement("DELETE FROM student_data WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));

            int rows = ps.executeUpdate();

            if (rows > 0) {
                resp.sendRedirect("main.jsp");  // redirect after delete
            } else {
                resp.getWriter().println("❌ Failed to delete student.");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}

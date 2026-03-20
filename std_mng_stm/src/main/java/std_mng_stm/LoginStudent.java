package std_mng_stm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/student_managment_data", "root", "Harshad@3115");

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM admin WHERE username=? AND password=?");

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Successful login → create session
                HttpSession session = req.getSession();
                session.setAttribute("username", username);

                resp.sendRedirect("main.jsp");
            } else {
                // ❌ Invalid login → redirect with error
                resp.sendRedirect("login.jsp?error=1");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Database connection error: " + e.getMessage());
        }
    }
}

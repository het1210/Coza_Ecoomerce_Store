package Com.Controller;

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

import Com.Conn.ProjectConn;


@WebServlet("/User_ChangePass")
public class User_ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("name");
		String currentPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("cnew_password");
		
		// validate input
		if (username == null || username.isEmpty() || currentPassword == null || currentPassword.isEmpty() ||
				newPassword == null || newPassword.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
			response.sendRedirect("Changepassword.jsp?msg=t");
			return;
		}
		
		// check if new password matches confirm password
		if (!newPassword.equals(confirmPassword)) {
			request.getRequestDispatcher("Changepassword.jsp?msg=notmatch").forward(request, response);
			return;
		}
		
		try {
			Connection con=ProjectConn.createConnection();
			String sql = "SELECT * FROM user WHERE name = ? AND password = ? AND cpassword=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, currentPassword);
			pstmt.setString(3, currentPassword);
			ResultSet rs = pstmt.executeQuery();
			if (!rs.next()) {
				request.getRequestDispatcher("Changepassword.jsp?msg=wrong").forward(request, response);
				return;
			}
			
			// update password
			sql = "UPDATE user SET password = ?,cpassword=? WHERE name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, confirmPassword);
			pstmt.setString(3, username);
			pstmt.executeUpdate();
			
			// close database connection
			con.close();
			
			// redirect to login page with success message
			request.setAttribute("msg", "Password changed successfully.");
			request.getRequestDispatcher("logout.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Error occurred while changing password.");
			request.getRequestDispatcher("Changepassword.jsp?msg=invalid").forward(request, response);
		}
	}
}

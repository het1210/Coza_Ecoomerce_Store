package Com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class usercpass
 */
@WebServlet("/usercpass")
public class usercpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public usercpass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		String cnew_password = request.getParameter("cnew_password");
		
		if(!cnew_password.equals(new_password))
			response.sendRedirect("Changepassword.jsp?msg=notmatch");
		else
		{
			int check=0;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store","root","");
				Statement st=conn.createStatement();
				ResultSet rs=st.executeQuery("select *from user where email='"+email+"' and password='"+old_password+"'");
				while(rs.next())
				{
					check=1;
					st.executeUpdate("update user set password='"+new_password+"', cpassword='"+cnew_password+"' where email='"+email+"'");
					response.sendRedirect("login.jsp?msg=done");
				}
				if(check==0)
					response.sendRedirect("Changepassword.jsp?msg=wrong");
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	}

}

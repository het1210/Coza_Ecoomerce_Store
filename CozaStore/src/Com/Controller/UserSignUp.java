package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Com.Conn.ProjectConn;
import pojo.User;


@WebServlet("/UserSignUp")
public class UserSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserSignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		float contact = Float.parseFloat(request.getParameter("contact"));
		String password = request.getParameter("password");
		String cpassword=request.getParameter("cpassword");

		if (password.equals(cpassword)) {
			
		
		try {
			Connection con=ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from user where name=? OR email=?");
			st.setString(1, name);
			st.setString(2, email);
			ResultSet rs = st.executeQuery();
			
			if (rs.next()) {

				if (email.equals(email)) {

					/*request.setAttribute("msg", "Email Allready Use..!");
					request.getRequestDispatcher("registration.jsp").forward(request, response);*/
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			         out.println("<script language=JavaScript>");
			         out.println("$(document).ready(function(){");
			         out.println("swal({position: 'center',icon: 'info',title: 'Email Allready Use !',showCancelButton: false,showCofirmButton: false,timer: 4000});");
			         out.println("});");
			         out.println("</script>");
			         
			         RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
			         rd.include(request,response);
				}
				if (name.equals(name)) {

					/*request.setAttribute("msg", "Email Allready Use..!");
					request.getRequestDispatcher("registration.jsp").forward(request, response);*/
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			         out.println("<script language=JavaScript>");
			         out.println("$(document).ready(function(){");
			         out.println("swal({position: 'center',icon: 'info',title: 'Username Allready Use !',showCancelButton: false,showCofirmButton: false,timer: 4000});");
			         out.println("});");
			         out.println("</script>");
			         
			         RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
			         rd.include(request,response);
				}

			} else {

				User u = new User();
				Com.Dao.Dao dao = new Com.Dao.Dao();

				u.setName(name);
				u.setEmail(email);
				u.setContact(contact);
				u.setPassword(password);
				u.setCpassword(cpassword);

				dao.addUser(u);
				//response.sendRedirect("login.jsp");

				/*out.println("<script type=\"text/javascript\">");
				out.println("alert('User Registered Successfully');");
				out.println("location='login.jsp';");
				out.println("</script>");*/
				
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
		        out.println("<script language=JavaScript>");
		        out.println("$(document).ready(function(){");
		        out.println("swal({position: 'center',icon: 'success',title: 'Registered Successfully',  showConfirmButton: false, timer: 4000});");
		        out.println("});");
		        out.println("</script>");
		        
		        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		}else 
		{
			/*request.setAttribute("msg", "Password & Confirm Password Does Not Matched");
			request.getRequestDispatcher("registration.jsp").forward(request, response);*/
			
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
	         out.println("<script language=JavaScript>");
	         out.println("$(document).ready(function(){");
	         out.println("swal({position: 'center',icon: 'error',title: 'Password & Confirm Password Does Not Matched',  showConfirmButton: false, timer: 4000});");
	         out.println("});");
	         out.println("</script>");
	         
	         RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
	         rd.include(request,response);
		}
	}

}

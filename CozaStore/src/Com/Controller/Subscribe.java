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
import Com.Dao.Dao;
import pojo.User;

/**
 * Servlet implementation class Subscribe
 */
@WebServlet("/Subscribe")
public class Subscribe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Subscribe() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		request.getParameter("text/html");
		PrintWriter out = response.getWriter();

		Integer id = Integer.parseInt(request.getParameter("uid"));
		String email = request.getParameter("email");

		try {
			Connection con=ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from subscribe where email=?");
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (email.equals(email)) {

					/*request.setAttribute("msg", "Email Allready Use..!");
					request.getRequestDispatcher("index.jsp").forward(request, response);*/
					
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			         out.println("<script language=JavaScript>");
			         out.println("$(document).ready(function(){");
			         out.println("swal('Email Allready Use','','info');");
			         out.println("});");
			         out.println("</script>");
			         
			         RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			         rd.include(request,response);
				}

			} else {

				pojo.Subscribe s = new pojo.Subscribe();
				Dao d = new Dao();
				User u = d.getUserById(id);

				s.setEmail(email);
				s.setUser(u);

				d.addsubscribe(s);

				/*out.println("<script type=\"text/javascript\">");
				out.println("alert('Subscribe Submitted Successfully');");
				out.println("location='index.jsp';");
				out.println("</script>");
				out.close();*/
				
				 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
		         out.println("<script language=JavaScript>");
		         out.println("$(document).ready(function(){");
		         out.println("swal('Subscribe Submitted Successfully','','success');");
		         out.println("});");
		         out.println("</script>");
		         
		         RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		         rd.include(request,response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

package Com.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import pojo.User;
import Com.Dao.Dao;
import Com.Dao.UserDao;


/**
 * Servlet implementation class EditCategory
 */
@MultipartConfig
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	   
		User u = new User();
		Dao dao = new Dao();
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id=Integer.parseInt(request.getParameter("id"));
		
		u = dao.getUserById(id);
		HttpSession session = request.getSession();
		session.setAttribute("lists",u);
		response.sendRedirect("EditProfile.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email=request.getParameter("email");
		float contact=Float.parseFloat(request.getParameter("contact"));
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		
		u.setName(name);
		u.setEmail(email);
		u.setContact(contact);
		u.setPassword(cpassword);
		u.setCpassword(cpassword);
	
		
		UserDao.EditUser(u);
		
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	     out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	     out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
	     out.println("<script language=JavaScript>");
	     out.println("$(document).ready(function(){");
	     out.println("swal('Profile Edit Successfull','','success');");
	     out.println("});");
	     out.println("</script>");
	     
	     RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	     rd.include(request,response);
	}

	}

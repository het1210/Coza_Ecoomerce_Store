package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Com.Dao.Dao;
import pojo.Shipping;
import pojo.User;


@WebServlet("/AddShipping")
public class AddShipping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddShipping() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Integer id = Integer.parseInt(request.getParameter("uid"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city =request.getParameter("city");
		String state = request.getParameter("status");
		String zip=request.getParameter("zip");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		
		
		Dao dao = new Dao();
        Shipping s = new Shipping();
		
		/*Customer c = dao.getCustomerById(id);*/
		User u = dao.getUserById(id);
		
		s.setUser(u);
		s.setName(name);
		s.setAddress(address);
		s.setCity(city);
		s.setStatus(state);
		s.setZip(zip);
		s.setContact(contact);
		s.setEmail(email);
		
		dao.saveShipping(s);
		
		/*out.println("<script type=\"text/javascript\">");
		out.println("alert('Shiiping Address Added Successfully');");
		out.println("location='pay.jsp';");
		out.println("</script>");*/
		
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
        out.println("<script language=JavaScript>");
        out.println("$(document).ready(function(){");
        out.println("swal({position: 'center',icon: 'success',title: 'Shipping Address Added Successfully',  showConfirmButton: false, timer: 4000});");
        out.println("});");
        out.println("</script>");
        
        RequestDispatcher rd=request.getRequestDispatcher("pay.jsp");
        rd.include(request,response);

	}

}

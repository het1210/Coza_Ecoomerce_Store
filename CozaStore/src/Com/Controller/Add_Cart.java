package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Com.Conn.ProjectConn;
import Com.Dao.Dao;
import pojo.Product;
import pojo.User;

@WebServlet("/Add_Cart")
public class Add_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Dao dao = new Dao();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		Integer id = Integer.parseInt(request.getParameter("id"));
		String pname = request.getParameter("pname");
		Float price = Float.parseFloat(request.getParameter("price"));
		Integer qty = Integer.parseInt(request.getParameter("qty"));

		float total = qty * price;
		
		Integer pid=Integer.parseInt(request.getParameter("pid"));
		
		try {
			Connection con =ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from cart where pid=?");
			st.setInt(1, pid);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (pid.equals(pid)) {

					 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			         out.println("<script language=JavaScript>");
			         out.println("$(document).ready(function(){");
			         out.println("swal({position: 'center',icon: 'info',title: 'Product Allready Added in cart',  showConfirmButton: false, timer: 5000});");
			         out.println("});");
			         out.println("</script>");
			         
			         RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			         rd.include(request,response);
				}

			} else {

				Product p2 = dao.getProductByName(pname);
				User u = dao.getUserById(id);
				Product p1=dao.getProductById(pid);
				pojo.Cart c = new pojo.Cart();

				c.setUser(u);
				c.setProduct(p1);  //product id
				c.setPrice(price);
				c.setProduct(p2);
				c.setQty(qty);
				c.setTotal(total);

				dao.addCart(c);
				
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
		         out.println("<script language=JavaScript>");
		         out.println("$(document).ready(function(){");
		         out.println("swal({position:'center',icon:'success',title:'Product Added to Cart',showConfirmButton:false,timer:5000});");
		         out.println("});");
		         out.println("</script>");
		         
		         RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		         rd.include(request,response);
				
				try {
					Connection conn=ProjectConn.createConnection();
					PreparedStatement stmt = conn.prepareStatement("delete from wishlist where pid=?");
					stmt.setInt(1,pid);
					stmt.executeUpdate();
					 response.sendRedirect("index.jsp");
					
				} catch (Exception e) {
					System.out.println(e);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

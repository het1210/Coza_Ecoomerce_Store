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
import pojo.Product;
import pojo.User;
import pojo.Wishlist;

@WebServlet("/AddWishlist")
public class AddWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Com.Dao.Dao dao = new Com.Dao.Dao();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		Integer id = Integer.parseInt(request.getParameter("id"));
		String pname = request.getParameter("pname");
		Float price = Float.parseFloat(request.getParameter("price"));

		Integer pid = Integer.parseInt(request.getParameter("pid"));
		try {
			Connection con=ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from wishlist where pid=?");
			st.setInt(1, pid);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (pid.equals(pid)) {

					response.sendRedirect("wishlist.jsp?msg=wrong");

				}

			} else {

				Product p = dao.getProductByName(pname);
				Product p1 = dao.getProductById(pid);
				User u = dao.getUserById(id);

				Wishlist w = new Wishlist();

				w.setProduct(p1); // product id
				w.setProduct(p);
				w.setUser(u);
				w.setPrice(price);

				dao.addWishlist(w);

				
				response.sendRedirect("wishlist.jsp?msg=done");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

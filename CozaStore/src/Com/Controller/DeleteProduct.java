package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Com.Conn.ProjectConn;
import pojo.Category;
import pojo.Product;


@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		/*Dao dao = new Dao();
		Product p = new Product();
		p=dao.getProductById(id);
		dao.deleteProduct(p);*/
		
		try {

			Connection con=ProjectConn.createConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("delete from product where id='"+id+"'");
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('product Deleted Successfully');");
			out.println("location='showproduct.jsp';");
			out.println("</script>");

		} catch (Exception e) {
			e.printStackTrace();	
		}
		
		
		/*out.println("<script type=\"text/javascript\">");
	    out.println("alert('Product Deleted Successfully');");
		out.println("location='viewproduct.jsp';");
		out.println("</script>");*/
	}

}

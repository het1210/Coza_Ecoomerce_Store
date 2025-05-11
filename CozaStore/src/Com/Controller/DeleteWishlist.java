package Com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Com.Conn.ProjectConn;

/**
 * Servlet implementation class DeleteWishlist
 */
@WebServlet("/DeleteWishlist")
public class DeleteWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		 try {
         	
			 Connection con=ProjectConn.createConnection();
 			Statement stmt = con.createStatement();
 			stmt.executeUpdate("delete from wishlist where id='"+id+"'");
 			
 			
 		} catch (Exception e) {
 			System.out.println(e);
 		}
		 
		 response.sendRedirect("wishlist.jsp");
	}

}

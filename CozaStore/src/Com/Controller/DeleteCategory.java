
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


/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/DeleteCategory")
public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		Integer cid = Integer.parseInt(request.getParameter("id"));
		
		
		try {
			
			Connection con=ProjectConn.createConnection();
			Statement st = con.createStatement();
			st.executeUpdate("delete from category where cid='"+cid+"'");
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Category Deleted Successfully');");
			out.println("location='showcat.jsp';");
			out.println("</script>");

		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}

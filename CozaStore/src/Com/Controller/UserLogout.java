package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogoutServlet
 */
@WebServlet("/UserLogout")
public class UserLogout extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public UserLogout() {
        super();
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	response.setContentType("text/html");  
		PrintWriter out=response.getWriter();  
		
		request.getRequestDispatcher("index.jsp").include(request, response);  
		HttpSession session=request.getSession();  
		session.invalidate();  
		
		//out.print("You are successfully logged out!");  
		out.println("<script type=\"text/javascript\">");
		out.println("alert('You are successfully logged out!');");
		out.println("location='index.jsp';");
		out.println("</script>");
		
		out.close();  
}
}

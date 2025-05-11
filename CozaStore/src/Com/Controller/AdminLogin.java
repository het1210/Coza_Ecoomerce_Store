package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import pojo.Admin;

/**
 * Servlet implementation class UserLoginServlet
 */

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//String email = request.getParameter("email");
		String name=request.getParameter("name");
        String password = request.getParameter("password");
         
        Com.Dao.AdminDao dao = new Com.Dao.AdminDao();
         
        try {
            Admin admin = dao.checkLogin(name, password);
            String destPage = "admin_login.jsp";
             
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                destPage = "admin_index.jsp";
            } else {
                String message = "Invalid email/password";
                request.setAttribute("msg", message);
            }
             
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
             
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
}
}

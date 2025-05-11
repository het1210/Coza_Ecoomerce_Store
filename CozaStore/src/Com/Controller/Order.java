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

import pojo.Product;
import pojo.User;
import Com.Dao.Dao;



@WebServlet("/Orders")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Integer id = Integer.parseInt(request.getParameter("uid"));
		String pname = request.getParameter("product");
		Float amount = Float.parseFloat(request.getParameter("amount"));
		String date = request.getParameter("date");
		String status = request.getParameter("status");
		
		
		Dao dao = new Dao();
		pojo.Order o = new pojo.Order();
		Product p2 = dao.getProductByName(pname);
        User u = dao.getUserById(id);
                
		o.setUser(u);
        o.setProduct(p2);
        o.setOrderDate(date);
        o.setAmount(amount);
        o.setStatus(status);
        
        
        dao.saveOrder(o);
        
		
		response.sendRedirect("Done-order.jsp");
		
		 /*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
         out.println("<script language=JavaScript>");
         out.println("$(document).ready(function(){");
         out.println("swal('Your Order Placed','','success');");
         out.println("});");
         out.println("</script>");
         
         RequestDispatcher rd=request.getRequestDispatcher("Done-order.jsp");
         rd.include(request,response);*/
		
	}
}

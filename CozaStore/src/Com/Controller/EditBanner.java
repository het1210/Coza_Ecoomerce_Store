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

import pojo.Banner;
import Com.Dao.Dao;


/**
 * Servlet implementation class EditCategory
 */
@MultipartConfig
@WebServlet("/EditBanner")
public class EditBanner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	  
		Banner b = new  Banner();
		Dao dao = new Dao();
    public EditBanner() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id=Integer.parseInt(request.getParameter("id"));
		
		b = dao.getBannerById(id);
		HttpSession session = request.getSession();
		session.setAttribute("list",b);
		response.sendRedirect("updateBanner.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		Part part=request.getPart("bimage");
	
		
		
		b.setName(name);
		b.setBimage(part.getSubmittedFileName());
	
		dao.EditBanner(b);
		
		String path = request.getRealPath("images")+File.separator+"products"+File.separator+part.getSubmittedFileName();
		System.out.println(path);
		
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = part.getInputStream();
		
		// reading data
		
		byte [] data = new byte[is.available()];
		is.read(data);
		
		// writing data
		
		fos.write(data);
		fos.close();
		

		
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	     out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	     out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
	     out.println("<script language=JavaScript>");
	     out.println("$(document).ready(function(){");
	     out.println("swal('Category Edit Successfull','','success');");
	     out.println("});");
	     out.println("</script>");
	     
	     RequestDispatcher rd=request.getRequestDispatcher("showsliderz.jsp");
	     rd.include(request,response);
	}

	}

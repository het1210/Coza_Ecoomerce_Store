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
import javax.servlet.http.Part;



import pojo.Banner;
import pojo.Category;

/**
 * Servlet implementation class AddCategory
 */
@MultipartConfig
@WebServlet("/Addpic")
public class Addpic extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Addpic() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getParameter("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		Part bimage=request.getPart("bimage");
		
		Banner b = new Banner();
		
		b.setName(name);
		b.setBimage(bimage.getSubmittedFileName());
		
		Com.Dao.Dao dao = new Com.Dao.Dao();
		dao.saveimage(b);
		
		String path = request.getRealPath("images")+File.separator+"products"+File.separator+bimage.getSubmittedFileName();
		System.out.println(path);
		
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = bimage.getInputStream();
		
		// reading data
		
		byte [] data = new byte[is.available()];
		is.read(data);
		
		// writing data
		
		fos.write(data);
		fos.close();
		
		 //response.sendRedirect("addcategory.jsp");
		 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	     out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	     out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
	     out.println("<script language=JavaScript>");
	     out.println("$(document).ready(function(){");
	     out.println("swal('Image Added Successfull','','success');");
	     //out.println("location='Add_Category.jsp';");
	     out.println("});");
	     out.println("</script>");
	     
	     RequestDispatcher rd=request.getRequestDispatcher("siderz.jsp");
	     rd.include(request,response);
	}
}

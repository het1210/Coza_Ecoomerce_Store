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

import okhttp3.Request;
import pojo.Category;
import pojo.Product;



@MultipartConfig
@WebServlet("/addproduct")
public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public addproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getParameter("text/html");
		PrintWriter out = response.getWriter();
		
		String product = request.getParameter("productName");
		Part image1=request.getPart("image1");
		Part image2=request.getPart("image2");
		Part image3=request.getPart("image3");
		Double weight=Double.parseDouble(request.getParameter("weight"));
		String dimensions=request.getParameter("dimensions");
		Integer materials=Integer.parseInt(request.getParameter("materials"));
		String size=request.getParameter("size");
		String color=request.getParameter("color");
		Integer qty = Integer.parseInt(request.getParameter("qty"));
		float price = Float.parseFloat(request.getParameter("price"));
		String category = request.getParameter("category");
		String des =request.getParameter("description");
		
		Product p=new Product();
		Com.Dao.Dao dao = new Com.Dao.Dao();
		Category c = dao.getCategoryByName(category);
		
		
		p.setProductName(product);
        p.setImage1(image1.getSubmittedFileName());
        p.setImage2(image2.getSubmittedFileName());
        p.setImage3(image3.getSubmittedFileName());
        p.setWeight(weight);
        p.setDimensions(dimensions);
        p.setMaterials(materials);
        p.setSize(size);
        p.setColor(color);
        p.setQty(qty);
        p.setPrice(price);
        p.setCategory(c);
        p.setDescription(des);
		   
		
        dao.addProduct(p);
		
		String path = request.getRealPath("images")+File.separator+"products"+File.separator+image1.getSubmittedFileName();
		System.out.println(path);
		
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = image1.getInputStream();
		
		// reading data
		
		byte [] data = new byte[is.available()];
		is.read(data);
		
		// writing data
		
		fos.write(data);
		fos.close();
		
		
		String path1 = request.getRealPath("images")+File.separator+"products"+File.separator+image2.getSubmittedFileName();
		System.out.println(path1);
		
		FileOutputStream fos1 = new FileOutputStream(path1);
		InputStream is1 = image2.getInputStream();
		
		// reading data
		
		byte [] data2 = new byte[is1.available()];
		is1.read(data2);
		
		// writing data
		
		fos1.write(data2);
		fos1.close();
		

		String path2 = request.getRealPath("images")+File.separator+"products"+File.separator+image3.getSubmittedFileName();
		System.out.println(path2);
		
		FileOutputStream fos2 = new FileOutputStream(path2);
		InputStream is2 = image3.getInputStream();
		
		// reading data
		
		byte [] data3 = new byte[is2.available()];
		is2.read(data3);
		
		// writing data
		
		fos2.write(data3);
		fos2.close();
		

		
		
		 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	     out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	     out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
	     out.println("<script language=JavaScript>");
	     out.println("$(document).ready(function(){");
	     out.println("swal('Product Added Successfull','','success');");
	     out.println("});");
	     out.println("</script>");
	     
	     RequestDispatcher rd=request.getRequestDispatcher("addproduct.jsp");
	     rd.include(request,response);
		
	}

}

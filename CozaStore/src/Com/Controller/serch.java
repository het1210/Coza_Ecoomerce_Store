package Com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Category;
import pojo.Product;
import Com.Dao.Dao;

import com.mysql.jdbc.ResultSetMetaData;
import com.sun.mail.iap.Response;

/**
 * Servlet implementation class serch
 */
@WebServlet("/serch")
public class serch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	Dao dao = new Dao();

	public serch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		/*PreparedStatement st=null;
        try {
        	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobile_store", "root", "");
            System.out.println("connected!.....");
            String productName = request.getParameter("productName");
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "select * from product";
            if(productName!=null && !productName.equals("")){
                query = "select * from product where productName=?";
            }
            System.out.println("query " + query);
            st = (PreparedStatement) con.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            

            while (rs.next()) {
                al = new ArrayList();

                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                System.out.println("al :: " + al);
                pid_list.add(al);
            }

            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("shop.jsp");
            view.forward(request, response);
            con.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "getting records from database through servlet controller";
    }// </editor-fold>
*/
	
	
	
	
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "mobile_store";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root";
    String password = "";
    Statement st=null;
    try {
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url + dbName, userName, password);
        System.out.println("connected!.....");
        String productName = request.getParameter("productName");
        ArrayList al = null;
        ArrayList pid_list = new ArrayList();
        String query = "select * from product";
        if(productName!=null && !productName.equals("")){
            query = "select * from product where productName="+productName+"' ";
        }
        System.out.println("query " + query);
        st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            al = new ArrayList();

            al.add(rs.getString(1));
            al.add(rs.getString(2));
            al.add(rs.getString(3));
            al.add(rs.getString(4));
            System.out.println("al :: " + al);
            pid_list.add(al);
        }

        request.setAttribute("piList", pid_list);
        RequestDispatcher view = request.getRequestDispatcher("shop.jsp");
        view.forward(request, response);
        conn.close();
        System.out.println("Disconnected!");
    } catch (Exception e) {
        e.printStackTrace();
    }
}

@Override
public String getServletInfo() {
    return "getting records from database through servlet controller";
}// </editor-fold>
}
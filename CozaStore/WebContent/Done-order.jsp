<%@page import="pojo.Order"%>
<%@page import="pojo.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Com.Dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Done</title>
<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<link rel="stylesheet" href="assets/css/order.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>
<div class="card mt-50 mb-50">
<%
						Dao dao = new Dao();
						List<Order> list = dao.viewOrder();
						session.setAttribute("o", list);
					%>
    <div class="col d-flex"><span class="text-muted" id="orderno">Order Id ${list.orderId}</span></div>
    <div class="gap">
        <div class="col-2 d-flex mx-auto"> </div>
    </div>
    <div class="title mx-auto"> Thank you for your order! </div>
    <div class="main"> <span id="sub-title">
            <p><b>Payment Summary</b></p>
        </span>
        <%
					int c = 1;
					Dao dao2 = new Dao();
					List<Cart> list2 = dao2.viewCart();
					session.setAttribute("id", list2);
				%>
        <%! int id=0; %>
		<c:forEach var="c" items="${id}">
        <div class="row row-main">
            <div class="col-3"> <img class="img-fluid" src="images/products/${c.product.image1 } "> </div>
            <div class="col-6">
                <div class="row d-flex">
                    <p><b>${c.product.productName}</b></p>
                </div>
                <div class="row d-flex">
                    <p class="text-muted">Size: ${p.size}</p>
                </div>
            </div>
            <div class="col-3 d-flex justify-content-end">
                <p><b>&#8377;${c.price}</b></p>
            </div>
        </div>
        </c:forEach>
        
        <hr>
        <div class="total">
            <div class="row">
                <div class="col"> <b> Shipping :</b> </div>
                <div class="col d-flex justify-content-end"> <b>&#8377; <%= shippings %></b> </div>
            </div> 
            <div class="row">
                <div class="col"> <b> Total :</b> </div>
                <div class="col d-flex justify-content-end"> <b><%!int shippings = 150;
														int Countruns = 0;%> 
														<%
													 	try {
													 		Class.forName("com.mysql.jdbc.Driver").newInstance();
													 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store", "root", "");
													 		Statement st = con.createStatement();
													 		String strQuery = "SELECT SUM(total) FROM cart";
													 		ResultSet rs = st.executeQuery(strQuery);
													
													 		float Countrun = 0;
													 		while (rs.next()) {
													 			Countrun = rs.getFloat(1);
													 			out.println(Countrun + shippings);
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %></b> </div>
            </div> 
            <button style="margin:50px; background-color: transparent; color:white; background-color: #717fe0;" class="btn btn"><a style="color: white;" href="my-order.jsp">Track your order <i class="fa-regular fa-angles-right"></i> </a> </button>
        </div>
    </div>
</div>
</body>
</html>
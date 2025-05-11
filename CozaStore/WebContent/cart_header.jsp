<%@page import="pojo.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Dao.Dao"%>
<%@page import="pojo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart 
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			<%
							int b=1;
							Dao dao1 = new Dao();
							List<Cart> list1 = dao1.viewCart();
							session.setAttribute("id", list1);
						%> 
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
				<c:forEach items="${id}" var="p">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
						<a href="product-detail.jsp?id=${p.id}">
							<img src="images/products/${p.product.image1}" alt="IMG">
						</a>
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="product-detail.jsp?id=${p.product.id}" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								${p.product.productName}
							</a>

							<span class="header-cart-item-info">
								${p.total}
								<a onclick="return confirmation<% out.print(b); %>()" class="trash-icon">&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-trash-alt"></i>
							</a>
							</span>
						</div>
					</li>
		<script type="text/javascript">
			function confirmation<% out.print(b); %>() {
				swal({
					  title: "Are you sure?",
					  text: "Once deleted, you will not be able to recover this product!",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then(function(willDelete) {
					  if (willDelete) {
						  window.location.href= "DeleteCart?id=${p.id}",
					    swal("Your product has been deleted!",
					   {
					      icon: "success",
					      showCancelButton: false,
					    });
					  } else {
					    swal("Your product is safe!");
					  }
					});
				  }
	</script>
	
	<% b++; %>
					</c:forEach>
				</ul>
				<%
						if (list1.size() == 0) {
					%>
					<h3 align="center">You'r Cart is empty</h3>
					<%
						}
					%>
				
				<div class="w-full">
					

				<%
					if (list1.size() == 0) {
				%>
				<div class="header-cart-buttons flex-w w-full">
					<a href="product.jsp"
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
						Continue Shopping </a>
				</div>
				<%
					} else {
				%>
				<div class="header-cart-total w-full p-tb-40">
						Total: <%
						try {
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store", "root", "");
							Statement st = con.createStatement();
							String strQuery = "SELECT SUM(total) FROM cart";
							ResultSet rs = st.executeQuery(strQuery);

							Double Countrun;
							while (rs.next()) {
								Countrun = rs.getDouble(1);
								out.println(Countrun);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					</div>
					
				<div class="header-cart-buttons flex-w w-full">
					<!-- <a href="shoping-cart.jsp" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a> -->

					<a href="checkout.jsp"
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
						Check Out </a>
				</div>

				<%
					}
				%>

			</div>
			</div>
		</div>
	</div>
	
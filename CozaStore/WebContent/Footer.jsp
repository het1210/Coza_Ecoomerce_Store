<%@page import="pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="Com.Dao.Dao"%>
<%@page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
      
        
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>      
  
    
    <%
			User user1=(User)session.getAttribute("user");    
    %>
	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Categories
					</h4>
					<c:forEach items="${category}" var="c">
					<ul>
						<li class="p-b-10">
							<a href="product.jsp?cid=${c.cid}" class="stext-107 cl7 hov-cl1 trans-04">
								${c.category}
							</a>
						</li>
					</ul>
					</c:forEach>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Help
					</h4>

					<ul>
						<li class="p-b-10">
						<%if(user1 !=null) {%>
							<a href="logout.jsp" class="stext-107 cl7 hov-cl1 trans-04">
								Logout
							</a>
							<%}else{ %>
							<a href="login.jsp" class="stext-107 cl7 hov-cl1 trans-04">
								Login
							</a>
							<%} %>
						</li>

						<li class="p-b-10">
							<a href="contact.jsp" class="stext-107 cl7 hov-cl1 trans-04">
								Contact 
							</a>
						</li>

						<li class="p-b-10">
							<a href="#cart"  class="stext-107 cl7 hov-cl1 trans-04 js-show-cart">
								Cart
							</a>
						</li>

						<li class="p-b-10">
							<a href="wishlist.jsp" class="stext-107 cl7 hov-cl1 trans-04">
								Wishlist
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						GET IN TOUCH
					</h4>

					<p class="stext-107 cl7 size-201">
						Any questions? Let us know in store at Coza Store Center 8th floor, 379 Amber Tower, Ahmdabad, 380010 or call us on (+91) 9724579296
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa-brands fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa-brands fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa-brands fa-pinterest-p"></i>
						</a>
					</div>
				</div>
			<%
				if (user1 != null) {
			%>
			<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>
				<%
					if (request.getAttribute("msg") != null) {
							out.println(request.getAttribute("msg"));
						}
				%>
				<form action="Subscribe" method="post">
						<div class="wrap-input1 w-full p-b-4">
						<input type="hidden" name="uid" value="${user.id}">
							<input class="input1 bg-none plh1 stext-107 cl7" value="${user.email}" type="email" name="email" title="Please Enter Email" placeholder="coza34@store.com" required="required">
							<div class="focus-input1 trans-04"></div>
						</div>
						
						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form>
				</div>

			<%
				} else {
			%>
			<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>

					<form action="Subscribe" method="post">
						<div class="wrap-input1 w-full p-b-4">
						<input type="hidden" name="uid" value="${user.id}">
							<input class="input1 bg-none plh1 stext-107 cl7" value="${user.email}" type="email" name="email" title="Please Enter Email" placeholder="coza34@store.com" required="required">
							<div class="focus-input1 trans-04"></div>
						</div>
						
						<div class="p-t-18">
							<button onclick="return confirmations()" type="reset" class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form>
				</div>
			<%
				}
			%>
		</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>
				<script src="https://apis.google.com/js/platform.js"></script>

			<div class="g-ytsubscribe" data-channel="GoogleDevelopers"
				data-layout="default" data-count="hidden"></div>

			<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Developer <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="#" target="_blank">Coza store</a> &amp; distributed by <a href="#" target="_blank">Coza</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>
	<script src="js/F-login.js"></script>
	
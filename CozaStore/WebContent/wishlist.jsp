<%@page import="pojo.Wishlist"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Wishlist Cart</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="css/WhatsApp.css">
	<link rel="stylesheet" href="css/wish.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<!-- Header -->
	<%@include file="header.jsp" %>
	
	<!-- Cart -->
	<br><br>
	<%@include file="cart_header.jsp" %>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Wishlist Cart
			</span>
		</div>
	</div>
		<%
				int ab=1;
			 	Dao dao4 = new Dao();
			 	List<Wishlist> list3 = dao4.viewWishlist();
			 	session.setAttribute("id", list3);
			 %>
			
	<!-- Shoping Cart -->
	<div class="cart-wrap">
		<div class="container">
		 <%
			String msg = request.getParameter("msg");
			if ("wrong".equals(msg)) {
		%>
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<strong> Product</strong> Allready Added in Wishlist.
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
			}
		%>
		<%
			if ("done".equals(msg)) {
		%>
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<strong> Product</strong> Add to Wishlist.
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
			}
		%>
		
	        <div class="row">
			    <div class="col-md-12">
			        <div class="table-wishlist">
			        <form action="Add_Cart" method="post">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        	<thead>
					        	<tr>
					        		<th width="35%">Product Name</th>
					        		<th width="15%">Unit Price</th>
					        		<th width="15%" >Add to cart</th>
					        		<th width="15%" class="text-center">Trash</th>
					        	</tr>
					        </thead>
					        <tbody>
					        <%! int id=0; %>
						<c:forEach items="${id}" var="w">
					        	<tr>
					        		<td width="35%">
					        			<div class="display-flex align-center">
		                                    <div class="img-product">
		                                    	<a <%-- href="product-detail.jsp?id=${p.product.id}" --%>>
		                                     <img src="images/products/${w.product.image1}" alt="" class="mCS_img_loaded">
		                                   		</a>
		                                    </div>
		                                    <div class="name-product">
		                                    <a style="color: black;" <%-- href="product-detail.jsp?id=${p.product.id}" --%>>
		                                       ${w.product.productName}
		                                    </a>
		                                       <input type="hidden" name="pname" value="${w.product.productName}">
		                                    </div>
	                                    </div>
	                                </td>
					        		<td width="15%" class="price">&#8377; ${w.price}
					        			<input type="hidden" name="price" value="${w.price}">
					        		</td>
											<%
												
											%>

								<td width="15%">
									 <input type="hidden" name="qty" id="qty"  value="1" min="1" max="10" step="1" data-decimals="0" >
									 	<input type="hidden" name="qty" value="${w.product.qty}">
											<input type="hidden" name="id" value="${user.id}">
											 <input type="hidden" name="pid" value="${w.product.id}"> <!--product id in cart -->
	                                     		<input type="hidden" name="user" value="${user.name}"> 
	                                  

											<%
												if (user != null) {
											%>
											<button
													class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">Add
													to Cart</button>
											<%
												} else {
											%>
											<a href="login.jsp" 
													class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">Add
													to Cart</a>

											<%
												}
											%>
								</td>
					        		<td width="10%" class="text-center"><a onclick="return confirmation<% out.print(a); %>()" <%-- href="DeleteWishlist?id=${w.id}" --%> class="trash-icon"><i class="far fa-trash-alt"></i></a></td>
					        	</tr>
					        	<script type="text/javascript">
						function confirmation<% out.print(a); %>() {
						swal({
							  title: "Are you sure?",
							  text: "Once deleted, you will not be able to recover this imaginary file!",
							  icon: "warning",
							  buttons: true,
							  dangerMode: true,
							})
							.then(function(willDelete) {
							  if (willDelete) {
								  window.location.href= "DeleteWishlist?id=${w.id}",
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
	<% ab++; %>
					    </c:forEach>
				        	</tbody>
				        </table>
				        </form><br>
				        <%
					if(list3.size() == 0){
				%>
					<h3 align="center">No Items in this Wishlist</h3>
				<%
					}
				%>
				    </div>
			    </div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="Footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="js/F-login.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
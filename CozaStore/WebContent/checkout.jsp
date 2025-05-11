<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Checkout</title>
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
				Check Out
			</span>
		</div>
	</div>
	
		<!-- Shoping Cart -->
	<form action="AddShipping" method="post" class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<%
					int c = 1;
					Dao dao2 = new Dao();
					List<Cart> list2 = dao2.viewCart();
					session.setAttribute("id", list2);
				%>
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Image</th>
									<th class="column-2">Product Name</th>
									<th class="column-3">Price</th>
									<th class="column-4">Qty</th>
									<th class="column-5">Total</th>
									<th class="column-6">Remove</th>
								</tr>
								<%! int id=0; %>
									<c:forEach var="c" items="${id}">
								<tr class="table_row">
									<td class="column-1">
										<div class="" style='margin-right:20px'>
											<img style="width:100%" src="images/products/${c.product.image1 } " alt="IMG">
										</div>
									</td>
									<td class="column-2">${c.product.productName}</td>
									<td class="column-3">&#8377; ${c.price}</td>
									<td class="column-4">${c.qty}</td>
									
									<td class="column-5">&#8377; ${c.total}</td>
									<td class="column-6"><%-- <a href="DeleteCart?id=${c.id}" class="trash-icon"> --%>
									<a onclick="return confirmation<% out.print(c); %>()"><i class="far fa-trash-alt"></i></a></td>
								</tr>
								<script type="text/javascript">
			function confirmation<% out.print(c); %>() {
						swal({
							  title: "Are you sure?",
							  text: "Once deleted, you will not be able to recover this imaginary file!",
							  icon: "warning",
							  buttons: true,
							  dangerMode: true,
							})
							.then(function(willDelete) {
							  if (willDelete) {
								  window.location.href= "DeleteCart?id=${c.id}",
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
	<% c++; %>
								</c:forEach>
								
							</table>
						</div>

					</div>
				</div>
				
				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Cart Totals
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									Subtotal:
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2">
									&#8377; <%
													 	try
													 {
													     Class.forName("com.mysql.jdbc.Driver").newInstance();
													 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store", "root", "");
													 		Statement st = con.createStatement();
													 		String strQuery = "SELECT SUM(total) FROM cart";
													 		ResultSet rs = st.executeQuery(strQuery);
													
													 		float Countrun = 0;
													 		while (rs.next()) {
													 			Countrun = rs.getFloat(1);
													 			out.println(Countrun);
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %>
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Shipping Address:
								</span>
							</div>

								<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<div class="p-t-15">
								<div class="bor8 bg0 m-b-12">
										<input type="hidden" name="uid" value="${user.id}">
										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" value="${user.name}" name="name" required="required" placeholder="Enter Name">
									</div>
									<div class="bor8 bg0 m-b-12">
										<textarea input class="stext-111 cl8 plh3 size-111 p-lr-15"  type="text" name="address" required="required" placeholder="Enter Address"></textarea>
									</div>
									<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
										<select class="js-select2" name="city" required="required">
											<option>Select a City...</option>
											<option>PALANPUR</option>
											<option>AHAMDABAD</option>
											<option>PUNE</option>
											<option>RAJASTHAN</option>
											<option>HADRABAD</option>
											<option>UP</option>
											<option>MUMBAI</option>
											<option>SURAT</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>

									<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
										<select class="js-select2" name="status" required="required">
											<option>Select a State...</option>
											<option>GUJARAT</option>
											<option>KERALA</option>
											<option>PANJAB</option>
											<option>GOA</option>
											<option>BIHAR</option>
											<option>UTTAR PRADESH</option>
											<option>MAHARASHTRA</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>

									<div class="bor8 bg0 m-b-22">
										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" required="required" name="zip" placeholder="Postcode/Zip">
									</div>
									
									<div class="bor8 bg0 m-b-22">
										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" required="required"  name="contact" placeholder="Contact">
									</div>
									
									<div class="bor8 bg0 m-b-22">
										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="email" required="required" name="email" value="${user.email}" placeholder="Email">
									</div>
									
								</div>
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
						<div class="size-208">
								<span class="mtext-101 cl2">
									Shipping:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									&#8377; <%= shipping %>
								</span>
							</div>
							<br><br>
							<div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									 &#8377; <%!
												int shipping=150;
												    int Countrun = 0;%>
												     <%
													 	try
													 {
													     Class.forName("com.mysql.jdbc.Driver").newInstance();
													 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store", "root", "");
													 		Statement st = con.createStatement();
													 		String strQuery = "SELECT SUM(total) FROM cart";
													 		ResultSet rs = st.executeQuery(strQuery);
													
													 		float Countrun = 0;
													 		while (rs.next()) {
													 			Countrun = rs.getFloat(1);
													 			out.println(Countrun + shipping);
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %>
								</span>
							</div>
						</div>

						<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							Add Shipping
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
		
	
		

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
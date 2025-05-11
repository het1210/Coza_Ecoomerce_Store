<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Pay</title>
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
				Pay
			</span>
		</div>
	</div>
		

	<!-- Shoping Cart -->
		<%
			LocalDateTime now = LocalDateTime.now();
			System.out.println("Before Formatting: " + now);
			DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
			String formatDateTime = now.format(format);
		%>
		<div class="container">
			<div class="row">

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
									<%!int shipping = 150;
														int Countrun = 0;%> 
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
													 			out.println(Countrun + shipping);
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %>
								</span>
							</div>
						</div>
						<input type="hidden" name="uid" value="${user.id}">
												<input type="hidden" name="cid" value="${user.id}">
										<button id="rzp-button1" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
									Pay Now
										</button>
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
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript">
	var options = {
		    "key": "rzp_test_BFuqGW7IZkVybQ", // Enter the Key ID generated from the Dashboard
		    "amount": <%!int shippings = 150;
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
			 			out.println((Countrun + shipping)*100);
			 		}
			 	} catch (Exception e) {
			 		e.printStackTrace();
			 	}
			 %>, 
			 // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
		    "currency": "INR",
		    "name": "Coza Store",
		    "description": "Test Transaction",
		    "image": "images/icons/logo-01.png",
		   // "order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
		     "handler": function (response){
		    	 window.location.href= "order.jsp",
		    	 swal("Coza Store","Payment Successfully","success"
		    			 
		    	 
		    	 );
		    	 
		    	}, 
		   //"callback_url": "order.jsp",
		    "prefill": {
		        "name": "D Husain",
		        "email": "dilshadghogha123@gmail.com",
		        "contact": "9724579296"
		    },
		    "notes": {
		        "address": "Razorpay Corporate Office"
		    },
		    "theme": {
		        "color": "#7b88e3"
		    }
		};
		var rzp1 = new Razorpay(options);
		document.getElementById('rzp-button1').onclick = function(e){
		    rzp1.open();
		    e.preventDefault();
		}</script>
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
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>
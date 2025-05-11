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
	
	<link rel="stylesheet" media="screen" href="vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="vendor/tiny-slider/dist/tiny-slider.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="css/theme.min.css">
    
    
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

	<!-- Shoping Cart -->
	<div class="container py-5 mb-2 mb-md-3">
        <!-- Details-->
        <div class="row gx-4 mb-4">
          <div class="col-md-4 mb-2">
            <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Shipped via:</span>UPS Ground</div>
          </div>
          <div class="col-md-4 mb-2">
            <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Status:</span>Processing order</div>
          </div>
          <div class="col-md-4 mb-2">
            <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Expected date:</span>October 15, 2019</div>
          </div>
        </div>
        <!-- Progress-->
        <div class="card border-0 shadow-lg">
          <div class="card-body pb-2">
            <ul class="nav nav-tabs media-tabs nav-justified">
              <li class="nav-item">
                <div class="nav-link completed">
                  <div class="d-flex align-items-center">
                    <div class="fa-thin fa-check"><i class="fa-thin fa-bag-shopping"></i></div>
                    <div class="ps-3">
                      <div class="media-tab-subtitle text-muted fs-xs mb-1">First step</div>
                      <h6 class="media-tab-title text-nowrap mb-0">Order placed</h6>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item">
                <div class="nav-link active">
                  <div class="d-flex align-items-center">
                    <div class="media-tab-media"><i class="fa-thin fa-gear"></i></div>
                    <div class="ps-3">
                      <div class="media-tab-subtitle text-muted fs-xs mb-1">Second step</div>
                      <h6 class="media-tab-title text-nowrap mb-0">Processing order</h6>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item">
                <div class="nav-link">
                  <div class="d-flex align-items-center">
                    <div class="media-tab-media"><i class="fa-thin fa-star"></i></div>
                    <div class="ps-3">
                      <div class="media-tab-subtitle text-muted fs-xs mb-1">Third step</div>
                      <h6 class="media-tab-title text-nowrap mb-0">Quality check</h6>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item">
                <div class="nav-link">
                  <div class="d-flex align-items-center">
                    <div class="media-tab-media"><i class="fa-thin fa-cube"></i></div>
                    <div class="ps-3">
                      <div class="media-tab-subtitle text-muted fs-xs mb-1">Fourth step</div>
                      <h6 class="media-tab-title text-nowrap mb-0">Product dispatched</h6>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <!-- Footer-->
        <div class="d-sm-flex flex-wrap justify-content-between align-items-center text-center pt-4">
          <div class="form-check mt-2 me-3">
            <input class="form-check-input" type="checkbox" id="notify-me" checked>
            <label class="form-check-label" for="notify-me">Notify me when order is delivered</label>
          </div><a class="btn btn-primary btn-sm mt-2" href="#order-details" data-bs-toggle="modal">View Order Details</a>
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
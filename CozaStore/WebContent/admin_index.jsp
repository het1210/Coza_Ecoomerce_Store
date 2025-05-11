<%@page import="Com.Conn.ProjectConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="admin/assets/"
  data-template="vertical-menu-template-free"
>
  
<!-- Mirrored from somoorish.com.au/admin/index.php?name=admin by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 31 Dec 2022 06:23:32 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Admin Panel</title>

    <meta name="description" content="" />

    <!-- Favicon -->
   <link rel="shortcut icon" href="admin/assets/img/favicon.png" type="image/x-icon">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
      rel="stylesheet"
    />
    <script src="../../ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="admin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="admin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="admin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="admin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="admin/assets/vendor/libs/apex-charts/apex-charts.css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Page CSS -->

    <!-- Helpers -->
                                                                                                                                                                                                                                                                                                                                                                                                        
    <script src="admin/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="admin/assets/js/config.js"></script>
         <link rel="stylesheet" type="text/css" href="../../maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="../../cdn.datatables.net/1.12.1/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="../../cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="../../cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">

      <link rel="stylesheet" href="../../cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link href="../../cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
       
  </head>

  <body>
		<%@include file="admin_header.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">

              <div class="row">
                         
                         <div class="col-xl-3 col-md-6">
                                <!-- card -->
                                <div class="card card-h-100">
                                    <!-- card body -->
                                    <div class="card-body" id="carditem">
                                        <div class="row align-items-center">
                                            <div class="col-6">
                                            <a style="color: black;" href="showcat.jsp">
                                                <span class="text-muted mb-3 lh-1 d-block text-truncate">Categorys</span>
                                                </a>
                                               <h4 class="mb-3">
                                                     <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM category";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>+
                                                </h4> 
                                            </div>

                                            <div class="col-6">
                                                 <i class="fa-solid fa-bag-shopping" style="font-size: 32px; padding-left: 40px; color: #f48e7ce6;"></i>
                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div><!-- end card -->
                            </div><!-- end col -->
                         
                            <div class="col-xl-3 col-md-6">
                                <!-- card -->
                                <div class="card card-h-100">
                                    <!-- card body -->
                                    <div class="card-body" id="carditem">
                                        <div class="row align-items-center">
                                            <div class="col-6">
                                            <a style="color: black;" href="showproduct.jsp">
                                                <span class="text-muted mb-3 lh-1 d-block text-truncate">Products</span>
                                                </a>
                                                <h4 class="mb-3">
                                                
                                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM product";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>+
                                                    
                                                </h4> 
                                                <!-- <span class="counter-value" data-target="12">0</span>+ -->
                                            </div>

                                            <div class="col-6">
                                                 <i class="fa-brands fa-product-hunt" style="font-size: 32px; padding-left: 40px; color: #f48e7ce6;"></i>
                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div><!-- end card -->
                            </div><!-- end col -->
        
                           <div class="col-xl-3 col-md-6">
                                <!-- card -->
                                <div class="card card-h-100" >
                                    <!-- card body -->
                                    <div class="card-body" id="carditem">
                                        <div class="row align-items-center">
                                            <div class="col-6">
                                            <a style="color: black;" href="shipping.jsp">
                                                <span class="text-muted mb-3 lh-1 d-block text-truncate">Shipping</span>
                                               </a>
                                           <h4 class="mb-3">
                                                    <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM shipping";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>+
                                                </h4> 
                                            </div>

                                            <div class="col-6">
                                                 <i class="fas fa-shopping-cart" style="font-size: 32px; padding-left: 40px; color: #f48e7ce6;"></i>
                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div><!-- end card -->
                            </div><!-- end col -->
        
        
                         <div class="col-xl-3 col-md-6">
                                <!-- card -->
                                <div class="card card-h-100">
                                    <!-- card body -->
                                    <div class="card-body" id="carditem">
                                        <div class="row align-items-center">
                                            <div class="col-6">
                                            <a style="color: black;" href="showsubscriber.jsp">
                                                <span class="text-muted mb-3 lh-1 d-block text-truncate">Subscribe</span>
                                               </a>
                                            <h4 class="mb-3">
                                                     <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM subscribe";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>+
                                                </h4> 
                                            </div>

                                            <div class="col-6">
                                                 <i class="fa-solid fa-bell" style="font-size: 32px; padding-left: 40px; color:#f48e7ce6;"></i>
                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div><!-- end card -->
                            </div><!-- end col -->
                        </div><!-- end row-->  </div>
   </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
               
              
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

   
    <!-- Core JS -->
    <!-- build:js admin/assets/vendor/js/core.js -->
    <script src="admin/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="admin/assets/vendor/libs/popper/popper.js"></script>
    <script src="admin/assets/vendor/js/bootstrap.js"></script>
    <script src="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="admin/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="admin/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="admin/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="../../buttons.github.io/buttons.js"></script>
     <script type="text/javascript" src="../../code.jquery.com/jquery-3.5.1.js"></script>
     <script src="../../unpkg.com/sweetalert%402.1.2/dist/sweetalert.min.js"></script>
     <script src="../../cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/js/select2.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/1.12.1/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
        var table = $('#example').DataTable( {
            responsive: true
        } );

       var catji = $('#catres').DataTable( {
            responsive: true
        } );

        var subcatji = $('#subcatres').DataTable( {
            responsive: true
        } );


    new $.fn.dataTable.FixedHeader( table );
    new $.fn.dataTable.FixedHeader( catji );
    new $.fn.dataTable.FixedHeader( subcatji );
} );
    </script>


  </body>

<!-- Mirrored from somoorish.com.au/admin/index.php?name=admin by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 31 Dec 2022 06:23:57 GMT -->
</html>

<%@page import="pojo.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	Admin admin = (Admin) session.getAttribute("admin");

	if (admin == null) {
		response.sendRedirect("admin_login.jsp");
	}
%>
<% 
String uri = request.getRequestURI();
String pageName = uri.substring(uri.lastIndexOf("/")+1);
String a="index";
switch(pageName){
case "admin_index.jsp":
	a = "index";
	break;
case "addcat.jsp":
	a = "addcat";
	break;
case "addproduct.jsp":
	a = "addproduct";
	break;
case "sliderz.jsp":
	a = "sliderz";
	break;
case "showcat.jsp":
	a = "showcat";
	break;
case "showproduct.jsp":
	a="showproduct";
	break;
case "showsliderz.jsp":
	a = "showsliderz";
	break;
case "inquiry.jsp":
	a = "inquiry";
	break;
case "users.jsp":
	a = "users";
	break;
case "showsubscriber.jsp":
	a = "showsubscriber";
	break;
case "allorders.jsp":
	a = "allorders";
	break;
case "pending.jsp":
	a = "pending";
	break;
case "active.jsp":
	a = "active";
	break;
case "shipping.jsp":
	a = "shipping";
	break;
case "deliverd.jsp":
	a = "deliverd";
	break;
case "cancel.jsp":
	a = "cancel";
	break;
case "myprofile.jsp":
	a = "myprofile";
	break;
case "admin_changepassword.jsp":
	a = "admin_changepassword";
	break;
case "AdminLogout.jsp":
	a = "AdminLogout";
	break;
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="admin_index.jsp" class="app-brand-link">
              <img src="admin/assets/logo-01.png" style="width: 180px;">
            </a>


          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item <% if(a == "index"){out.println("active");} %>" id="dash">
              <a href="admin_index.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
              </a>
            </li>

             <li class="menu-header small text-uppercase"><span class="menu-header-text">Add Data</span></li>
            <!-- Forms -->
            <li class="menu-item <% if(a == "addcat"){out.println("active");} %>" id="addc">
              <a href="addcat.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Add Category</div>
              </a>
            </li>
             
             <li class="menu-item <% if(a == "addproduct"){out.println("active");} %> ">
              <a href="addproduct.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Add Product</div>
              </a>
            </li>
             
            
             <li class="menu-item <% if(a == "sliderz"){out.println("active");} %>">
              <a href="sliderz.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Add Slider</div>
              </a>
            </li>
            
             

             <li class="menu-header small text-uppercase"><span class="menu-header-text">Show Data</span></li>
            <!-- Forms -->
            <li class="menu-item <% if(a == "showcat"){out.println("active");} %>">
              <a href="showcat.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Show Category</div>
              </a>
            </li>
            
            <li class="menu-item <% if(a == "showproduct"){out.println("active");} %>">
              <a href="showproduct.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Show Product</div>
              </a>
            </li>
            
            
            <li class="menu-item <% if(a == "showsliderz"){out.println("active");} %>">
              <a href="showsliderz.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Show Slider</div>
              </a>
            </li>
            
            
            <li class="menu-item <% if(a == "inquiry"){out.println("active");} %>">
              <a href="inquiry.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Show Inquiry</div>
              </a>
            </li>
              <li class="menu-item <% if(a == "users"){out.println("active");} %>  ">
              <a href="users.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Show All Users</div>
              </a>
            </li>
             <li class="menu-item <% if(a == "showsubscriber"){out.println("active");} %>  ">
              <a href="showsubscriber.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Show Subscriber</div>
              </a>
            </li>
             

             <li class="menu-header small text-uppercase"><span class="menu-header-text">Order Details</span></li>
            <!-- Forms -->
            <li class="menu-item <% if(a == "allorders"){out.println("active");} %> ">
              <a href="allorders.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">All Orders</div>
              </a>
            </li>
            <li class="menu-item <% if(a == "pending"){out.println("active");} %>">
              <a href="pending.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Pending</div>
              </a>
            </li>
             <%-- <li class="menu-item <% if(a == "active"){out.println("active");} %> ">
              <a href="active.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Active</div>
              </a>
            </li>
             <li class="menu-item  <% if(a == "shipping"){out.println("active");} %>">
              <a href="shipping.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Shipping</div>
              </a>
            </li>
             <li class="menu-item  <% if(a == "deliverd"){out.println("active");} %>">
              <a href="deliverd.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Delivered</div>
              </a>
            </li>
             <li class="menu-item <% if(a == "cancel"){out.println("active");} %>">
              <a href="cancel.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Cancel</div>
              </a>
            </li> --%>

            <li class="menu-header small text-uppercase"><span class="menu-header-text">Account</span></li>
        
           <li class="menu-item <% if(a == "myprofile"){out.println("active");} %>">
              <a href="myprofile.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Analytics">My Account</div>
              </a>
            </li>
            <li class="menu-item <% if(a == "admin_changepassword"){out.println("active");} %>">
              <a href="admin_changepassword.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Analytics">Change Password</div>
              </a>
            </li>
              <li class="menu-item <% if(a == "AdminLogout"){out.println("active");} %>">
              <a href="AdminLogout" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Analytics">Logout</div>
              </a>
            </li>

           
            <!-- Forms & Tables -->
          
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
          
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
               
    
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="admin/assets/logo-01.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        
                      <a class="dropdown-item" href="myprofile.jsp">
                        <i class="fa-solid fa-user me-2"></i>
                        <span class="align-middle"> My Account</span>
                      </a>
                      <a class="dropdown-item" href="admin_changepassword.jsp">
                        <i class="fa-solid fa-lock me-2"></i>
                        <span class="align-middle">Change Password</span>
                      </a>
                      <a class="dropdown-item" href="AdminLogout">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

</body>
</html>
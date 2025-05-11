<%@page import="Com.Dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	User user = (User) session.getAttribute("user");
%>
			<%
					Dao d = new Dao();
					List<Category> list = d.viewCategory();
					session.setAttribute("category", list);
				%>
				
<% 
String uri = request.getRequestURI();
String pageName = uri.substring(uri.lastIndexOf("/")+1);
String a="index";
switch(pageName){
case "index.jsp":
	a = "index";
	break;
case "product.jsp":
	a = "product";
	break;
case "contact.jsp":
	a = "contact";
	break;
case "wishlist.jsp":
	a = "wishlist";
	break;
}
%>				

<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						Free shipping for standard order over &#8377;3000
					</div>
					<div class="left-top-bar">
						${user.email}
					</div>
					
				
				</div>
			</div>

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="index.jsp" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="<% if(a == "index"){out.println("active-menu");} %>">
								<a href="index.jsp">Home</a>
							</li>

							<li class="<% if(a == "product"){out.println("active-menu");} %>" data-label1="hot">
								<a href="product.jsp">Shop</a>
							</li>

							<li class="<% if(a == "contact"){out.println("active-menu");} %>">
								<a href="contact.jsp">Contact</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="<%
								try
						{
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store","root","");
							Statement st=con.createStatement();
							String strQuery = "SELECT COUNT(*) FROM cart";
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
										%>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="wishlist.jsp" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="
						<%
										try
										{
											Class.forName("com.mysql.jdbc.Driver").newInstance();
											Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store","root","");
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM wishlist";
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
									%>
									">
							<i class="zmdi zmdi-favorite"></i>
						</a>

					<%
						if (user == null) {
					%>

					<a href="login.jsp" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 " >
							<i class="zmdi zmdi-account"></i>
						</a>
					<%
						} else {
					%>
					<!-- <a href="UserLogout" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 " >
							<i class="zmdi zmdi-power"></i>
						</a> -->
						<div class="" id="navbar-list-4">
    <ul class="">
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="zmdi zmdi-power cl2 hov-cl1" id="drop-link" style="font-size:30px"></i>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="Changepassword.jsp">Change Password</a>
          <a class="dropdown-item" href="EditProfile?id=${user.id}">Edit Profile</a>
          <a class="dropdown-item" href="logout.jsp">Log Out</a>
        </div>
      </li>   
    </ul>
  </div>
						
						
						
						
					<%
						}
					%>

				</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.jsp"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="<%
								try
						{
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store","root","");
							Statement st=con.createStatement();
							String strQuery = "SELECT COUNT(*) FROM cart";
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
										%>">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="wishlist.jsp" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="<%
										try
										{
											Class.forName("com.mysql.jdbc.Driver").newInstance();
											Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coza_store","root","");
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM wishlist";
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
									%>">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
				
				<%
						if (user == null) {
					%>

					<a href="login.jsp" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 " >
							<i class="zmdi zmdi-account"></i>
						</a>
					<%
						} else {
					%>
					<div class="" id="navbar-list-4">
    <ul class="">
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="zmdi zmdi-power cl2 hov-cl1" id="drop-link" style="font-size:30px"></i>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="Changepassword.jsp">Change Password</a>
          <a class="dropdown-item" href="EditProfile?id=${user.id}">Edit Profile</a>
          <a class="dropdown-item" href="logout.jsp">Log Out</a>
        </div>
      </li>   
    </ul>
  </div>
					<%
						}
					%>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over &#8377;3000
					</div>

						${user.email}
						
				</li>
				

				<li>
					
				</li>
			</ul>

			<ul class="main-menu">
							<li class="active-menu">
								<a href="index.jsp">Home</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="product.jsp">Shop</a>
							</li>

							<li>
								<a href="contact.jsp">Contact</a>
							</li>
						</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form action="search" method="get" class="wrap-search-header flex-w p-l-10">
					<button class="flex-c-m trans-02">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="search" name="keyword" placeholder="Search Product......" required>
				</form>
			</div>
		</div>
	</header>
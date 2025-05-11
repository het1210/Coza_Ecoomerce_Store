<%@page import="pojo.Order"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="pojo.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Com.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Done</title>
<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<link rel="stylesheet" href="assets/css/track.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<div class="container-fluid my-5  d-flex  justify-content-center">
        <div class="card card-1">
            <div class="card-header bg-white">
                <div class="media flex-sm-row flex-column-reverse justify-content-between  ">
                    <div class="col my-auto"> <h4 class="mb-0">Thanks for your Order, <span class="change-color"> ${user.name}</span> !</h4> </div>
                    <div class="col-auto text-center  my-auto pl-0 pt-sm-4"><a href="index.jsp"><img class="img-fluid my-auto align-items-center mb-0 pt-3"  src="images/icons/logo-01.png" width="115" height="115"></a> <p class="mb-4 pt-0 Glasses"></p>  </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between mb-3">
                    <form action="DownloadPDFServlet" method="get"  ><div class="col-auto"><h6 class="color-1 mb-0 change-color">Receipt <button style="background: " type="submit"> <i class="fa-solid fa-cloud-arrow-down"></i></button></h6> </div></form>
                    <div class="col-auto  "> <small>Receipt Voucher : 1KAU9-84UIL</small> </div>
                </div>
                <%
					Dao dao2 = new Dao();
					List<Cart> list2 = dao2.viewCart();
					session.setAttribute("id", list2);
				%>
				<%! int id=0; %>
			<c:forEach var="c" items="${id}">
                <div class="row">
                    <div class="col">
                        <div class="card card-2">
                            <div class="card-body">
                                <div class="media">
                                    <div class="sq align-self-center "> <img class="img-fluid  my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="images/products/${c.product.image1 } " width="100" height="100" /> </div>
                                    <div class="media-body my-auto text-right">
                                        <div class="row  my-auto flex-column flex-md-row">
                                            <div class="col my-auto"> <h6 class="mb-0">${c.product.productName}</h6>  </div>
                                            <div class="col-auto my-auto"> <small>Color: ${c.product.color}</small></div>
                                            <div class="col my-auto"> <small>Size : ${c.product.size}</small></div>
                                            <div class="col my-auto"> <small>Qty : ${c.qty}</small></div>
                                            <div class="col my-auto"><h6 class="mb-0">&#8377;${c.price}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-3 ">
                                <div class="row">
                                    <div class="col-md-3 mb-3"> <small> Track Order <span><i class=" ml-2 fa fa-refresh"  aria-hidden="true"></i></span></small> </div>
                                    <div class="col mt-auto">
                                        <div class="progress my-auto"> <div class="progress-bar progress-bar  rounded" style="width: 62%" role="progressbar" aria-valuenow="25" aria-valuemin="0"  aria-valuemax="100"></div> </div>
                                        <div class="media row justify-content-between ">
                                            <div class="col-auto text-right"><span> <small  class="text-right mr-sm-2"></small>  </span></div>
                                            <div class="flex-col"> <span> <small class="text-right mr-sm-2">Out for delivary</small></span></div>
                                            <div class="col-auto flex-col-auto"><small  class="text-right mr-sm-2">Delivered</small><span> </span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
           </c:forEach>
           
                <div class="row mt-4">
                    <div class="col">
                        <div class="row justify-content-between">
                            <div class="col-auto"><p class="mb-1 text-dark"><b>Order Details</b></p></div>
                            <div class="flex-sm-col text-right col"> <p class="mb-1"><b>Total</b></p> </div>
                            <div class="flex-sm-col col-auto"> <p class="mb-1">&#8377;<%!
												
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
													 			out.println(Countrun );
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %></p> </div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"> <b>Delivery Charges</b></p> </div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">&#8377; <%= shippings %></p></div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"><b>GST 18%</b></p></div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">&#8377; <%!
                            						int GST=0 ;
												    %>
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
													 			out.println((Countrun + shippings)*18/100);
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %></p></div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"><b>Total Paid</b></p></div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">&#8377; <%!
												int shipping=150;
                      							 
												    %>
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
													 			out.println((Countrun + shippings)+((Countrun + shippings)*18/100));
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %></p></div>
                        </div>
                    </div>
                </div>
                <%
						Dao dao = new Dao();
						List<Order> list = dao.viewOrder();
						session.setAttribute("o", list);
					%>
                <div class="row invoice ">
                    <div class="col"><p class="mb-1"> Invoice Number : ${list.orderId}</p><p class="mb-1">Invoice Date : <%= java.util.Calendar.getInstance().getTime() %></p><p class="mb-1">Recepits Voucher:18KU-62IIK</p></div>
                </div>
                <form action="Done" method="post">
                 <button style="background-color: transparent; color:white; background-color: #BA68C8;" class="btn btn"><a style="color: white;">Go To Shope</a> </button>
   					</form>        
            </div>
            <div class="card-footer">
                <div class="jumbotron-fluid">
                    <div class="row justify-content-between ">
                        <div class="col-sm-auto col-auto my-auto"><img class="img-fluid my-auto align-self-center " src="images/icons/logo-01.png" width="115" height="115"></div>
                        <div class="col-auto my-auto "><h2 class="mb-0 font-weight-bold">TOTAL PAID</h2></div>
                        <div class="col-auto my-auto ml-auto"><h1 class="display-3 ">&#8377; <%!
												int shippings=150;
                      							 
												    %>
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
													 			out.println((Countrun + shippings)+((Countrun + shippings)*18/100));
													 		}
													 	} catch (Exception e) {
													 		e.printStackTrace();
													 	}
													 %></h1></div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>
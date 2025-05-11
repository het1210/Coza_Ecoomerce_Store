<%
	session.removeAttribute("user");
	session.removeAttribute("cart");
	session.invalidate();
	response.sendRedirect("login.jsp");
%>
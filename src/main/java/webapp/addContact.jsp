
<%
if (session.getAttribute("userId") == null) {
	response.sendRedirect("login.jsp"); // Redirect to login page
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="" href="../Style/Login.css">
<link rel="website icon" type="png"
	href="../images/illustration/Tab_icon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>
	<%@include file="Component/navbar.jsp"%>

	<main>
		<div class="container p-5 m-5">
			<div class="form-card text-center">
				<h3 class="pb-3 fw-bolder">Add Your Phone Number</h3>

				<div class="text-start">
					<form id="registerForm" action="#" method="get">
						<label>Name</label> 
						<input class="border-dark form-control mb-3 py-2 mt-1" type="text" name="name" placeholder="John Doe"> 
						
						<label>Mobile number</label> 
						<input class="border-dark form-control mb-3 py-2 mt-1" type="tel" name="mobile" placeholder="1234567890"> 
						
						<label>Email</label>
						<input class="border-dark form-control mb-3 py-2 mt-1" type="email" name="email" placeholder="john@example.com">

						<button type="submit" name="register"
							class="btn form-control mt-3 btn-outline-success fw-bold">Add Contact</button>
					</form>
				</div>

			</div>
		</div>
	</main>

	<%
	if (request.getParameter("register") != null) {

		String NAME = request.getParameter("name");
		String MOBILE = request.getParameter("mobile");
		String EMAIL = request.getParameter("email");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://LocalHost:3306/phonebook", "root", "root");
			
			PreparedStatement ps = con.prepareStatement("insert into contacts(userid, name, phone, email) values('" + userId + "','" + NAME + "','"
					+ MOBILE + "','" + EMAIL + "')");
			
			ps.executeUpdate();

			out.print("<script>alert('Contact added successfully!!!')</script>");
			
		} catch (Exception e) {

			out.print("<script>alert('Unsuccessfully!!!')</script>");
			e.printStackTrace();
		}

	}
	%>

	<%@include file="Component/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
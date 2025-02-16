<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    
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
		<div class="container pt-5 mt-5">
			<div class="form-card">
				<form id="loginForm">
					<label>Email</label> 
					<input type="email" name="email" placeholder="john@example.com" class="border-dark form-control mb-3 py-3"> 
					
					<label>Password</label> 
					<input type="password" name="password" placeholder="••••••••" class="border-dark form-control mb-3 py-3">

					<button type="submit" name="login"  class="btn form-control mt-3 btn-outline-success">Login</button>

					<p class="pt-2">
						Don't have an account? 
						<a href="register.jsp" class="text-dark text-decoration-none">Register here</a>
					</p>
				</form>

			</div>
		</div>
	</main>

	 <%
    if(request.getParameter("login") != null)
    {
    	String Email = request.getParameter("email");
    	String Password = request.getParameter("password");
    	
    	
    	try
    	{
    		Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://LocalHost:3306/phonebook", "root", "root");
    		PreparedStatement ps = con.prepareStatement("select * from register where email=? and password=?");
    	 ps.setString(1, Email);
    	 ps.setString(2, Password);
    	 
    	 ResultSet  rs = ps.executeQuery();
    	 
    	 if(rs.next()) {
             session.setAttribute("userId", rs.getInt("id")); // Store user ID in session
             
             response.sendRedirect("index.jsp"); // Redirect to dashboard
             
         } else {
             out.println("<script>alert('incorrect email and password . please try again..!!!')</script>");
         }
    	 
    	}catch(Exception e)
    	{
    		%>
    		<script>alert("incorrect email and password . please try again..!!!")</script>
    		<%
    		e.getMessage();
    	}
    }
    
    %>
	
	<%@include file="Component/footer.jsp" %>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
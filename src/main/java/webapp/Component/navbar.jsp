<%
    Integer userId = (Integer) session.getAttribute("userId");
%>


<nav class="navbar navbar-expand-lg bg-body-tertiary border-bottom fixed-top z-3">
	<div class="container">
		<a class="navbar-brand fw-bold" href="index.jsp">CONNECTVAULT</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5">
				<li class="nav-item"><a class="nav-link active pe-4"
					aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link pe-4" href="addContact.jsp"> <i class="fa-solid fa-user-plus"></i> Add
						Phone Number</a></li>
				<li class="nav-item"><a class="nav-link" href="viewContact.jsp"> <i class="fa-solid fa-eye"></i>View
						Contact</a></li>
			</ul>
			<form>
				<% if (userId == null) { %>	
				<a href="login.jsp" class="btn btn-outline-dark py-1 px-3">Login</a>
				<a href="register.jsp" class="btn btn-outline-dark py-1 px-3">Register</a>
				<% } else { %>
				<a href="logout.jsp" class="btn btn-outline-dark py-1 px-3">LogOut</a>
				<% } %>
			</form>
		</div>
	</div>
</nav>
<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%><html>
<head>
<title>Navbar Example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
</head>
<body>

	<!-- Starting the Navbar Code -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<div class="navbar-header">
				<a class="navbar-brand" href="">E-Kart</a>
			</div>
			<c:if test="${sessionScope.loggedIn}">
				<ul class="nav navbar-nav">
					<li class="active"><a href="Home">Home</a></li>
					<li><a href="Admin">Admin</a></li>

					<li><a href="Category">Category</a></li>
					<li><a href="Product">Product</a></li>
					<li><a href="Supplier">Supplier</a></li>
						<li><a href="ContactUs">ContactUs</a></li>
						<li><a href="ProductPage">Product Page</a></li>
				
				</ul>
				<div class="nav navbar-nav navbar-right">
					<a href="Login">Log Out</a> <a href="Registration">Sign Up</a> <a
						href="Home">Back to Home</a>

				</div>
				<!-- <div>
					<ul>
						<li><a href="ContactUs">ContactUs</a></li>
						<li><a href="ProductPage">Product Page</a></li>
					</ul>
				</div> -->
			</c:if>
			<c:if test="${!sessionScope.loggedIn}">
				<ul class="nav navbar-nav">
					<li><a href="Home">Home</a></li>

					<li><a href="AboutUs">AboutUs</a></li>
					<li><a href="ContactUs">ContactUs</a></li>
				</ul>
				<div class="nav navbar-nav navbar-right">
					<a href="Login">Log In</a> <a href="Registration">Sign Up</a> <a
						href="Home">Back to Home</a>

				</div>
			</c:if>

			<!-- 	 <ul class="nav navbar-nav">
      		<li class="active"><a href="Home">Home</a></li>
      		<li><a href="AboutUs">AboutUs</a></li>
      		<li><a href="ContactUs">ContactUs</a></li>
    	</ul>

	  <ul class="nav navbar-nav navbar-right">
		<li><a href="Login"><span class="glyphicons glyphicons-log-in"></span>Log In</a></li>
		
		
		<li><a href="Registration">Sign Up</a></li>
		
		<li><a href="Home">Back to Home</a></li>	
	  </ul>
 -->


		</div>
	
			
		
	</nav>
	<!-- Ending the NavBar Code -->
	
</body>
<!-- <div class="container text-center">    
  <h3>What We Do</h3><br>
  			<div class="row">
				<div class="col-sm-4">
					<iframe  class="embed-responsive-item"
						src="https://www.youtube.com/ctj-RDbTBMU"> </iframe>
					<p><big><b>What We Do???</b></big></p>
				</div>
				</div>
				</div> -->
</html>









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
				 <ul class="nav navbar-nav">
      		<li class="active"><a href="Home">Home</a></li>
      		<li><a href="#">AboutUs</a></li>
      		<li><a href="ContactUs">ContactUs</a></li>

    	</ul>
			
	  <ul class="nav navbar-nav navbar-right">
		<li><a href="Login"><span class="glyphicons glyphicons-log-in"></span>Log In</a></li>
		
		
		<li><a href="Registration">Sign Up</a></li>
		
		<li><a href="Home">Back to Home</a></li>	
	  </ul>



		</div>



	</nav>
	<!-- Ending the NavBar Code -->

</body>
</html>









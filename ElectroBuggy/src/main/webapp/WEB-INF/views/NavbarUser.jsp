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

	<c:if test="${sessionScope.loggedIn}">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	
	<div class="navbar-header">
      	<a class="navbar-brand" href="#">E-Kart</a>
    	</div>	
	 <ul class="nav navbar-nav">
      		<li class="active"><a href="Home">Home</a></li>
      		<li><a href="#">AboutUs</a></li>
      		<li><a href="ContactUs">ContactUs</a></li>
      		<li><a href="ProductPage">Product Page</a></li>

    	</ul>

      <ul class="nav navbar-nav nav navbar-right">
     
     <li><a href="Login">logout</a></li>
     <li><a href="Cart">CartPage</a></li>
     </ul>

	</div>
</nav>
</c:if>

<c:if test="${!sessionScope.loggedIn}">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	
	<div class="navbar-header">
      	<a class="navbar-brand" href="#">E-Kart</a>
    	</div>	
	 <ul class="nav navbar-nav">
      		<li><a href="User">Home</a></li>
      		<li><a href="#">AboutUs</a></li>
      		<li><a href="ContactUs">ContactUs</a></li>
      		<li><a href="ProductPage">Product Page</a></li>

    	</ul>
</div>
</nav>
</c:if>


</body>
</html>









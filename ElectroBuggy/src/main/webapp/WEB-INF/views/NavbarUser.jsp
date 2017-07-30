<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

	<c:if test="${sessionScope.loggedIn}">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	
	<div class="navbar-header">
      	<a class="navbar-brand" href="AboutUs">E-Kart</a>
    	</div>	
	 <ul class="nav navbar-nav">
      		<li class="active"><a href="Home">Home</a></li>
      		<li><a href="#">AboutUs</a></li>
      		<li><a href="ContactUs">ContactUs</a></li>
      		<li><a href="ProductPage">Product Page</a></li>

    	</ul>

      <ul class="nav navbar-nav nav navbar-right">
					<li><a href="#">${sessionScope.username}</a></li>
     
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
      		<li><a href="ContactUs">ContactUs</a></li>
      		<li><a href="Registration">Sign Up</a></li>


    	</ul>
</div>
</nav>
</c:if>


</body>
</html>









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
<c:if test="${sessionScope.loggedin}">
 <center><h2><font color="#800000" face="Monotype Corsiva" size="10" ><b>Electro-Buggy </b></font></h2></center>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
      <a class="navbar-brand" href="AboutUs"><img src="<c:url value='resources/img/logo.jpg'/>" height="35" width="35"/></a>
    </div>
    <ul class="nav navbar-nav">
  
      <li class="active"><a href="Home">Home</a></li>
          <li><a href="ContactUs">Contact us</a></li>
          <li><a href="AboutUs">About us</a></li>
          <c:if test="${sessionScope.srole=='ROLE_ADMIN'}">
<a  class="btn btn-success"><font bgcolor="black"  size="5">Login as Admin</font></a>
           <li><a href="Category">Category</a></li>
          <li><a href="Supplier">Supplier</a></li>
          <li><a href="Product">Product</a></li>
          
          </c:if>
          
          <c:if test="${sessionScope.srole=='ROLE_USER'}">
          <!-- <a href="" class="btn btn-success">Login as User 
									</a> -->
          <li><a href="ProductPage">product page</a></li>
	
          </c:if>
          </ul>
           <ul class="nav navbar-nav navbar-right">
           <li><a href="#">${sessionScope.username}</a></li>
      <!-- <li><a href="newregistration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
      <li><a href="Login"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
            
      
      <li><a href="redirect:/Home"><span class="glyphicon glyphicon-arrow-left"></span> Back </a></li>
    </ul>
          </div>
          </nav>   
   </c:if>       

<c:if test="${!sessionScope.loggedin}">
 <center><h2><font color="#800000" face="Monotype Corsiva" size="10" ><b>Electro-Buggy </b></font></h2></center>
 
<br>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="AboutUs"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home">Home</a></li>
          <li><a href="ContactUs">Contact us</a></li>
          </ul>
           <ul class="nav navbar-nav navbar-right">
           
           
      <li><a href="Registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="Home"><span class="glyphicon glyphicon-arrow-left"></span> Back </a></li>
      
    </ul>
          </div>
          </nav>
         
    </c:if>      
    
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
		<!-- Starting the Navbar Code -->

		<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<div class="navbar-header">
				<a class="navbar-brand" href="AboutUs">E-Kart</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="Home">Home</a></li>
				<li><a href="ContactUs">ContactUs</a></li>

			</ul>

			<ul class="nav navbar-nav navbar-right">

				<li><a href="Registration"><span
						class="glyphicon glyphicon-user"></span>Sign Up</a></li>
				<li><a href="Login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<li><a href="Home"><span
						class="glyphicons glyphicons-arrow-left"></span> Back </a></li>

			</ul>
		</div>
		</nav>



	<!-- Ending the NavBar Code -->

</body>
</html>













 --%> 
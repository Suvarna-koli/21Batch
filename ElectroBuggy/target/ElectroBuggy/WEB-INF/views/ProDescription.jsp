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
<jsp:include page="Navbar.jsp"></jsp:include>
<style>
body {
    background-color: #bfbfbf;
        font-family: "Times New Roman", Times, serif;
       
background-image:
repeating-linear-gradient(120deg, rgba(255,255,255,.1), rgba(255,255,255,.1) 1px, transparent 1px, transparent 60px),
repeating-linear-gradient(60deg, rgba(255,255,255,.1), rgba(255,255,255,.1) 1px, transparent 1px, transparent 60px),
linear-gradient(60deg, rgba(0,0,0,.1) 25%, transparent 25%, transparent 75%, rgba(0,0,0,.1) 75%, rgba(0,0,0,.1)),
linear-gradient(120deg, rgba(0,0,0,.1) 25%, transparent 25%, transparent 75%, rgba(0,0,0,.1) 75%, rgba(0,0,0,.1));
background-size: 70px 120px;
}

</style>
</head>
<%-- <body background="<c:url value='/resources/img/bg2.jpg'/>"> --%>
<body>

<%-- <form action="${pageContext.request.contextPath}/addToCart" method="get"> --%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">

					<table class="">


						<tr bgcolor="#FFFFF0">
							<font color="#800000" face="Monotype Corsiva" size="10" ><center><h2><b>Product Description</b></h2></center></font>
						</tr>
	
	
				<tr>
							<td><li><img 
									src="<c:url value='/resources/productImg/${proInfo.proid}.jpg'/>"
									width="200" height="200"/></li></td>
						</tr>
		
						<tr>
							<p><td>Prodcut ID</td></p>
							<td>${proInfo.proid}</td>
						</tr>
						<tr>
							<td>Prodcut Name</td>
							<td>${proInfo.proname}</td>
						</tr>
						
						<tr>
							<td>Prodcut Desc</td>
							<td>${proInfo.prodesc}</td>
						</tr>
						<tr>
							<td>Price</td>
							<td>${proInfo.price}</td>
						</tr>
						<tr>
							<td>Stock</td>
							<td>${proInfo.quantity}</td>
						</tr>
						<tr>
							<td>
								<form action="<c:url value="/addToCart/${proInfo.proid}"/>" method="post">Quantity
									<input type="text" name="quantity" onclick="myFunction" class="form-control btn-block"/>
									 <b><input type="submit" value="Add To Cart"/></b>
								</form>
							</td>

						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

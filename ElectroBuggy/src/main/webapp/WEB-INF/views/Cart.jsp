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

 
 <jsp:include page="Navbar.jsp"></jsp:include>
 
<h2>
	<center>Manage Cart</center>
</h2>

<!-- Cart Form Started -->
<body background="<c:url value='/resources/img/bg2.jpg'/>">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">

					<table id="cartTable" class="table table-bordered">

						<tr bgcolor="#a6a6a6">
							<td><b>Product ID</b></td>
							<td><b>Quantity</b></td>
							<td><b>Sub Total</b></td>
							<td><b>Image</b></td>
							<td colspan="3"><b>Operation</b></td>

						</tr>
						<c:forEach items="${cartlist}" var="cartitem">
							<tr bgcolor="#bfbfbf">
								<td>${cartitem.proname}</td>
								<td>${cartitem.quantity}</td>
								<td>${cartitem.price*cartitem.quantity}</td>
								<td><img 
									src="<c:url value='/resources/productImg/${cartitem.proid}.jpg'/>"
									width="30" height="30"/></td>
								<td><form action="<c:url value="/delete/${cartitem.cartItemid}"/>">
								 <input type="submit" value="Remove"/>
								</form>
								</td>
								<td>
								<form action="<c:url value="/update/${cartitem.cartItemid}"/>" method="get">
									<input type="text" value="${cartitem.quantity}"
									name="quantity"/>
									 <input type="submit" value="Update"/>
									</form>
								</td>

							</tr>
						</c:forEach>
						
					</table>
					<div>
					
							<form action="<c:url value="/ProductPage"/>"><span class="glyphicon glyphicon-menu-left"></span>
							 <b><input type="submit" value="Continue Shopping"/></b>
									
							
							</form>
							<br>
						
							<form action="<c:url value="/OrderPage"/>"><span class="glyphicon glyphicon-check"></span>
							 <b><input type="submit" value="Place Order"/></b>
									
							</form>
							
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Completed Displaying Table -->

</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>

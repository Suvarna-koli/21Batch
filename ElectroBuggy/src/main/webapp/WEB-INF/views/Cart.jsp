<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>

<jsp:include page="NavbarUser.jsp"></jsp:include>

<h2>
	<center>Manage Cart</center>
</h2>

<!-- Cart Form Started -->
<body background="resources/img/bge1.jpg">

	<!-- Category Form Completed -->

	<!-- Displaying the Category data using Table -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">

					<table id="cartTable" class="table table-bordered">

						<tr bgcolor="">
							<td><b>Product ID</b></td>
							<td><b>Quantity</b></td>
							<td><b>Sub Total</b></td>
							<td><b>Image</b></td>
							<td><b>Operation</b></td>

						</tr>
						<c:forEach items="${cartlist}" var="cartitem">
							<tr>
								<td>${cartitem.proname}</td>
								<td>${cartitem.quantity}</td>
								<td>${cartitem.price*cartitem.quantity}</td>
								<td><img
									src="<c:url value='resources/productImage/${cartitem.proid}.jpg'/>"
									width="30" height="30" /></td>
								<td><a
									href="<c:url value="/delete/${cartitem.cartItemid}"/>">Delete</a>
									<a href="<c:url value="/update/${cartitem.cartItemid}"/>">Update</a>
									<input type="text" value="${cartitem.quantity}"
									name="quantity"/> <input type="submit" value="update"/>

								</td>

							</tr>
						</c:forEach>
						
					</table>
					<div>
					
							<a href="ProductPage">ContinueShopping</a>
							<a href="CheckOut">CheckOut</a>
							
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Completed Displaying Table -->

</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>

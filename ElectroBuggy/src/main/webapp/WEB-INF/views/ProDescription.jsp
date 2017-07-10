<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<body>
<%-- <form action="${pageContext.request.contextPath}/addToCart" method="get"> --%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">

					<table id="productTable" class="table table-bordered">

						<tr bgcolor="">
							<center><h2><b>Product Description</b></h2></center>
						</tr>
						<tr>
							<td><img
								src="<c:url value="/resources/productImg/${proInfo.proid}.jpg"/>"/></td>
						</tr>
						<tr>
							<td>Prodcut ID</td>
							<td>${proInfo.proid}</td>
						</tr>
						<tr>
							<td>Prodcut Name</td>
							<td>${proInfo.proname}</td>
						</tr>
						<tr>
							<td>Supplier</td>
							<td>${proInfo.supid}</td>
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
							<td>Quantity</td>
							<td>${proInfo.quantity}</td>
						</tr>
						<tr>
							<td>
								<form action="<c:url value="/addToCart/${proInfo.proid}"/>">Quantity
									<input type="text" name="quantity" onclick="myFunction" class="form-control btn-block"/>
									 <input type="submit" value="addToCart"/>
								</form>
							</td>

						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
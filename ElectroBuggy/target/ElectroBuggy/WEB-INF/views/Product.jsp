<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>

<jsp:include page="Navbar.jsp"></jsp:include>

<h2>
	<center>Manage Product</center>
</h2>

<body background="resources/img/bg1.jpg">
	<c:if test="${flag}">
		<form:form action="${pageContext.request.contextPath}/UpdateProduct"
			method="post">
	</c:if>
	<c:if test="${!flag}">


		<form action="AddProduct" modelAttribute="product" method=POST
			enctype="multipart/form-data">
	</c:if>
	<%
		String contextPath = request.getContextPath();
	%>
	<table align="center">
		<tr>
			<td colspan="2">Product Detail</td>
			<c:if test="${flag}">
				<input type="hidden" name="proid" value="${product.proid}" />
			</c:if>
		</tr>
		<tr>
			<td>Product Name</td>
			<c:if test="${flag}">
			<td><form:input path="proname" value="${product.proname }"/></td>
			</c:if>
			<c:if test="${!flag}">
			<td><form:input path="proname" /></td>
			</c:if>
		</tr>

		<tr>
			<td>Category</td>
			<td><form:select path="catid">
					<form:option value="0" label="------Select----" />
					<form:options items="${catlist}" />
				</form:select></td>
		</tr>
		<tr>

			<td>Supplier</td>
			<td><form:select path="supid">
					<form:option value="0" label="------Select----" />
					<form:options items="${suplist}" />
				</form:select></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><form:input path="price" value="${product.price}"/></td>
		</tr>
		<tr>
			<td>Stock</td>
			<td><form:input path="quantity" value="${product.quantity}" /></td>
		</tr>
		<tr>
			<td>Product Desc</td>
			<td><form:textarea path="prodesc" value="${product.prodesc}" /></td>
		</tr>

		<tr>
			<td>Product Image</td>
			<td><form:input type="file" path="pimg" value="${product.pimg}"/></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" /></td>
		</tr>
	</table>
	</form:form>

	<!-- Displaying the Product data using Table -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">

					<table id="productTable" class="table table-bordered">

						<tr bgcolor="">
							<td><b>Product ID</b></td>
							<td><b>Product Name</b></td>
							<td><b>Price</b></td>
							<td><b>Quantity</b></td>
							<td><b>Category Id</b></td>
							<td><b>Supplier Id</b></td>
							<td><b>Operation</b></td>
							<td><b>Image</b></td>

						</tr>
						<c:forEach items="${prodlist}" var="product">
							<tr bgcolor="">
								<td>${product.proid}</td>
								<td>${product.proname}</td>
								<td>${product.price}</td>
								<td>${product.quantity}</td>
								<td>${product.catid}</td>
								<td>${product.supid}</td>
								<td><a
									href="<c:url value="deleteProduct/${product.proid}"/>">Delete</a>
									<a href="<c:url value="updateProduct/${product.proid}"/>">Update</a>

								</td>
								<td><img src="${product.imgpath}" height="25" width="25"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Completed Displaying Table -->

</body>

</html>

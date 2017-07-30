<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<jsp:include page="Navbar.jsp"></jsp:include>

<h2>
	<font color="#000000"><center><font color="#800000" face="Monotype Corsiva" size="10" >Manage Product</font></font></center>
</h2>

<body>
	<c:if test="${flag}">
		<form:form action="${pageContext.request.contextPath}/UpdateProduct"
			modelAttribute="product" method="post" enctype="multipart/form-data">
			<table align="center">
			
			<tr>
					<td><form:input path="proid" value="${product.proid}" readonly="true"/></td>
				</tr>
				<br>
				<tr>
					<td><form:input path="proname" value="${product.proname}" /></td>
				</tr>
				<br>

				<tr>
					<td><form:select path="catid">
							<form:option value="0" label="------Select----" />
							<form:options items="${catlist}" />
						</form:select><br></td>
				</tr>

				<tr>
					<td><form:select path="supid">
							<form:option value="0" label="------Select----" />
							<form:options items="${suplist}" />
						</form:select></td>
				</tr>
				<br>

				<tr>
					<td><form:input path="imgpath" value="${product.imgpath}"
							required="true"/></td>
				</tr>
				<br>

				<tr>
					<td><form:input path="quantity" value="${product.quantity}" /></td>
				</tr>
				<br>

				<tr>
					<td><form:input path="price" value="${product.price}" /></td>
				</tr>
				<br>

				<tr>
					<td><form:textarea path="prodesc" value="${product.prodesc}" />
					</td>
				</tr>
				<br>
				<tr>
					<td><input type="submit" value="UpdateProduct"/></td>
				</tr>
			</table>
		</form:form>
	</c:if>
	<%-- <%
String contextPath = request.getContextPath();
%> --%>
	<c:if test="${!flag}">
		<form:form action="${pageContext.request.contextPath}/AddProduct"
			modelAttribute="product" method="post" enctype="multipart/form-data">

			<table align="center">
				<tr>
					<td>Product Name</td>
					
					<c:if test="${!flag}">
						<td><form:input path="proname" value="${product.proname}" /></td>
					</c:if>
				</tr>

				<tr>
					<td>Category</td>
					<td><c:if test="${!flag}">
							<form:select path="catid">
								<form:option value="0" label="------Select----" />
								<form:options items="${catlist}" />
							</form:select>

						</c:if></td>

				</tr>
				<tr>

					<td>Supplier</td>
					<td><c:if test="${!flag }">
							<form:select path="supid">
								<form:option value="0" label="------Select----" />
								<form:options items="${suplist}" />
							</form:select>
						</c:if></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><c:if test="${!flag}">
							<form:input path="price" />
						</c:if></td>
				</tr>
				<tr>
					<td>Stock</td>
					<td><c:if test="${!flag}">
							<form:input path="quantity" />
						</c:if></td>
				</tr>
				<tr>
					<td>Product Desc</td>
					<td><c:if test="${!flag}">
							<form:textarea path="prodesc" />
						</c:if></td>
				</tr>

				<tr>
					<td>Product Image</td>
					<td><c:if test="${!flag}">
							<form:input type="file" path="pimg" />
						</c:if></td>


				</tr>

				<tr>
				</tr>
			</table>
			<td><center>
					<input type="submit" value="AddProduct" />
				</center></td>

		</form:form>

	</c:if>
	<!-- Displaying the Product data using Table -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">

					<table id="productTable" class="table table-bordered">

						<tr bgcolor="#a6a6a6">
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
							<tr bgcolor="#bfbfbf">
								<td>${product.proid}</td>
								<td>${product.proname}</td>
								<td>${product.price}</td>
								<td>${product.quantity}</td>
								<td>${product.catid}</td>
								<td>${product.supid}</td>
								<td><a
									href="<c:url value="deleteProduct/${product.proid}"/>"><span
										class="glyphicon glyphicon-trash"></span></a>&nbsp;&nbsp;&nbsp; <a
									href="<c:url value="updateProduct/${product.proid}"/>">Update</a>
								</td>
								<td><img src="<c:url value='${product.imgpath}'/>" height="30" width="25"></td>
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

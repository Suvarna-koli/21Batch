<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 <jsp:include page="Navbar.jsp"></jsp:include>
 
<h2><center>Manage Product</center></h2>

<body background="resources/img/bg1.jpg">
<form:form action="InsertProduct" modelAttribute="product">
<table align="center">
			<tr>
				<td colspan="2"><center>Product Details</center></td>
			</tr>
			<tr>
				<td>Product ID</td>
				<td><form:input path="proid" /></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><form:input path="proname" /></td>
			</tr>
			
			<tr>
				<td>Category</td>
				<td><form:select path="catid">
						<form:option value="0" label="------Select----" />
						<form:options items="${catlist}" />
					</form:select>
				</td>
			</tr>		
			<tr>
			
				<td>Supplier</td>
				<td><form:select path="supid">
						<form:option value="0" label="------Select----" />
						<form:options items="${suplist}" />
					</form:select>
				</td></tr>
			<tr>
				<td>Price</td>
				<td><form:input path="price" /></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td><form:input path="quantity" /></td>
			</tr>
			<tr>
				<td>Product Desc</td>
				<td><form:textarea path="prodesc" /></td>
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
		<td>Product ID</td>
		<td>Product Name</td>
		<td>Price</td>
		<td>Quantity</td>
		<td>Category Id</td>
		<td>Supplier Id</td>
		<td>Operation</td>
	</tr>
	<c:forEach items="${prodlist}" var="product">
		<tr bgcolor="">
			<td>${product.proid}</td>
			<td>${product.proname}</td>
			<td>${product.price}</td>
			<td>${product.quantity}</td>
			<td>${product.catid}</td>
			<td>${product.supid}</td>
			<td><a href="<c:url value="deleteProduct/${product.proid}"/>">Delete</a>
				<a href="<c:url value="updateProduct/${product.proid}"/>">Update</a>
			</td>
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

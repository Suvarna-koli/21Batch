<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <script src="resources/js/bootstrap.min.js"></script>
 <script src="resources/js/jquery.min.js"></script>
 
 <jsp:include page="Navbar.jsp"></jsp:include>
 
<h2><center>Manage Supplier</center></h2>

<!-- Category Form Started -->
<body background="resources/img/bg1.jpg">
<c:if test="${flag}">
	<form action="${pageContext.request.contextPath}/UpdateSupplier" method="post">
</c:if>
<c:if test="${!flag}">

<form action="AddSupplier" method="post">

</c:if>
<%
String contextPath = request.getContextPath();
%>
	<table align="center" cellspacing="2">
		<tr>
			<td colspan="2">Supplier Details</td>
			<c:if test="${flag}">
			<input type="hidden" name="supid" value="${supplier.supid}"/>
			</c:if>
		</tr>
		<tr>
			<td>Supplier Name</td>
			<c:if test="${flag}">
				<td><input type="text" name="supname" value="${supplier.supname}" /></td><br>
			</c:if>
			<c:if test="${!flag}">
				<td><input type="text" name="supname" /></td><br>
			</c:if>
		</tr>
		<tr>
			<td>Supplier Address</td>
			<c:if test="${flag}">
				<td><input type="text" name="supaddr" value="${supplier.supaddr}" /></td>
			</c:if>
			<c:if test="${!flag}">
			<td><input type="text" name="supaddr" /></td>
			</c:if>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="AddSupplier" /></td>
		</tr>
	</table>
</form>
<!-- Supplier Form Completed -->

<!-- Displaying the Supplier data using Table -->

<div class="container">
 <!-- <div class="wrapper">
       <img src="resources/img/bg.jpg" class="img-responsive" alt="Responsive image">
        
  </div> -->
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table id="SupplierTable" class="table table-bordered">

	<tr bgcolor="">
		<td><b>Supplier ID</b></td>
		<td><b>Supplier Name</b></td>
		<td><b>Supplier Desc</b></td>
		<td><b></b></td>
	</tr>
	<c:forEach items="${supdetail}" var="supplier">
		<tr>
			<td>${supplier.supid}</td>
			<td>${supplier.supname}</td>
			<td>${supplier.supaddr}</td>
			<td><a href="<c:url value="deleteSupplier/${supplier.supid}"/>">Delete</a></td>
				<td><a href="<c:url value="updateSupplier/${supplier.supid}"/>">Edit</a>
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
<jsp:include page="Footer.jsp"></jsp:include>

</html>

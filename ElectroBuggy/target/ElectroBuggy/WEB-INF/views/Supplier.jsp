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
 
<h2><center><font color="#800000" face="Monotype Corsiva" size="10" >Manage Supplier</font></center></h2>

<!-- Category Form Started -->
<body>
<c:if test="${flag}">
	<form action="${pageContext.request.contextPath}/UpdateSupplier" method="post">
	${pageContext.request.contextPath}
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
		</table><center><input type="submit" value="Submit"/>
		</center>
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

	<tr bgcolor="#a6a6a6">
		<td><b>Supplier ID</b></td>
		<td><b>Supplier Name</b></td>
		<td><b>Supplier Desc</b></td>
		<td colspan="2"><b>Operation</b></td>
	</tr>
	<c:forEach items="${supdetail}" var="supplier">
		<tr bgcolor="#bfbfbf">
			<td>${supplier.supid}</td>
			<td>${supplier.supname}</td>
			<td>${supplier.supaddr}</td>
			<td><a href="<c:url value="deleteSupplier/${supplier.supid}"/>">Delete</a></td>
				<td><a href="<c:url value="updateSupplier/${supplier.supid}"/>">Update</a>
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

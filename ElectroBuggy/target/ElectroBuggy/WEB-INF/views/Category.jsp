<%@ page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%><html>
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
 
<h2><center><font color="#800000" face="Monotype Corsiva" size="10" >Manage Category</font></center></h2>
<!-- Category Form Started -->
<body>
<c:if test="${flag}">
	<form action="${pageContext.request.contextPath}/UpdateCategory" method="post">
	 ${pageContext.request.contextPath}
</c:if>
<c:if test="${!flag}">
<form action="AddCategory" method="post">
</c:if>
<%
String contextPath = request.getContextPath();
%>

	<table align="center" cellspacing="2">
	
		<tr>
			<td colspan="2"><b>Category Details</b></td>
			<c:if test="${flag}">
			<input type="hidden" name="catid" value="${category.catid}"/>
			</c:if>
		</tr>
		<tr>
			<td><b>Category Name</b></td>
			<c:if test="${flag}">
				<td><input type="text" name="catname" value="${category.catname}" /></td><br>
			</c:if>
			<c:if test="${!flag}">
				<td><input type="text" name="catname" /></td><br>
			</c:if>
		</tr>
		<tr>
			<td><b>Category Description</b></td>
			<c:if test="${flag}">
				<td><input type="text" name="catdesc" value="${category.catdesc}" /></td>
			</c:if>
			<c:if test="${!flag}">
			<td><input type="text" name="catdesc" /></td>
			</c:if>
		</tr>
		
	</table>
		
			<center><input type="submit" value="Submit"/></center>
			</form>


<!-- Category Form Completed -->

<!-- Displaying the Category data using Table -->

<div class="container">
 
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table id="categoryTable" class="table table-bordered">

	<tr bgcolor="#a6a6a6">
		<td><b>Category ID</b></td>
		<td><b>Category Name</b></td>
		<td><b>Category Desc</b></td>
		<td colspan="2"><b>Operation</b></td>
	</tr>
	<c:forEach items="${catdetail}" var="category">
		<tr bgcolor="#bfbfbf">
			<td>${category.catid}</td>
			<td>${category.catname}</td>
			<td>${category.catdesc}</td>
			<td><a href="<c:url value="deleteCategory/${category.catid}"/>">Delete</a></td>
				<td><a href="<c:url value="updateCategory/${category.catid}"/>">Update</a>
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

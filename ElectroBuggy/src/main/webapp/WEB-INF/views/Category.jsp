<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <script src="resources/js/bootstrap.min.js"></script>
 <script src="resources/js/jquery.min.js"></script>
 
 <jsp:include page="NavbarAdmin.jsp"></jsp:include>
 
<h2><center>Manage Category</center></h2>

<!-- Category Form Started -->
<body background="resources/img/bge1.jpg">
<c:if test="${flag}">
	<form action="${pageContext.request.contextPath}/UpdateCategory" method="post"></form>
</c:if>
<c:if test="${!flag}">

<form action="AddCategory" method="post">
</form>
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
		<tr>
			<td colspan="2"><input type="submit" value="AddCategory" /></td>
		</tr>
	</table>

<!-- Category Form Completed -->

<!-- Displaying the Category data using Table -->

<div class="container">
 <!-- <div class="wrapper">
       <img src="resources/img/bg.jpg" class="img-responsive" alt="Responsive image">
        
  </div> -->
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table id="categoryTable" class="table table-bordered">

	<tr bgcolor="#FFFACD">
		<td><b>Category ID</b></td>
		<td><b>Category Name</b></td>
		<td><b>Category Desc</b></td>
		<td colspan="2"><b>Operation</b></td>
	</tr>
	<c:forEach items="${catdetail}" var="category">
		<tr bgcolor="#FFFFF0">
			<td>${category.catid}</td>
			<td>${category.catname}</td>
			<td>${category.catdesc}</td>
			<td><a href="<c:url value="deleteCategory/${category.catid}"/>">Delete</a></td>
				<td><a href="<c:url value="updateCategory/${category.catid}"/>">Edit</a>
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

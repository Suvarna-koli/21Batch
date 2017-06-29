<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <script src="resources/js/bootstrap.min.js"></script>
 <script src="resources/js/jquery.min.js"></script>
 <jsp:include page="Navbar.jsp"></jsp:include>
 
<h2><center>Manage Category</center></h2>
<!-- Category Form Started -->
<c:if test="${flag}">
	<form action="UpdateCategory" method="post">
</c:if>
<c:if test="${!flag}">

<form action="AddCategory" method="post">
</c:if>

	<table align="center" cellspacing="2">
		<tr>
			<td colspan="2">Category Details</td>
			<c:if test="${flag}">
			<input type="hidden" name="catid" value="${category.catid}"/>
			</c:if>
		</tr>
		<tr>
			<td>Category Name</td>
			<c:if test="${flag}">
				<td><input type="text" name="catname" value="${category.catname}" /></td><br>
			</c:if>
			<c:if test="${!flag}">
				<td><input type="text" name="catname" /></td><br>
			</c:if>
		</tr>
		<tr>
			<td>Category Description</td>
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
</form>
<!-- Category Form Completed -->

<div class="container">
<!-- Displaying the Category data using Table -->
<table cellspacing="2" align="center" border="1">

	<tr bgcolor="blue">
		<td>Category ID</td>
		<td>Category Name</td>
		<td>Category Desc</td>
		<td>Update</td>
		<td>Delete</td>
	</tr>
	<c:forEach items="${catdetail}" var="category">
		<tr>
			<td>${category.catid}</td>
			<td>${category.catname}</td>
			<td>${category.catdesc}</td>
		<%-- 	<td><a href="<c:url value="deleteCategory/${category.catid}"/>"><span class="glyphicon glyphicon-trash"></span></a>
				<a href="<c:url value="updateCategory/${category.catid}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
			</td>
		 --%>
		 <td><a href="<c:url value="updateCategory/${category.catid}"/>"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" value=""><span class="glyphicon glyphicon-pencil">Edit</span></button></a></td>
    <td><a href="<c:url value="deleteCategory/${category.catid}"/>"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></td>
    
    </tr>
	</c:forEach>
</table>
</div>
<!-- Completed Displaying Table -->

</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>

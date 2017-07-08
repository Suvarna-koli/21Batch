<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <script src="resources/js/bootstrap.min.js"></script>
 <script src="resources/js/jquery.min.js"></script>
 
 <jsp:include page="Navbar.jsp"></jsp:include>
 
<body background="resources/img/bg2.jpg">

	<h2>
		<center>Welcome to User page..!!</center>
	</h2>
		<c:forEach items="${categorylist}" var="category">

					<a href="CategoryWise/${category.catid }">${category.catname}</a>
</c:forEach>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<c:forEach items="${prolist}" var="product">

					<a href="ProDescription/${product.proid }" class="Thumbnail"> <img
						src="<c:url value="/resources/productImg/${product.proid}.jpg"/>" /></a>
					<div class="caption">
						<h4>${product.proname}</h4>

						<p>${product.price}</p>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>
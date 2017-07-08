<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>
<h2> hello user</h2>
	  
	<div class="container">
		<div class="row">
			<div class="col-md-12">
						<c:forEach items="${prolist}" var="product">
						<a href="ProDescription/${product.proid }" class="Thumbnail">
						<img src="<c:url value="/resources/productImg/${product.proid}.jpg"/>"/></a>
							<div class="caption">
							<p>${product.proname}</p>
							
							<p>${product.price}</p>
							</div>
						</c:forEach>
					
				</div>
			</div>
		</div>
	
	<!-- Completed Displaying Table -->

</body>

</html>

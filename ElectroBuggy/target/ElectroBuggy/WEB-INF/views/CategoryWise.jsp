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
 <jsp:include page="Navbar.jsp"></jsp:include>
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
 
<body background="<c:url value='/resources/img/bg2.jpg'/>">
	<h2>
		<center><font color="#800000" face="Monotype Corsiva" size="10" >Categorywise Products..!!</font></center>
	</h2>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
   


				<c:forEach items="${prolist}" var="product">

					<a href="<c:url value="/ProDescription/${product.proid}"/>" class="Thumbnail"> <img
						src="<c:url value='/resources/productImg/${product.proid}.jpg'/>"  height="200" width="200" class="thumbnail"/></a>
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
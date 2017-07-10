<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>

<jsp:include page="NavbarUser.jsp"></jsp:include>
 
<h2><center>Order Confirm</center></h2>

<body background="resources/img/bg1.jpg">


<div class="container">
 <div class="wrapper">
       <img src="resources/img/bg.jpg" class="img-responsive" alt="Responsive image">
        
  </div>
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table id="categoryTable" class="table table-bordered">

	<tr bgcolor="">
		<td><b>Product Name</b></td>
		<td><b>Quantity</b></td>
		<td><b>Sub Total</b></td>
		<td><b>Image</b></td>

	</tr>
	<c:forEach items="${cartlist}" var="cartitem">
		<tr>
			<td>${cartitem.proname}</td>
			<td><input type="text" value="${cartitem.quantity}" name="quantity"></td>
			<td>${cartitem.price*cartitem.quantity}</td>
			<td><img src="<c:url value='resources/productImage/${cartitem.proid}.jpg'/>" width="30" height="30"/></td>
</tr>
	<tr>
	<td colspan="3">Grant Total</td>
	<td>${grandtotal}</td>		
		
    </tr>
    </c:forEach>
</table>
</div>
</div>
</div>
</div>
<%-- 
<form action="<c:url value='/paymentConfirm'/>" method="get"> --%>

<div class="container">
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table class="table table-bordered">

<tr>
<td><a href="/payment"></a></td>
<td>Payment Mode</td>
<td>
<input type="radio" name="mode" value="CC"/>Credit Cart
<input type="radio" name="mode" value="IB"/>InternateBanking
<input type="radio" name="mode" value="CD"/>Cash On Delivery
</td>

	</tr>
	<tr>
	<td>Shpiment Address</td>
	<td><textarea name="shipping" rows="5" cols="20"></textarea>    
	</td>
	</tr>
	<tr bgcolor="Blue">
	<td colspan="2"><input type="submit" value="Pay"/></td>
	</tr>
</table>
</div>
</div>
</div>
</div>

</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>

<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <script src="resources/js/bootstrap.min.js"></script>
 <script src="resources/js/jquery.min.js"></script>
 
 <jsp:include page="NavbarAdmin.jsp"></jsp:include>
 
<h2><center>Manage Cart</center></h2>

<!-- Cart Form Started -->
<body background="resources/img/bg1.jpg">

<!-- Category Form Completed -->

<!-- Displaying the Category data using Table -->

<div class="container">
 <div class="wrapper">
       <img src="resources/img/bg.jpg" class="img-responsive" alt="Responsive image">
        
  </div>
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table id="categoryTable" class="table table-bordered">

	<tr bgcolor="">
		<td><b>Product ID</b></td>
		<td><b>Quantity</b></td>
		<td><b>Sub Total</b></td>
		<td><b>Image</b></td>
		<td><b>Operation</b></td>

	</tr>
	<c:forEach items="${cartlist}" var="cartitem">
		<tr>
			<td>${cartitem.proname}</td>
			<td>${cartitem.quantity}</td>
			<td>${cartitem.price*cartitem.quantity}</td>
			<td><img src="<c:url value='resources/productImage/${cartitem.proid}.jpg'/>" width="30" height="30"/></td>
			<td>
			<input type="submit" value="UPDATE" class="btn-success btn-block"/>
			<input type="submit" value="DELETE" class=""/>
			</td>
		
    </tr>
    </c:forEach>
    <tr>
    <td><a href="ProductPage">ContinueShopping</a></td>
    <td><a href="CheckOut">CheckOut</a></td>
	
</table>
</div>
</div>
</div>
</div>

<!-- Completed Displaying Table -->

</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>

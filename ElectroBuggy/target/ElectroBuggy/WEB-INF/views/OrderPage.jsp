<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
 
<h2><center><font color="#800000" face="Monotype Corsiva" size="10" >Order Confirm</font></center></h2>

<body>

<form action="<c:url value="/payment"/>">
<div class="container">
	<div class="row">        
        <div class="col-md-12">
        <div class="table-responsive">

              <table id="categoryTable" class="table table-bordered">

	<tr bgcolor="#a6a6a6">
		<td><b>Product Name</b></td>
		<td><b>Quantity</b></td>
		<td><b>Sub Total</b></td>
		<td><b>Image</b></td>

	</tr>
	<c:forEach items="${cartlist}" var="cartitem">
		<tr bgcolor="#bfbfbf">
			<td>${cartitem.proname}</td>
			<td>${cartitem.quantity}</td>
			<td>${cartitem.price*cartitem.quantity}</td>
			<td><img src="<c:url value='/resources/productImg/${cartitem.proid}.jpg'/>" width="30" height="30"/></td>
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
        <div class="table-responsive">
        
	<div class="row">        
        <div class="col-md-12">
              <table class="table table-bordered">
			
<label><i><b><h4>Payment Mode</h4></b></i></label><br>

<label><input type="radio" name="paymode" value="CC"><span class="glyphicon glyphicon-credit-card">Credit Card</span></label>
<label><input type="radio" name="paymode" value="NB"><span class="glyphicon glyphicon-piggy-bank">NetBanking</span></label>
<label><input type="radio" name="paymode" value="COD"><span class="glyphicon glyphicon-usd">CashOnDelivery</span></label><br><br>


<div><b><label>Shpiment Address</label></b>
<br>
	<input type="text" name="shipmentaddress" value="<c:out value="${shipmentaddress}"/>"readonly/>    
	</div>
	</table>
	</div>
	</div>
	</div>
	</div>
	
<br><br>
<div class="container">
        <div class="table-responsive">
        
	<div class="row">        
        <div class="col-md-12">
              <table class="table table-bordered">
			

			<tr bgcolor="#E0FFFF">
			<td> <c:set var="grandtotal" value="${total}"/> 
			
			<input type="text" name="grandtotal" value="<c:out value="${grandtotal}"/>" readonly></td>
			
			 </tr>
			</table>
			
			</div>
			</div>
</div>
</div>
		<div>
		<center>	<input type="submit" class="btn btn-primary" value="Place Order"></center>
</div>

</form>

</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<body>

<center>

 <b><center><font color="#800000" face="Monotype Corsiva" size="10" >Bill Receipt</font></center></b>
 
<div class="container">
<div class="table-responsive">
<table class="table">
<thead>
	<tr bgcolor="#a6a6a6">
		<td>Cart ItemID</td>
		<td>product id</td>
		<td>product Price</td>
		<td>Quantity</td>

	</tr>
	</thead>
	<tbody>
	<c:forEach items="${cartlist}" var="cartitem">
		<tr bgcolor="#bfbfbf">
			<td>${cartitem.cartItemid}</td>
			<td>${cartitem.proid}</td>
			<td>${cartitem.price}</td>
			<td>${cartitem.quantity}</td>
			</tr>
			</c:forEach>			
			</tbody>
			</table>
			
			</div>
	<br><br>
	<div class="table-responsive">
<table class="table">

	<tr bgcolor="#a6a6a6">
		 	<td>Payment mode</td>
		<td>Shipment address</td>
		<td>Payment Status</td>
		<td>Final Amount</td>
	</tr>
	<c:forEach items="${orderlist}" var="orderitem">
		<tr bgcolor="#bfbfbf">
			<td>${orderitem.paymode}</td>
			<td>${orderitem.shipmentaddress}</td>
			<td>${orderitem.status}</td>
			<td>${orderitem.grandtotal}</td>
			
			
			</tr>
			</c:forEach>			
			
		</table>
			</div>
	
</div>
<h3>Order will be deliver to You..!!
<br>Thank you..!!!
</h3>
</center>			
</body>
</html>
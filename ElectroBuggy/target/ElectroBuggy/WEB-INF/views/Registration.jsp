<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #3399ff;
	color: white;
	padding: 14px 20px;
	margin: 24px 0 12px 0;
	border: none;
	cursor: pointer;
	width: auto;
}

.cancelbtn {
	width: auto;
	padding: 14px px;
	background-color: #f44336;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}
</style>

<jsp:include page="Navbar.jsp"></jsp:include>

<body>
	<script type="text/javascript">
function checkPass()() 
{
   if (document.getElementById("password").value !=
           document.getElementById("confirm_password").value) {
   
	   alert("Password should be same...");
	   
   }

</script>


	<form:form action="SignUp" modelAttribute="user" style="border:1px solid #ccc" method="POST">
	<h2><font color="#800000" face="Monotype Corsiva" size="10" >Signup Form</font></h2>
	<div class="container">
<div>
		<label><b>User Name</b></label>
		<form:input path="username"/>
	<form:errors path="username" cssStyle="color:red"></form:errors>
	</div>
	<div>
		<label><b>Email</b></label>
		<form:input path="email"/>
		<form:errors path="email" cssStyle="color:red"></form:errors>
		</div>
		<div>
		<label><b>Customer Name</b></label>
		<form:input path="CustName"/>
	<form:errors path="CustName" cssStyle="color:red"></form:errors>
	</div>

<div>		<label><b>Password</b></label>
		<form:input id="password" path="password"/>
			<form:errors path="password" cssStyle="color:red"></form:errors>
</div>

		<div>
	
		<label><b>Confirm Password</b></label>
    <input type="password" name="pass1" id="confirm_password" class="form-control inputpass"  onkeyup='checkPass();' required>
    </div>
    
	<div>
		<label><b>Address</b></label>
		<form:input path="Addr"/>
		<form:errors path="Addr"></form:errors>
		</div>
		<div>
		<label><b>Mobile</b></label>
		<form:input path="Mobile"/>
		<form:errors path="Mobile" cssStyle="color:red"></form:errors>
		</div>
		<%--  <form:input  checked="checked"/> Remember me --%>
		
		<div class="clearfix">
			<button type="button" class="cancelbtn">Cancel</button>
			<button type="submit" class="signupbtn">SignUp</button>
		</div>

</div>
</fieldset>
	</form:form>

</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
</head>
 <style>
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #3399ff;
	color: white;
	padding: 14px 20px;
	margin:  24px 0 12px 0;
	border: none;
	cursor: pointer;
	width: auto;
}


.cancelbtn {
	width: auto;
	padding: 14px px;
	background-color: #f44336;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }

}
</style>
 
<jsp:include page="Navbar.jsp"></jsp:include>
 
<body>
<script type="text/javascript">
function confirmpass() 
{
   if (document.getElementById("password").value !=
           document.getElementById("confirm_password").value) {
   
	   alert("Password should be same...");
	   
   }

</script>

<h2>Signup Form</h2>

<form action="SignUp" style="border:1px solid #ccc" method="POST">
  <div class="container">
<div>
    <label><b>User Name</b></label>
    <input type="text" placeholder="Enter User Name" name="username" pattern=".{5,15}" title="Username must have 5 to 15 characters" required>
    <label><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" pattern="^[a-z0-9_]+@[a-z0-9.]+\.[a-z]{2,4}$" title="You are pssing wrong email type"
     required>		
</div>
<div>
    <label><b>Customer Name</b></label>
    <input type="text" placeholder="Enter customer name" name="CustName" pattern=".{5,40}" title="Name must have 5 to 40 characters" required>
    
    </div>
    <div>
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" class="form-control inputpass"   onkeyup='checkPass();' pattern=".{5,15}" title="password must have 5 to 15 charactersor numbers" required>
    <label><b>Confirm Password</b></label>
      </div>
      
      <div>
    <input type="password" placeholder="confirm_password" name="confirm_password" id="confirm_password" class="form-control inputpass"  onkeyup='checkPass();' required>
    </div>
    
    <div>
    <label><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="Addr" required>
     </div>
       <div class="form-group">
    <label><b>Mobile</b></label>
    <input type="text" placeholder="Enter Mobile Number" name="Mobile" class="form-control Mobile" pattern="[789][0-9]{9}" title="Mobile number should have 10 digits and should start with 7/8/9" required>
                    <form:errors path="Mobile" cssStyle="color:red"></form:errors>
    </div>
    <input type="checkbox" checked="checked"> Remember me
    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">SignUp</button>
    </div>
    
    
  </div>
</form>

</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html> --%>
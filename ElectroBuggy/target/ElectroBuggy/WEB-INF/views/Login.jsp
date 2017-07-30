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
</head>
 <style>


input[type=text], input[type=password] {
	width: auto;
	padding: 12px 20px;
	margin:  24px 0 12px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border;
}

button {
	background-color: #3399ff;
	padding: 14px 20px;
	margin:  24px 0 12px 0;
	border: none;
	cursor: pointer;
	width: auto;
}

/* button:hover {
	opacity: 0.8;
}
 */
.cancelbtn {
	width: auto;
	padding: 14px 20px;
	background-color: #f44336;
}

/* .imgcontainer {
	text-align: left;
	margin: 24px 0 12px 0;
}

img.avatar {

	w"F:/css/bg2.jpg"idth: 40%;
	border-radius: 50%;
} */

@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
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
 
 <jsp:include page="Navbar.jsp"></jsp:include>
 
<body>


	<form action="perform_login" method="post">
	 <!-- <form action="login" method="post">  -->
<!-- 		<div class="imgcontainer">
			<img
				src="resources/img/User.jpg"
				alt="User" class="user">
		</div>
 -->
		<div class="container">

 		
	<label><h2><font color="#800000" face="Monotype Corsiva" size="10" >Login Form</font></h2>
		</label>
		<br>
			<label><span class="glyphicons glyphicons-user"></span><b>Username</b></label>
			<input type="text"
				placeholder="Enter Username" name="username" required><br>
			<label><b>Password</b></label>
			<span class="glyphicons glyphicons-lock"></span> <input type="password"
				placeholder="Enter Password" name="password" minlength="4" maxlength="10"  onkeyup="checkPass();" required><br>

			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" value="SUBMIT">Login</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
			

			<button type="button" class="cancelbtn">Cancel</button>
		<input type="checkbox" checked="checked"> Remember me
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
		</div>
		<u><a href="Registration">New to Electro-Buggy?? Sign up</a></u>

		<div class="container" style="background-color:">
			<span class="psw">Forgot <a href="getPassword.jsp">password?</a></span>
		</div>
		<div class="text-center" style="color: red">${errorLoginMessage}</div><br/>
	
	
	
	
	
	
	</form>

</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html>

<!DOCTYPE html>
<html>
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
	padding: 10px 18px;
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

<h2>Signup Form</h2>

<form action="SignUp" style="border:1px solid #ccc" method="POST">
  <div class="container">

    <label><b>User Name</b></label>
    <input type="text" placeholder="Enter User Name" name="username" required>
    <label><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" onchange="email_validate(this.value);" required>

    <label><b>Customer Name</b></label>
    <input type="text" placeholder="Enter customer name" name="CustName" required>
    
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" class="form-control inputpass" minlength="4" maxlength="10"  onkeyup="checkPass();" required>
    
    <label><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="Addr" required>
       <div class="form-group">
    <label><b>Mobile</b></label>
    <input type="text" placeholder="Enter Mobile Number" name="Mobile" class="form-control Mobile" maxlength="10" onkeyup="validatephone(this);" required>
                    
    </div>
    <input type="checkbox" checked="checked"> Remember me
    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">SignUp</button>
    
    
  </div>
</form>

</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html>
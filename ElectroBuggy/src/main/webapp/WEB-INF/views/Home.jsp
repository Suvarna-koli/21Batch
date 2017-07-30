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

<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
   /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
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
</head>
<body>

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
 
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="resources/img/watch1.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
         
        </div>
      </div>

      <div class="item">
        <img src="resources/img/watch2.jpg" alt="secondslide" width="460" height="345">
        <div class="carousel-caption">
         
        </div>
      </div>
      
      <div class="item">
        <img src="resources/img/watch3.jpg" alt="thirdslide" width="460" height="345">
        <div class="carousel-caption">
         
        </div>
      </div>
</div>    
</div>
</div>
<br><br>
<!-- <div> 
  			<div class="row">
				<div class="col-sm-4">
					<iframe  class="active"
						src="https://www.youtube.com/embed/ctj-RDbTBMU"> </iframe>
					<p><big><b>What We Do???</b></big></p>
				</div>
				
				<div class="row">
				<div class="col-sm-4">
					<iframe  class=""
						src="https://www.youtube.com/embed/ctj-RDbTBMU"> </iframe>
					<p><big><b>What We Do???</b></big></p>
				</div>
				
				
  
    </div>
    </div>
    </div> -->
    <div>
    <div class="row">
    <div class="col-sm-12">
      <div class="well">
       <p><center><i><h2>"Time is what keeps everything from happening at once."</h2></i></center></p>  
       <p><center><i><b>-Ray Cummings</b></i></center></p>
      </div>
   </div>
   </div>
   </div>
  
</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>

<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
  
 <center> <h2 style="background-color:"">Welcome To Shopping Cart</h2></center>

<jsp:include page="Navbar.jsp"></jsp:include>
</head>
<body background="resources/img/bg2.jpg">

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

<div class="container text-center">    
  			<div class="row">
				<div class="col-sm-4">
					<iframe  class="active"
						src="https://www.youtube.com/embed/ctj-RDbTBMU"> </iframe>
					<p><big><b>What We Do???</b></big></p>
				</div>
				
				
    <div class="col-sm-4"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Project 2</p>    
    </div>
    <div class="col-sm-4">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
    </div>
    </div>
   
  
</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style>

</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></head>
<body background="resources/img/bg2.jpg"><%-- 
<form action="perform_login" method="post"> --%>

                    <div class="container-fluid">
                        <div class="row">
                              <h2 class="text-center" style="color: #f0ad4e;"> <Strong> Register </Strong></h2> <hr />
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-user"></span>
                                             </div>
                                             <input type="text" class="form-control" placeholder="Enter User Name" name="name">
                                          </div>

                                    </div>
                                 </div>

                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                             </div>
                                             <input type="email" class="form-control" placeholder="Enter E-Mail" name="mail">
                                          </div>
                                       </div>
                                    </div>
                                 </div>

                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-lock"></span>
                                             </div>
                                             <input type="password" class="form-control" placeholder="Enter Password" name="password">
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <hr>
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <button type="submit" class="btn btn-lg btn-block btn-warning"> Register</button>
                                       </div>
                                    </div>
                                 </div>
                        </div>
                     </div>
                     </div>
                     
</body>
</html>
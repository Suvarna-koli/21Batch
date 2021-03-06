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
 
<body>

	<h2>
		<center><font color="#800000" face="Monotype Corsiva" size="10" >Welcome to User page..!!</font></center>
	</h2>

    
<%--   <%@ page import="com.mobitel.Mobitel.BackEnd.dao.CategoryDAO"%>
	<%@ page import="com.mobitel.Mobitel.BackEnd.model.Category"%>
	<%@ page import="java.util.List"%>
	<%@ page import="org.springframework.ui.Model"%>
	<%@ page import="org.springframework.beans.factory.annotation.Autowired"%>
	<%!
	class CategoryWise{
		@Autowired
		CategoryDAO categoryDAO;
		
		@Autowired
		Category category;
		
	public void CategoryWise(Model m)
	{
		
	Category category=new Category();
	List<Category> catlist=categoryDAO.getCategoryDetails();
	m.addAttribute("catlist",catlist);
	}
	}
	%> --%>
	
<div class="container">
  <div class="dropdown">
 <!--    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Categories
<span class="caret"></span></button>
    
<ul class="dropdown-menu">
   -->  	<c:forEach items="${catlist}" var="category">
					<a href="<c:url value="CategoryWise/${category.catid}"/>"><font color="#800000" face="Monotype Corsiva" size="5" > <br>${category.catname}<br></font>

</a>


</c:forEach>
</div>
</div>        
	
	
				
			
</body>
<jsp:include page="Footer.jsp"></jsp:include>

</html>
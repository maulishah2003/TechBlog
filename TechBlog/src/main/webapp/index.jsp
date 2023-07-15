<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"  %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- css -->
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
	<link href="css/MyStyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 70% 94%, 36% 100%, 0 94%, 0 0);
		}
	</style>
	
</head>
<body>

<%@ include file="navbar_normal.jsp" %>

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron text-white banner-background" style="background:#7e57c2">
		
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<h3>TechBlog</h3>
				<p>A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>		
				<p>The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language.</p>
				
				<button class="btn btn-outline-light btn-lg"> <span class="fa fa-external-link"></span> Start! It's free</button>
				<a href="login-page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-o"></span> Login</a>
			</div>	
		</div>			
	</div>
	
	<div class="container">
	
		<div class="row mb-2">
		
			<div class="col-md-4"> 	
				<div class="card">
					<div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn text-white" style="background:#9575cd">Read More</a>
				  	</div>
				</div>
			</div>
			
			<div class="col-md-4"> 	
				<div class="card">
					<div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn text-white" style="background:#9575cd">Read More</a>
				  	</div>
				</div>
			</div>
			
			<div class="col-md-4"> 	
				<div class="card">
					<div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn text-white" style="background:#9575cd">Read More</a>
				  	</div>
				</div>
			</div>
		</div>
		
		<div class="row mb-2">
		
			<div class="col-md-4"> 	
				<div class="card">
					<div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn text-white" style="background:#9575cd">Read More</a>
				  	</div>
				</div>
			</div>
			
			<div class="col-md-4"> 	
				<div class="card">
					<div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn text-white" style="background:#9575cd">Read More</a>
				  	</div>
				</div>
			</div>
			
			<div class="col-md-4"> 	
				<div class="card">
					<div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn text-white" style="background:#9575cd">Read More</a>
				  	</div>
				</div>
			</div>
		</div>
		
		
	</div>
	
	<!-- javascripts -->
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- <script src="js/Myjs.js" type="text/javascript"></script>  -->
	
</body>
</html>
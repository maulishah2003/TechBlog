<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
	<link href="css/MyStyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 69% 93%, 33% 97%, 0 91%, 0 0);
		}
	</style>
</head>
<body>

	<%@include file="navbar_normal.jsp" %>

	<main class="d-flex align-items-center banner-background " style="height:70vh ; background:#7e57c2" >
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-white text-center" style="background:#9575cd">
						<span class="fa fa-user-plus fa-3x"></span>
						<br>
							<p>Login here</p>
						</div>
						
						<%
						 Message m = (Message)session.getAttribute("msg");
						if(m!=null){
							%>
							
							<div class="alert alert-danger" role="alert">
							 <%=m.getContent() %>
							</div>
							
							
							
							<% 
							
							session.removeAttribute("msg");
						}
						
						
						%>
						
						<div class="card-body">
							<form action="LoginServlet" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" name="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  
							  <!--  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">Check me out</label>
							  </div> -->
							  
							  <div class="container text-center" >
							  	<button type="submit" class="btn text-white" style="background:#9575cd">Submit</button>
							  </div>
							  
							  
							</form>
						
						</div>
					
					
					</div>
				
				
				
				</div>
			
			</div>
		
		</div>
	
	</main>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>
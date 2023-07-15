<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
	<link href="css/MyStyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	
	<style>
		.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 69% 96%, 31% 100%, 0 96%, 0 0);
		}
	
	</style>
</head>

<body>
	<%@include file="navbar_normal.jsp" %>
	<main style="background:#7e57c2 ; padding-bottom:50px" class="p-5 banner-background">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center text-white" style="background:#9575cd">
						<span class="fa fa-user-circle-o fa-3x"></span>
						<br>
						Register Here.
					</div>
					
					<div class="card-body">
						<form id="Reg_Form" action="RegisterServlet" method="post">
						
							<div class="form-group">
							    <label for="exampleInputEmail1">User Name</label>
							    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
							    
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" name="user_email"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" name="user_password"class="form-control" id="gender" placeholder="Password">
							  </div>
							  
							  
							   <div class="form-group">
							    <label for="Gender">Select Gender</label>
							    <br>
							    <input type="radio"  id="gender" name="gender" value="Male">Male
							     <input type="radio"  id="gender" name="gender" value="Female">Female
							  </div>
							  
							 <div class=""form-group>
							 	<textarea placeholder="Enter something about yourself" name="about" class="form-control" row="5">About</textarea>
							 
							 </div>
							  
							  
							  <div class="form-check">
							    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">Agree tearms and conditions</label>
							  </div>
							  
							  <br>
							  
							  <button type="submit" style="background:#9575cd" class="btn text-white">Submit</button>
						</form>
					
					</div>
		
				
				</div>
			
			</div>
		
		</div>
	
	</main>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function(){
			console.log("Loaded...");
			
			$('#Reg_Form').on('submit' , function(event){
				event.preventDefault();
				let form = new FormData(this);
				
				$.ajax({
					url:"RegisterServlet",
					type:"post",
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data);
						
					/*swal.fire("Registered Successfully", "We are redirecting you to login page", "success").then(
								funaction(){
									window.location = "login-page.jsp";
								});*/
						swal("Registered Successfully", "We are redirecting you to login page", "success").then((values)=>{
						window.location="login-page.jsp" ;
						})
						
					},
					
					error:function(data,textStatus,jqXHR){
						console.log(jqXHR);
						swal("Here's the title!", "...and here's the text!");
					},
					
					processData:false,
					contentType:false
				});
			});
		});
	
	</script>

</body>
</html>
<%@page import="com.tech.blog.entities.user" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import= "java.util.ArrayList" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="java.text.*" %>
<%
	user user = (user) session.getAttribute("CurrentUser");
	if(user==null){
		response.sendRedirect("login-page.jsp");
	}
%>


<%

	int postId = Integer.parseInt(request.getParameter("post_id"));
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	
	Post p = d.getPostByPostId(postId);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getPtitle() %>Let's learn together.. </title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
	<link href="css/MyStyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="js/Myjs.js"> </script>
	<style>
		.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 70% 94%, 36% 100%, 0 94%, 0 0);
		}
		
		.post_title{
		font-weight:100;
		font-size:30px
		}
		
		.post_content{
		font-weight:100;
		font-size:25px
		}
		
		.post_date{
		font-style:italic;
		font-weight:bold;
		font-size:13px
		}
		
		.post_user_info{
		font_weight:100;
		font_size:20px;
		}
		
		.row_user{
		border:1px solid #e2e2e2;
		padding-top: 15px;
		}
		
		body{
			background: url(images/bgimage.jpg);
			background-size:cover;
			background-attachment:fixed;
		}
	</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#673ab7;">
	  <a class="navbar-brand" href="index.jsp"> <sapn class="fa fa-asterisk"></sapn>  TechBlog </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="profile.jsp"> <span class="	fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Categories
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Programming Languages</a>
	          <a class="dropdown-item" href="#">Data Structure and Algorithms</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Project</a>
	        </div>
	      </li>
	      
	      <li class="nav-item">
	        <a class="nav-link" href="#"> <span class="	fa fa-phone"></span> Contact Us</a>
	      </li>
	      
	      <li class="nav-item">
	        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="	fa fa-asterisk"></span> Post Something</a>
	      </li>      
	    </ul >
	   
	   <ul class="navbar-nav mr-right">
	   
			  <li class="nav-item">
			       <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= user.getName() %> </a>
			       
			       
			   </li>
			   
	   		<li class="nav-item">
		        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-circle-o"></span> Logout </a>
		   	</li>
	   </ul>
	  </div>
	</nav>
	
	
		<!-- main content of body -->
		
			<div class="container">
				<div class="row my-4">
					<div class="col-md-6 offset-md-2">
					
					<div class="card"> 
						<div class="card-header text-white" style="background:#9575cd">
							<h4 class="post_title" ><%=p.getPtitle() %></h4>
						</div>
						

						
						
						<div class="card-body">
							<img class="card-img-top my-2" src="Pictures/<%=p.getPpic() %>">
							
							<div class="row my-3 row_user">
							
								<div class="col-md-8 ">
									<% UserDao ud = new UserDao(ConnectionProvider.getConnection()); %>
									<p class="post_user_info"> <a href="#!"> <%=ud.getUserByUserId(p.getUserid()).getName() %> </a> has posted</p>
								</div>
								
								<div class="col-md-4">
									<p class="post_date"> <%= DateFormat.getDateTimeInstance().format(p.getPdate()) %> </p>
								</div>
						</div>
						
						
							<p class="post_content"><%=p.getPcontent() %></p>
							<br>
							<br>
							
							<div>
								<pre class="post_code"><%=p.getPcode() %></pre>
							</div>
						</div>
							
						
						
						<div class="card-footer text-center" style="background:#9575cd">
							<a href="#!" onclick="doLike(<%=p.getPid() %> , <%=user.getId() %>)" class="btn btn-outline-primary btn-small text-white"><i class="fa fa-thumbs-o-up"><span> 10 </span></i></a>
							
							<a href="#!" class="btn btn-outline-primary btn-small text-white"><i class="fa fa-commenting-o"><span> 20 </span></i></a>
						</div>
						
					</div>
					
					
					
				
				
				</div>
				
				
			
			
			
			</div>
			</div>
		
		<!-- End of main content of body -->
		
	
	<!--Show blogs
	<h1>post id: <%=postId %></h1>-->
	
	
		
	<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header text-white text-center" style="background:#9575cd">
		        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<div class="container text-center">
		       		
		       		<img src="Pictures/<%=user.getProfile() %>" class="img-fluid" style="border-radius:50% ; max-width:150px">
		       		<h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
		       	
		       	<!-- details -->
		     <div id="profile_detail">
				<table class="table">
					  
					  <tbody>
					    <tr>
					      <th scope="row">Id</th>
					      <td><%=user.getId() %></td>
					     
					    </tr>
					    <tr>
					      <th scope="row">Email Address</th>
					      <td><%=user.getEmail() %></td>
					      
					    </tr>
					    <tr>
					      <th scope="row">Gender</th>
					      <td><%=user.getGender() %></td>
					      
					    </tr>
					    
					    <tr>
					      <th scope="row">Status</th>
					      <td><%=user.getAbout() %></td>
					      
					    </tr>
					    
					    <tr>
					      <th scope="row">Registered On</th>
					      <td><%=user.getDateTime().toString() %></td>
					      
					    </tr>
					  </tbody>
					</table>
				
				</div>
		       	
		       	<!-- profile edit -->
		       	<div id="profile_edit" style="display:none ">	       	
		       		<h2 class="mt-2">Please edit carefully</h2>
		       		<form action="EditServlet" method="post" enctype="multipart/form-data">
		       			
		       			<table class="table">
		       				<tr>
		       					<td> ID: </td>
		       					<td> <%= user.getId() %> </td>
		       				</tr>
		       				
		       				<tr>
		       					<td> Email: </td>
		       					<td><%= user.getEmail() %> </td>
		       				</tr>
		       				
		       				<tr>
		       					<td> Name: </td>
		       					<!-- <td> <input type="text" class="form-control" id="user-name" value="<%= user.getName() %>"></td> -->
		       					<td> <%= user.getName() %> </td>
		       				</tr>
		       			
		       			
		       				<tr>
		       					<td> Password </td>
		       					<td> <input type="password" class="form-control" id="user-password" value="<%= user.getPassword() %>"></td>
		       				</tr>
		       				
		       				<tr>
		       					<td> Gender: </td>
		       					<td> <%= user.getGender() %> </td>
		       				</tr>
		       				
		       				<tr>
		       					<td> About </td>
		       					<td> 
		       						<textarea rows="5"  class="form-control" name="user-about"> <%= user.getAbout() %>
		       						</textarea>
		       					</td>
		       				</tr>
		       				
		       				<tr>
		       					<td> Select new profile pic </td>
		       					<td> 
		       					 	<input type="file" name="image" class="form-control">
		       					</td>
		       				</tr>
		       			
		       			
		       			</table>
		       		
		       		<div class="container"><button class="btn btn-outline-primary">Save</button></div>
		       		</form>
		       	</div>
		       	
		       	
		       	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" id="edit-profile-button" class="btn text-white" style="background:#9575cd">Edit</button>
		      </div>
		    </div>
		  </div>
		</div>	
	<!-- end of profile modal -->
	
	<!-- add post modal -->
				
	
		
		<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Provide post details. </h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        
		        <form action="AddPostServlet" method="post" id="add-post-form">
		        	
		        	<div class="form-group">
		        	
			        	<select class="form-control" name="cid">
			        		<option selected disabled>---Select Category--- </option>
			        		
			        		<%
			        			PostDao postd = new PostDao(ConnectionProvider.getConnection());
			        			ArrayList<Category> list = postd.getCategories();
			        			
			        			for(Category c:list){
			        		%>
			        		
			        			<option value="<%=c.getCid() %>"> <%= c.getName() %>  </option>
				        		
				        		
				        		<% 
			        			}
			        		
			        		
			        		
			        			%>
			        		
			        	</select>
		        	
		        	</div>
		        	<div class=form-group>
		        		<input type="text" name="ptitle" placeholder="Enter post title" class="form-control">
		        	</div>
		        	
		        	<div class="form-group">
		        		<textarea name="pcontent" class="form-control" style="height:200px" placeholder="Enter your content"></textarea>
		        	</div>
		        	
		        	<div class="form-group">
		        		<textarea name="pcode"class="form-control" style="height:200px" placeholder="Enter your programme(If any)"></textarea>
		        	</div>
		        	
		        	<div class="form-group">
		        	<label>Select your pic</label>
		        	<br>
		        		<input type="file" name="pic" >
		        	</div>
		        	
		        	<div class="container  text-center">
		        		<button type="submit" class="btn btn-outlined-primary">Post</button>
		        	</div>
		        	
		        
		        </form>
		        
		        
		        
		      </div>
		      
		    </div>
		  </div>
		</div>
	<!-- end add post modal -->
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<!--  <script src="js/Myjs.js" type="text/javascript"></script>	-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	
		$(document).ready(function(){
			
			let editStatus = false;
			
			$('#edit-profile-button').click(function(){
				//alert("Button clicked");
				if(editStatus == false){
					$('#profile_detail').hide()
					
					$("#profile_edit").show();
					editStatus=true;
					$(this).text("BAck");
				}
				
				else{
					$('#profile_detail').show()
					
					$("#profile_edit").hide();
					editStatus=false;
					$(this).text("Edit");
				}
				
			})
			
		})
	

	</script>
	
	<!--now add post js-->
	
	<script>
		$(document).ready(function (e){
			//alert("loaded...")
			$("#add-post-form").on("submit" , function(event){
				//this code gets called when form is submitted.
				event.preventDefault();
				
				console.log("You have clicked on post")
				
				let form = new FormData(this);
				
				//now requesting to server
				$.ajax({
					url:"AddPostServlet",
					type:"Post",
					data: form,
					success: function(data , textStatus , jqXHR){
						//success
						console.log(data);
						if(data.trim()=="Done"){
							swal("Good job!", "Post Saved Successfully", "success");
						}
						
						else{
							swal("Error!!", "Something went wrong!!Try again.", "error");
						}
					},
				
					error:function(jqXHR, textStatus ,errorThrown ){
						//error..
						swal("Error!!", "Something went wrong!!Try again.", "error");
					},
						
					processData:false,
					contentType:false
				})
			})
		})
	
	</script>
	
	
</body>
</html>
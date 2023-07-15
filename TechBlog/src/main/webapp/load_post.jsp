<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="java.util.List" %>

<div class="row">
<%

	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if(cid==0){
		posts = d.getAllPost();
	}
	
	else{
		posts = d.getPostByCatId(cid);	
	}
	
	if(posts.size()==0){
		out.println("<h3 class='display-3 text-center'>No post in this category</h3>");
		return;
	}
	
	for(Post p: posts){
%>
	<div class="col-md-6 mt-2">
		<div class="card">
		<!--<img class="card-img-top" src="..." alt="Card image cap">-->
		<img class="card-img-top" src="Pictures/<%=p.getPpic() %>">
			<div class="card-body">
				<b>
					<%=p.getPtitle() %>
				</b>
				
				<p><%=p.getPcontent() %></p>
				<!--<pre><%=p.getPcode() %></pre>-->
				
			</div>
			
			<div>
				<div class="card-footer bg-light text-center">
					<a href="#!" class="btn btn-outline-primary btn-small"><i class="fa fa-thumbs-o-up"><span> 10 </span></i></a>
					<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-primary btn-small">Read More..</a>
					
					<a href="#!" class="btn btn-outline-primary btn-small"><i class="fa fa-commenting-o"><span> 20 </span></i></a>
				</div>
				
			</div>
			
		
		
		</div>
	
	
	</div>



<%
	}


%>
</div>

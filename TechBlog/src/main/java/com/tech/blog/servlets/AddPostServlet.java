package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String ptitle = request.getParameter("ptitle");
		String pcontent = request.getParameter("pcontent");
		String pcode = request.getParameter("pcode");
		
		Part part = request.getPart("pic");
		
		//getting current userid
		
		HttpSession s = request.getSession();
		user user = (user) s.getAttribute("CurrentUser");
		//user.getId()
		
		//out.println("your post title is: " + ptitle);
		//out.println(part.getSubmittedFileName());
		
		Post p = new Post(ptitle,pcontent,pcode , part.getSubmittedFileName() , null ,cid , user.getId());
		
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
			out.println("Done");
		}
		
		else
		{
			out.println("Error");
		}
		
		
	}

}

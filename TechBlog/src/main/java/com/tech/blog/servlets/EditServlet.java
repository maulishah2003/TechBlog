package com.tech.blog.servlets;

import java.io.File;
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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		
		//fetch all data
		
		//String userEmail = request.getParameter("user-email");
		PrintWriter out = response.getWriter();
		
//		String userName = request.getParameter("user-name");
		
		String userPassword = request.getParameter("user-password");
		String userAbout = request.getParameter("user-about");
		
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		//get user from session
		
		HttpSession s = request.getSession();
		user user = (user)s.getAttribute("CurrentUser");
		//user.setName(userName);
		
		user.setAbout(userAbout);
		user.setPassword(userPassword);
		user.setProfile(imageName);
		
		//update data in db
		
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		
		boolean ans = userdao.updateUser(user);
		if(ans) {
			//out.println("Updated to db");
			
			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
			
			Helper.deleteFile(path);
			
				if(Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile updated.");
					Message msg = new Message("Profile details Updated" , "Success" , "alert-success");
					//HttpSession s = request.getSession();
					s.setAttribute("msg", msg);
				}
			
			
				else {
				out.println("File not updated.");
				Message msg = new Message("Something went wrong." , "error" , "alert-danger");
				//HttpSession s = request.getSession();
				s.setAttribute("msg", msg);

			}
		}
		
		else {
			out.println("Not updated");
			Message msg = new Message("Something went wrong." , "error" , "alert-danger");
			//HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
		}
		
		response.sendRedirect("profile.jsp");
		
		
	}

}

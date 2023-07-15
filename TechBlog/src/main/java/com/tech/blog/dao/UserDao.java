package com.tech.blog.dao;

//import java.io.PrintWriter;
import java.sql.*;

import com.tech.blog.entities.user;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		//super();
		this.con = con;
	}
	
	//method to insert user to db.
	
	public boolean saveUser(user user) {
		boolean f=false;
		try {
			
			//user-->database
			String query = "insert into user (Name,Email,Password,Gender,About) values (?,?,?,?,?)";
			PreparedStatement pst =  this.con.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());
			
			
			pst.executeUpdate();
			f=true;
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//get user email and user passord
	
	public user getUserByEmailAndPassword(String email,String password) {
		user user = null;
		try {
			String query = "select * from user where email=? and password =?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new user();
				String name = rs.getString("Name");
				user.setName(name);
				
				user.setId(rs.getInt("Id"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
				user.setGender(rs.getString("Gender"));
				user.setAbout(rs.getString("About"));
				user.setPassword(rs.getString("Password"));
				user.setDateTime(rs.getTimestamp("Reg_Date"));
				user.setProfile(rs.getString("Profile"));
				
				
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(user user) {
		boolean f = false;
		try {
			//PrintWriter out = response.getWriter();
			String query = "update user set Name=? , Email=? ,Password=? ,Gender=? , About=? , Profile=? where Id=? ";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1 ,user.getName());
			System.out.println("Name fetched");
			pst.setString(2, user.getEmail());
			System.out.println("email fetched");
			pst.setString(3 ,user.getPassword());
			//System.out.println("pass fetched"+ password);
			pst.setString(4, user.getGender());
			System.out.println("gender fetched");
			pst.setString(5 ,user.getAbout());
			System.out.println("about fetched");
			pst.setString(6 ,user.getProfile());
			System.out.println("prof fetched");
			pst.setInt(7 ,user.getId());
			System.out.println("id fetched");
			
			//con.commit();
			pst.executeUpdate();
			
			System.out.println("execute update...");
			f=true;
			System.out.println("falg is true");
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public user getUserByUserId(int userId) {
		
		user user = null;
		try {

			String q = "Select * from user where Id = ?";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new user();
				String name = rs.getString("Name");
				user.setName(name);
				
				user.setId(rs.getInt("Id"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
				user.setGender(rs.getString("Gender"));
				user.setAbout(rs.getString("About"));
				user.setPassword(rs.getString("Password"));
				user.setDateTime(rs.getTimestamp("Reg_Date"));
				user.setProfile(rs.getString("Profile"));
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return user;
	}
	
}

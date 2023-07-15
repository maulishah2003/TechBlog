package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		//super();
		this.con = con;
	}
	
	public ArrayList<Category> getCategories(){
		ArrayList<Category> list = new ArrayList<>();
		try {
			String q = "select * from categories";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(q);
			
			while(rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				
				Category c = new Category(cid , name , description);
				list.add(c);
			}
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	public boolean savePost(Post p) {
		boolean f = false;
		try {
			
			String q = "Insert into posts(ptitle , pcontent,pcode,ppic,catid,userId) values (?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, p.getPtitle());
			pst.setString(2, p.getPcontent());
			pst.setString(3, p.getPcode());
			pst.setString(4, p.getPpic());
			pst.setInt(5, p.getCatid());
			pst.setInt(6, p.getUserid());
			
			pst.executeUpdate();
			f=true;
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public List<Post> getAllPost(){
		
		List<Post> list = new ArrayList<>();
		
		try {
			PreparedStatement pst = con.prepareStatement("Select * from posts");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int catid = rs.getInt("catid");
				int userid = rs.getInt("userId");
				Post post = new Post(pid , ptitle , pcontent , pcode , ppic , date , catid , userid);
				
				list.add(post);
				
			}
		}
		
		catch(Exception e) {
			
		}
		return list;
	}
	
	public List<Post> getPostByCatId(int catid){
		
		List<Post> list = new ArrayList<>();
		try {
			PreparedStatement pst = con.prepareStatement("Select * from posts where catid=?");
			pst.setInt(1,catid);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				//int catid = rs.getInt("catid");
				int userid = rs.getInt("userId");
				Post post = new Post(pid , ptitle , pcontent , pcode , ppic , date , catid , userid);
				
				list.add(post);
				
			}
		}
		
		catch(Exception e) {
			
		}
		return list;
	}
	
	public Post getPostByPostId(int postId) {
		Post post = null;
		String q = "Select * from posts where pid=?";
		try {
			PreparedStatement pst = this.con.prepareStatement(q);
			
			pst.setInt(1, postId);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int catid = rs.getInt("catid");
				int userid = rs.getInt("userId");
				
				post = new Post(pid , ptitle , pcontent , pcode , ppic , date , catid , userid);
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
	
}

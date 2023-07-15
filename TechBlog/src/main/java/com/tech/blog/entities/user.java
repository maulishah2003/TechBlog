package com.tech.blog.entities;

import java.sql.*;

public class user {
	private int Id;
	private String Name;
	private String Email;
	private String Password;
	private String Gender;
	private Timestamp dateTime;
	private String About;
	private String Profile;
	
	public user(int id, String name, String email, String password, String gender, Timestamp dateTime, String about) {
		//super();
		this.Id = id;
		this.Name = name;
		this.Email = email;
		this.Password = password;
		this.Gender = gender;
		this.dateTime = dateTime;
		this.About = about;
		
	}

	public user() {
		//super();
	}

	public user(String name, String email, String password, String gender, String about) {
		//super();
		this.Name = name;
		this.Email = email;
		this.Password = password;
		this.Gender = gender;
		//this.dateTime = dateTime;
		this.About = about;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		this.Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		this.Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		this.Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		this.Password = password;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		this.Gender = gender;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public String getAbout() {
		return About;
	}

	public void setAbout(String about) {
		this.About = about;
	}

	public String getProfile() {
		return Profile;
	}

	public void setProfile(String profile) {
		this.Profile = profile;
	}
	
	
	
	
	
	
	
	
	
}

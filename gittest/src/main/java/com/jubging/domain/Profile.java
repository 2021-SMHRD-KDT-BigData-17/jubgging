package com.jubging.domain;

public class Profile {
	
	private String user_id;
	private String user_situation;
	
	public Profile(String user_id, String user_situation) {
		super();
		this.user_id = user_id;
		this.user_situation = user_situation;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_situation() {
		return user_situation;
	}

	public void setUser_situation(String user_situation) {
		this.user_situation = user_situation;
	}

	@Override
	public String toString() {
		return "Profile [user_id=" + user_id + ", user_situation=" + user_situation + "]";
	}
	
	
	
	
}

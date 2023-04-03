package com.jubging.domain;

public class Profile {
	
	private String user_id;
	private String user_situation;
	private String user_nick;
	private String user_img;
	
	public Profile(String user_id, String user_situation ,String user_nick, String user_img) {
		super();
		this.user_id = user_id;
		this.user_situation = user_situation;
		this.user_nick = user_nick;
		this.user_img = user_img;
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
		return "Profile [user_id=" + user_id + ", user_situation=" + user_situation + ", user_nick=" + user_nick
				+ ", user_img=" + user_img + "]";
	}

	
	
	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	
	
	
	
}

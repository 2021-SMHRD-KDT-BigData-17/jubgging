package com.jubging.domain;

public class join {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nick;
	private String user_email;
	private String user_point;
	private String user_img;
	private String user_joindate;
	private String user_type;
	private String user_situation;
	
	public join() {
		super();
	}

	// 회원가입 생성자
	public join(String user_id, String user_pw, String user_email) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
	}
	
	
	
	public join(String user_id, String user_pw, String user_name, String user_nick, String user_email,
			String user_point, String user_img, String user_joindate, String user_type, String user_situation) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nick = user_nick;
		this.user_email = user_email;
		this.user_point = user_point;
		this.user_img = user_img;
		this.user_joindate = user_joindate;
		this.user_type = user_type;
		this.user_situation = user_situation;
	}

	// 로그인 생성자
	public join(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	
	// gettet and setter
	public String getUser_id() {
		return user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_point() {
		return user_point;
	}

	public void setUser_point(String user_point) {
		this.user_point = user_point;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(String user_joindate) {
		this.user_joindate = user_joindate;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getUser_situation() {
		return user_situation;
	}

	public void setUser_situation(String user_situation) {
		this.user_situation = user_situation;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "join [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_nick="
				+ user_nick + ", user_email=" + user_email + ", user_point=" + user_point + ", user_img=" + user_img
				+ ", user_joindate=" + user_joindate + ", user_type=" + user_type + ", user_situation=" + user_situation
				+ "]";
	}

	// 회원가입 toString
	
	
	
}

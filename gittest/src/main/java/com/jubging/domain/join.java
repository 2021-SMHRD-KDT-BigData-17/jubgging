package com.jubging.domain;

public class join {
	
	private String user_id;
	private String user_pw;
	private String user_email;
	
	// 회원가입 생성자
	public join(String user_id, String user_pw, String user_email) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
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

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	
	// 회원가입 toString
	@Override
	public String toString() {
		return "join [user_id=" + user_id + ", user_pw=" + user_pw + ", user_email=" + user_email + "]";
	}
	
	
	
}

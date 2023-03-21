package com.jubging.domain;

public class join {
	
	private String USER_ID;
	private String USER_PW;
	private String USER_EMAIL;
	
	// 생성자
	public join(String uSER_ID, String uSER_PW, String uSER_EMAIL) {
		super();
		USER_ID = uSER_ID;
		USER_PW = uSER_PW;
		USER_EMAIL = uSER_EMAIL;
	}
	
	// gettet and setter
	public String getUSER_ID() {
		return USER_ID;
	}


	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}

	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}

	public String getUSER_PW() {
		return USER_PW;
	}

	public void setUSER_PW(String uSER_PW) {
		USER_PW = uSER_PW;
	}

	@Override
	public String toString() {
		return "join [USER_ID=" + USER_ID + ", USER_PW=" + USER_PW + ", USER_EMAIL=" + USER_EMAIL + "]";
	}
	
	
}

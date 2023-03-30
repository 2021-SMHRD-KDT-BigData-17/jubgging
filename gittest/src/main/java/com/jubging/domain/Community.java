package com.jubging.domain;

public class Community {

	private int c_idx;
	private String c_content;
	private String c_img;
	private int c_likes;
	private String c_hashtag;
	private int lat;
	private int lng;
	private String c_date;
	private String user_id;
	private String user_nick;
	


	public Community(int c_idx, String c_content, String c_img, int c_likes, String c_hashtag, int lat, int lng,
			String c_date, String user_id, String user_nick) {
		super();
		this.c_idx = c_idx;
		this.c_content = c_content;
		this.c_img = c_img;
		this.c_likes = c_likes;
		this.c_hashtag = c_hashtag;
		this.lat = lat;
		this.lng = lng;
		this.c_date = c_date;
		this.user_id = user_id;
		this.user_nick = user_nick;
	}

	public Community(String c_content, String c_hashtag, String user_id, String c_img, String c_date) {
		super();
		this.c_content = c_content;
		this.c_hashtag = c_hashtag;
		this.user_id = user_id;
		this.c_img = c_img;
		this.c_date = c_date;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getC_img() {
		return c_img;
	}

	public void setC_img(String c_img) {
		this.c_img = c_img;
	}

	public int getC_likes() {
		return c_likes;
	}

	public void setC_likes(int c_likes) {
		this.c_likes = c_likes;
	}

	public String getC_hashtag() {
		return c_hashtag;
	}

	public void setC_hashtag(String c_hashtag) {
		this.c_hashtag = c_hashtag;
	}

	public int getLat() {
		return lat;
	}

	public void setLat(int lat) {
		this.lat = lat;
	}

	public int getLng() {
		return lng;
	}

	public void setLng(int lng) {
		this.lng = lng;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	@Override
	public String toString() {
		return "Community [c_content=" + c_content + ", c_hashtag=" + c_hashtag + ", user_id=" + user_id + "]";
	}
	
	
	
	
	
}

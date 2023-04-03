package com.jubging.domain;

public class jgbuk {
	
	
	private int jb_idx;
	private String jb_name;
	private String jb_ringk;
	
	
	public jgbuk(int jb_idx, String jb_name, String jb_ringk) {
		super();
		this.jb_idx = jb_idx;
		this.jb_name = jb_name;
		this.jb_ringk = jb_ringk;
		
		
	}


	public jgbuk() {
		super();
	}


	public int getJb_idx() {
		return jb_idx;
	}


	public void setJb_idx(int jb_idx) {
		this.jb_idx = jb_idx;
	}


	public String getJb_name() {
		return jb_name;
	}


	public void setJb_name(String jb_name) {
		this.jb_name = jb_name;
	}


	public String getJb_ringk() {
		return jb_ringk;
	}


	public void setJb_ringk(String jb_ringk) {
		this.jb_ringk = jb_ringk;
	}


	@Override
	public String toString() {
		return "jgbuk [jb_idx=" + jb_idx + ", jb_name=" + jb_name + ", jb_ringk=" + jb_ringk + "]";
	}
	
	
}

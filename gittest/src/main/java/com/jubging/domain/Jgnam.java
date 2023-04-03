package com.jubging.domain;

public class Jgnam {

	
	private int jn_idx;
	private String jn_name;
	private String jn_ringk;
	
	
	
	
	public Jgnam() {
		super();
	}

	public Jgnam(int jn_idx, String jn_name, String jn_ringk) {
		super();
		this.jn_idx = jn_idx;
		this.jn_name = jn_name;
		this.jn_ringk = jn_ringk;
	}

	public int getJn_idx() {
		return jn_idx;
	}

	public void setJn_idx(int jn_idx) {
		this.jn_idx = jn_idx;
	}

	public String getJn_name() {
		return jn_name;
	}

	public void setJn_name(String jn_name) {
		this.jn_name = jn_name;
	}

	public String getJn_ringk() {
		return jn_ringk;
	}

	public void setJn_ringk(String jn_ringk) {
		this.jn_ringk = jn_ringk;
	}

	@Override
	public String toString() {
		return "Jg [jn_idx=" + jn_idx + ", jn_name=" + jn_name + ", jn_ringk=" + jn_ringk + "]";
	}
	
	
	
}

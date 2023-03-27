package com.jubging.domain;

public class Product {

	private int prodcut_idx;
	private int product_cnt;
	private String product_name;
	private int product_price;
	private String product_img;

	// 상품 생성자
	public Product(int prodcut_idx, int product_cnt, String product_name, int product_price, String product_img) {
		super();
		this.prodcut_idx = prodcut_idx;
		this.product_cnt = product_cnt;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_img = product_img;
	}

	// gettet and setter
	public int getProdcut_idx() {
		return prodcut_idx;
	}

	public void setProdcut_idx(int prodcut_idx) {
		this.prodcut_idx = prodcut_idx;
	}

	public int getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	// 상품 toString
	@Override
	public String toString() {
		return "Product [prodcut_idx=" + prodcut_idx + ", product_cnt=" + product_cnt + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", product_img=" + product_img + "]";
	}
	

}

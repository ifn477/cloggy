package com.ezen.dog.product;

public class ProductDTO {
	int product_id, category1_id, category2_id, category3_id,  p_price;
	int p_stock,  p_sell,  p_hits;
	
	String p_name, p_info, p_image, p_thumbnail, p_enroll;

	public ProductDTO() {
		super();
	}

	public ProductDTO(int product_id, int category1_id, int category2_id, int category3_id, int p_price, int p_stock,
			int p_sell, int p_hits, String p_name, String p_info, String p_image, String p_thumbnail, String p_enroll) {
		super();
		this.product_id = product_id;
		this.category1_id = category1_id;
		this.category2_id = category2_id;
		this.category3_id = category3_id;
		this.p_price = p_price;
		this.p_stock = p_stock;
		this.p_sell = p_sell;
		this.p_hits = p_hits;
		this.p_name = p_name;
		this.p_info = p_info;
		this.p_image = p_image;
		this.p_thumbnail = p_thumbnail;
		this.p_enroll = p_enroll;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCategory1_id() {
		return category1_id;
	}

	public void setCategory1_id(int category1_id) {
		this.category1_id = category1_id;
	}

	public int getCategory2_id() {
		return category2_id;
	}

	public void setCategory2_id(int category2_id) {
		this.category2_id = category2_id;
	}

	public int getCategory3_id() {
		return category3_id;
	}

	public void setCategory3_id(int category3_id) {
		this.category3_id = category3_id;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public int getP_sell() {
		return p_sell;
	}

	public void setP_sell(int p_sell) {
		this.p_sell = p_sell;
	}

	public int getP_hits() {
		return p_hits;
	}

	public void setP_hits(int p_hits) {
		this.p_hits = p_hits;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_thumbnail() {
		return p_thumbnail;
	}

	public void setP_thumbnail(String p_thumbnail) {
		this.p_thumbnail = p_thumbnail;
	}

	public String getP_enroll() {
		return p_enroll;
	}

	public void setP_enroll(String p_enroll) {
		this.p_enroll = p_enroll;
	}
	
	
	
}

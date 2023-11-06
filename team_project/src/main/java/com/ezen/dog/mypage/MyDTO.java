package com.ezen.dog.mypage;

public class MyDTO {
	
	
	int product_id, category_id;
	String p_name;
	int p_price;
	String p_info, p_image, p_thumbnail;
	int p_stock;
	String p_enroll;
	int p_sell, p_hits;
	String userId;
	String d_status;
	int order_id;
	int coupon_count;
	
	public MyDTO() {}
	
	public MyDTO(int product_id, int category_id, String p_name, int p_price, String p_info, String p_image,
			String p_thumbnail, int p_stock, String p_enroll, int p_sell, int p_hits, String userId) {
		super();
		this.product_id = product_id;
		this.category_id = category_id;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_info = p_info;
		this.p_image = p_image;
		this.p_thumbnail = p_thumbnail;
		this.p_stock = p_stock;
		this.p_enroll = p_enroll;
		this.p_sell = p_sell;
		this.p_hits = p_hits;
		this.userId = userId;
	}
	
	
	public int getCoupon_count() {
		return coupon_count;
	}

	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getD_status() {
		return d_status;
	}

	public void setD_status(String d_status) {
		this.d_status = d_status;
	}

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
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
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_enroll() {
		return p_enroll;
	}
	public void setP_enroll(String p_enroll) {
		this.p_enroll = p_enroll;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

}

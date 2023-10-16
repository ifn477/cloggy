package com.ezen.dog.product;

public class ProductOptDTO {
	//product 何盒
	int product_id, category_id;
	String p_name;
	int p_price;
	String p_info, p_image, p_thumbnail;
	int p_stock;
	String p_enroll;
	int p_sell, p_hits;
	//可记何盒
	
	//可记 ID
	int opt_id;
	//可记疙
	String opt_name;
	//可记 啊拜
	int opt_price;
	//可记喊 犁绊
	int opt_stock;
	public ProductOptDTO(int product_id, int category_id, String p_name, int p_price, String p_info, String p_image,
			String p_thumbnail, int p_stock, String p_enroll, int p_sell, int p_hits, int opt_id, String opt_name,
			int opt_price, int opt_stock) {
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
		this.opt_id = opt_id;
		this.opt_name = opt_name;
		this.opt_price = opt_price;
		this.opt_stock = opt_stock;
	}
	public ProductOptDTO() {
		super();
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
	public int getOpt_id() {
		return opt_id;
	}
	public void setOpt_id(int opt_id) {
		this.opt_id = opt_id;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	public int getOpt_price() {
		return opt_price;
	}
	public void setOpt_price(int opt_price) {
		this.opt_price = opt_price;
	}
	public int getOpt_stock() {
		return opt_stock;
	}
	public void setOpt_stock(int opt_stock) {
		this.opt_stock = opt_stock;
	}
	
	
	
	
	
}

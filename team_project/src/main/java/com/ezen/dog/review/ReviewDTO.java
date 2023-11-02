package com.ezen.dog.review;

public class ReviewDTO {
	int r_number, product_id, rate;
	String userId, r_content, r_date, r_photo;
	
	
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public ReviewDTO(int r_number, int product_id, int rate, String userId, String r_content, String r_date,
			String r_photo) {
		super();
		this.r_number = r_number;
		this.product_id = product_id;
		this.rate = rate;
		this.userId = userId;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_photo = r_photo;
	}



	public int getR_number() {
		return r_number;
	}

	public void setR_number(int r_number) {
		this.r_number = r_number;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_photo() {
		return r_photo;
	}

	public void setR_photo(String r_photo) {
		this.r_photo = r_photo;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}



	public int getRate() {
		return rate;
	}



	public void setRate(int rate) {
		this.rate = rate;
	}

	
	
	
	
}
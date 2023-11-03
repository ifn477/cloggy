package com.ezen.dog.coupon;

public class CouponDTO {
	String c_name;
	int c_code, c_stock, c_discount;
	String c_startdate, c_enddate;
	
	public CouponDTO() {	super();	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
	}

	public int getC_stock() {
		return c_stock;
	}

	public void setC_stock(int c_stock) {
		this.c_stock = c_stock;
	}

	public int getC_discount() {
		return c_discount;
	}

	public void setC_discount(int c_discount) {
		this.c_discount = c_discount;
	}

	public String getC_startdate() {
		return c_startdate;
	}

	public void setC_stardate(String c_startdate) {
		this.c_startdate = c_startdate;
	}

	public String getC_enddate() {
		return c_enddate;
	}

	public void setC_enddate(String c_enddate) {
		this.c_enddate = c_enddate;
	}
	
	
}

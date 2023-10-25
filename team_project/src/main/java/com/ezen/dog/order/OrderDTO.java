package com.ezen.dog.order;

import java.util.ArrayList;

public class OrderDTO {
	
	
	private String order_id;/* 주문 번호 */
	private String addressee;/* 배송 받는이 */
	private String userId;	/* 주문 회원 아이디 */
	private String address1;/* 우편번호 */
	private String address2;/* 회원 주소 */
	private String address3;/* 회원 상세주소 */
	private String address; /* 회원주소통합 */
	private int shipping; /* 배송비 */
	private int usePoint; /* 사용 포인트 */
	private String orderdate; /* 주문 날짜 */
	private int ordermemo; /* 배송메시지 */
	private int totalprice;
	private String phone;
	private String p_thumbnail;
	private String p_name;
	private int product_id; /*상품번호*/
	private int o_price;  /*상품1개가격*/
	private int o_quantity;/*주문수량*/
	private String d_status;/*주문수량*/
	
	
	

	/* DB테이블 존재 하지 않는 데이터 */
	private int orderSalePrice; /* 판매가(모든 상품 비용) */
	private int orderSavePoint; /* 적립 포인트 */
	private int orderFinalSalePrice;/* 최종 판매 비용 */
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(String order_id, String addressee, String userId, String address1, String address2, String address3,
			String address, int shipping, int usePoint, String orderdate, int ordermemo, int totalprice, String phone,
			String p_thumbnail, String p_name, int product_id, int o_price, int o_quantity, int orderSalePrice,
			int orderSavePoint, int orderFinalSalePrice) {
		super();
		this.order_id = order_id;
		this.addressee = addressee;
		this.userId = userId;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address = address;
		this.shipping = shipping;
		this.usePoint = usePoint;
		this.orderdate = orderdate;
		this.ordermemo = ordermemo;
		this.totalprice = totalprice;
		this.phone = phone;
		this.p_thumbnail = p_thumbnail;
		this.p_name = p_name;
		this.product_id = product_id;
		this.o_price = o_price;
		this.o_quantity = o_quantity;
		this.orderSalePrice = orderSalePrice;
		this.orderSavePoint = orderSavePoint;
		this.orderFinalSalePrice = orderFinalSalePrice;
	}
	
	
	
	public String getD_status() {
		return d_status;
	}
	public void setD_status(String d_status) {
		this.d_status = d_status;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getOrdermemo() {
		return ordermemo;
	}
	public void setOrdermemo(int ordermemo) {
		this.ordermemo = ordermemo;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getP_thumbnail() {
		return p_thumbnail;
	}
	public void setP_thumbnail(String p_thumbnail) {
		this.p_thumbnail = p_thumbnail;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public int getO_quantity() {
		return o_quantity;
	}
	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}
	public int getOrderSalePrice() {
		return orderSalePrice;
	}
	public void setOrderSalePrice(int orderSalePrice) {
		this.orderSalePrice = orderSalePrice;
	}
	public int getOrderSavePoint() {
		return orderSavePoint;
	}
	public void setOrderSavePoint(int orderSavePoint) {
		this.orderSavePoint = orderSavePoint;
	}
	public int getOrderFinalSalePrice() {
		return orderFinalSalePrice;
	}
	public void setOrderFinalSalePrice(int orderFinalSalePrice) {
		this.orderFinalSalePrice = orderFinalSalePrice;
	}
	
	
}

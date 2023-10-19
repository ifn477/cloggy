package com.ezen.dog.order;

import java.util.ArrayList;

public class OderDTO {
	
	
	private int orderId;/* 주문 번호 */
	private String addressee;/* 배송 받는이 */
	private String userId;	/* 주문 회원 아이디 */
	private String address1;/* 우편번호 */
	private String address2;/* 회원 주소 */
	private String address3;/* 회원 상세주소 */
	private String orderstate;	/* 주문 상태 */
	private ArrayList<OrderitemDTO> orders;	/* 주문 상품 */
	private int shipping; /* 배송비 */
	private int usePoint; /* 사용 포인트 */
	private String orderDate; /* 주문 날짜 */
	
	/* DB테이블 존재 하지 않는 데이터 */
	private int orderSalePrice; /* 판매가(모든 상품 비용) */
	private int orderSavePoint; /* 적립 포인트 */
	private int orderFinalSalePrice;/* 최종 판매 비용 */
	public OderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OderDTO(int orderId, String addressee, String userId, String address1, String address2, String address3,
			String orderstate, ArrayList<OrderitemDTO> orders, int shipping, int usePoint, String orderDate,
			int orderSalePrice, int orderSavePoint, int orderFinalSalePrice) {
		super();
		this.orderId = orderId;
		this.addressee = addressee;
		this.userId = userId;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.orderstate = orderstate;
		this.orders = orders;
		this.shipping = shipping;
		this.usePoint = usePoint;
		this.orderDate = orderDate;
		this.orderSalePrice = orderSalePrice;
		this.orderSavePoint = orderSavePoint;
		this.orderFinalSalePrice = orderFinalSalePrice;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public ArrayList<OrderitemDTO> getOrders() {
		return orders;
	}
	public void setOrders(ArrayList<OrderitemDTO> orders) {
		this.orders = orders;
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
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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
	@Override
	public String toString() {
		return "OderDTO [orderId=" + orderId + ", addressee=" + addressee + ", userId=" + userId + ", address1="
				+ address1 + ", address2=" + address2 + ", address3=" + address3 + ", orderstate=" + orderstate
				+ ", orders=" + orders + ", shipping=" + shipping + ", usePoint=" + usePoint + ", orderDate="
				+ orderDate + ", orderSalePrice=" + orderSalePrice + ", orderSavePoint=" + orderSavePoint
				+ ", orderFinalSalePrice=" + orderFinalSalePrice + "]";
	}
	
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderitemDTO order : orders) {
				orderSalePrice += order.getTotalPrice();
				orderSavePoint += order.getTotalSavePoint();
			}
		/* 배송비용 */
			if(orderSalePrice >= 30000) {
				shipping = 0;
			} else {
				shipping = 2500;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderFinalSalePrice = orderSalePrice + shipping - usePoint;
	}

}

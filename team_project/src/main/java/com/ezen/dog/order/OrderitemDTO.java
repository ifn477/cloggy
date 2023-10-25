package com.ezen.dog.order;

public class OrderitemDTO {
	
	private String orderId;/* 주문 번호 */
    private int product_id;/* 상품 번호 */
    private int o_quantity;	/* 주문 수량 */
    private int orderitem_id;/*  기본키 */
    private int o_price;/* 상품 한 개 가격 */
    private double p_discount;/* 상품 할인 율 */
    private int savepoint;/* 상품 한개 구매 시 획득 포인트 */
    private String p_name;
    private String p_thumbnail;
    private String userId;
    private int p_price;
    private int cart_quantity;

	/* DB테이블 존재 하지 않는 데이터 */
    private int saleprice;/* 할인 적용된 가격 */
    private int totalprice;/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalsavepoint;/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
	public OrderitemDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderitemDTO(String orderId, int product_id, int o_quantity, int orderitem_id, int o_price,
			double p_discount, int savepoint, String p_name, String p_thumbnail, String userId, int saleprice,
			int totalprice, int totalsavepoint) {
		super();
		this.orderId = orderId;
		this.product_id = product_id;
		this.o_quantity = o_quantity;
		this.orderitem_id = orderitem_id;
		this.o_price = o_price;
		this.p_discount = p_discount;
		this.savepoint = savepoint;
		this.p_name = p_name;
		this.p_thumbnail = p_thumbnail;
		this.userId = userId;
		this.saleprice = saleprice;
		this.totalprice = totalprice;
		this.totalsavepoint = totalsavepoint;
	}
	
	
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getO_quantity() {
		return o_quantity;
	}
	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}
	public int getOrderitem_id() {
		return orderitem_id;
	}
	public void setOrderitem_id(int orderitem_id) {
		this.orderitem_id = orderitem_id;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public double getP_discount() {
		return p_discount;
	}
	public void setP_discount(double p_discount) {
		this.p_discount = p_discount;
	}
	public int getSavepoint() {
		return savepoint;
	}
	public void setSavepoint(int savepoint) {
		this.savepoint = savepoint;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_thumbnail() {
		return p_thumbnail;
	}
	public void setP_thumbnail(String p_thumbnail) {
		this.p_thumbnail = p_thumbnail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getTotalsavepoint() {
		return totalsavepoint;
	}
	public void setTotalsavepoint(int totalsavepoint) {
		this.totalsavepoint = totalsavepoint;
	}
	

    
}

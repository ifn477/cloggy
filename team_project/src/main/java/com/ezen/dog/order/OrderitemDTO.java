package com.ezen.dog.order;

public class OrderitemDTO {
	
//	private String orderId;/* 二쇰Ц 踰덊샇 */
    private int product_id;/* �긽�뭹 踰덊샇 */
    private int cart_quantity;	/* 二쇰Ц �닔�웾 */
    private int orderitem_id;/*  湲곕낯�궎 */
    private int p_price;/* �긽�뭹 �븳 媛� 媛�寃� */
    private double p_discount;/* �긽�뭹 �븷�씤 �쑉 */
    private int savePoint;/* �긽�뭹 �븳媛� 援щℓ �떆 �쉷�뱷 �룷�씤�듃 */
    private String p_name;
    private String p_thumbnail;
    private String userId;
    
    
    
    
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	/* DB�뀒�씠釉� 議댁옱 �븯吏� �븡�뒗 �뜲�씠�꽣 */
    private int salePrice;/* �븷�씤 �쟻�슜�맂 媛�寃� */
    private int totalPrice;/* 珥� 媛�寃�(�븷�씤 �쟻�슜�맂 媛�寃� * 二쇰Ц �닔�웾) */
    private int totalSavePoint;/* 珥� �쉷�뱷 �룷�씤�듃(�긽�뭹 �븳媛� 援щℓ �떆 �쉷�뱷 �룷�씤�듃 * �닔�웾) */
	public OrderitemDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderitemDTO(int product_id, int cart_quantity, int orderitem_id, int p_price,
			double p_discount, int savePoint, int salePrice, int totalPrice, int totalSavePoint) {
		super();
//		this.orderId = orderId;
		this.product_id = product_id;
		this.cart_quantity = cart_quantity;
		this.orderitem_id = orderitem_id;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.savePoint = savePoint;
		this.salePrice = salePrice;
		this.totalPrice = totalPrice;
		this.totalSavePoint = totalSavePoint;
	}

//	public String getOrderId() {
//		return orderId;
//	}
//
//	public void setOrderId(String orderId) {
//		this.orderId = orderId;
//	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public int getOrderitem_id() {
		return orderitem_id;
	}

	public void setOrderitem_id(int orderitem_id) {
		this.orderitem_id = orderitem_id;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public double getP_discount() {
		return p_discount;
	}

	public void setP_discount(double p_discount) {
		this.p_discount = p_discount;
	}

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalSavePoint() {
		return totalSavePoint;
	}

	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}

	@Override
	public String toString() {
		return "OrderitemDTO [product_id=" + product_id + ", quantity=" + cart_quantity
				+ ", orderitem_id=" + orderitem_id + ", p_price=" + p_price + ", p_discount=" + p_discount
				+ ", savePoint=" + savePoint + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice
				+ ", totalSavePoint=" + totalSavePoint + "]";
	}

	public void initSaleTotal() {
		this.salePrice = (int) (this.p_price * (1-this.p_discount));
		this.totalPrice = this.salePrice*this.cart_quantity;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.cart_quantity;
	}
    
}

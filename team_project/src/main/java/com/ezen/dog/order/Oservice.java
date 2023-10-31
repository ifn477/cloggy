package com.ezen.dog.order;

import java.util.ArrayList;

public interface Oservice {
	
	public OrderitemDTO orderitem(String userId,int product_id,int option_id);
	public void inserto(String address,int totalprice,String userId,int shipping,int ordermemo,String phone,String addressee,int orderid,int selectcoupon);
	public void inserti(int product_id,int p_prices,int cart_quantities,int savepoint,int orderid,int optid);
	public Integer orderid();
	public ArrayList<OrderitemDTO> ordercompleted(int orderid,String userId);
	public ArrayList<OrderDTO> orderlist(String userId);
	public ArrayList<OrderDTO> orderdetail(int order_id);
	public int ordercancle(int order_id);
	
}
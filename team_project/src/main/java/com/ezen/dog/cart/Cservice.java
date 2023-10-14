package com.ezen.dog.cart;

import java.util.ArrayList;


public interface Cservice {
	//장바구니 추가

	public void addcart(String userId, int product_id, int quantity);
	public ArrayList<CartProductDTO> cartout(String userId);
	public void cartdelete(String userId, String productIds);
}

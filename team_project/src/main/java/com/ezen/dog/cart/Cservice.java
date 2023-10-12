package com.ezen.dog.cart;

import java.util.ArrayList;

public interface Cservice {
	//장바구니 추가

	public void addcart(CartDTO cdto);
	public CartDTO cartout(String userId);
	public void addcart(String userId, int product_id, int quantity);
	
}

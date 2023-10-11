package com.ezen.dog.cart;

import java.util.ArrayList;

public interface Cservice {
	//장바구니 추가
	public void addcart(String userId, int product_id, int quantity);
	//장바구니 조회
	public CartDTO cartout(String userId);
	public ArrayList<CartDTO> cartout2(int product_id);
}

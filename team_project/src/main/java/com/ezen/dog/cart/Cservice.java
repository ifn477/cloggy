package com.ezen.dog.cart;

import java.util.ArrayList;

public interface Cservice {
	//장바구니 추가
	public void addcart(CartDTO cdto);
	public ArrayList<CartDTO> cartout(String userId);
}

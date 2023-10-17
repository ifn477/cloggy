package com.ezen.dog.cart;

import java.util.ArrayList;


public interface Cservice {
	//장바구니 추가(로그인)
	public void addcart(String userId, int product_id, int quantity);
	//장바구니 추가(쿠키)
	public void addcartwithcookie(String ckId, int product_id, int quantity);
	//장바구니 출력(로그인)
	public ArrayList<CartProductDTO> cartout(String userId);
	//장바구니 출력(쿠키)
	public ArrayList<CartProductDTO> cartoutwithcookie(String userId);
	//장바구니 삭제(로그인)
	public void cartdelete(String userId, int product_id);
	//장바구니 삭제(쿠키)
	public void cartdeletewithcookie(String ckvalue, int product_id);
	//장바구니 추가 여부 확인(로그인)
	public int checkcart(String userId, int product_id);
	//장바구니 추가 여부 확인(쿠키)
	public int checkcartwithcookie(String ckid, int product_id);
	//이미 있는 상품 수량 증가(로그인)
	public void increasequantity(String userId, int product_id, int quantity);
	//이미 있는 상품 수량 증가(쿠키)
	public void increasequantitywithcookie(String ckid, int product_id, int quantity);
	//장바구니 수량 변경(로그인)
	public void changeqty(String userId, int product_id, int quantity);
	//장바구니 수량 변경(쿠키)
	public void changeqtyforcookie(String ckvalue, int product_id, int quantity);
}

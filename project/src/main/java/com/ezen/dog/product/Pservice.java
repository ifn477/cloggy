package com.ezen.dog.product;

import java.util.ArrayList;

public interface Pservice {
	//제품 전체보기(대분류만)
	public ArrayList<ProductDTO> productouttotal(int a);
	//대분류, 중분류
	public ArrayList<ProductDTO> productout(int a, int b);
	//제품 상세페이지
	public ArrayList<ProductDTO> productdetail(int a);
}

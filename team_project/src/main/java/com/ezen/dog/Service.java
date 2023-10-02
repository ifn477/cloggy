package com.ezen.dog;

import java.util.ArrayList;

import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.ProductDTO;

public interface Service {
	public ArrayList<ProductDTO> searchAll(String p_name);
}

package com.ezen.dog.product;

import java.util.ArrayList;

import com.ezen.dog.cart.CartProductDTO;

public interface PService {
	public void productinput(int category_id,String p_name,int p_price,String p_info,String p_image,String p_thumbnail,int p_stock);
	public ArrayList<ProductDTO> productuserout();
	public ArrayList<ProductDTO> productouttotal(int a);
	public ArrayList<ProductDTO> productout(int a, int b);
	public ArrayList<ProductDTO> productdetail(int product_id);
	public ArrayList<OptionDTO> optdetail(int product_id);
	public void productcount(int product_id);
	public ArrayList<ProductDTO> productmodifyForm(int product_id);
	public void productmodifyView(int category_id,int product_id, String p_name,int p_price,String p_info,String p_image,String p_thumbnail,int p_stock,String p_enroll);
	public void productdelete(int product_id);
	public ArrayList<ProductDTO> searchAll(String p_name);
	public ArrayList<ProductDTO> search1(String p_name);
	public ArrayList<ProductDTO> search2(String p_name);
	public ArrayList<ProductDTO> search3(String p_name);
	public ArrayList<ProductDTO> recentProducts(String[] productIds);
}

package com.ezen.dog.product;

import java.util.ArrayList;

public interface PService {
	public Integer firstproductinput();
	public Integer productidpreview();
	public ArrayList<ProductDTO> productrecommendlist();
	public void productrecommend(int product_id, String recommend_product_id);	
	public void productinput(int product_id,int category1_id,int category2_id,String p_name,int p_price,String p_info,String p_image,String p_thumbnail,int p_stock,double p_point);
	public ArrayList<ProductDTO> productout();
	public ArrayList<ProductDTO> productbestout();
	public ArrayList<OptionDTO> optdetail(int product_id);
	public ArrayList<ProductDTO> productouttotal(int a);
	public ArrayList<ProductDTO> productoutcate(int a, int b);
	public ArrayList<ProductDTO> productuserout();
	public ArrayList<ProductDTO> productdetail(int product_id);
	public ArrayList<ProductDTO> productrecommendout(int product_id);
	public void productcount(int product_id);
	public ArrayList<ProductDTO> productmodifyForm(int product_id);
	public void productmodifyView(int category1_id,int product_id, String p_name,int p_price,String p_info,String p_image,String p_thumbnail,int p_stock,String p_enroll,int category2_id);
	public void productdelete(int product_id);
	public ArrayList<ProductDTO> searchAll(String p_name);
	public ArrayList<ProductDTO> search1(String p_name);
	public ArrayList<ProductDTO> search2(String p_name);
	public ArrayList<ProductDTO> search3(String p_name);
	public ArrayList<ProductDTO> recentProducts(String[] productIds);
}

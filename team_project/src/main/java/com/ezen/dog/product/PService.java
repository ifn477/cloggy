package com.ezen.dog.product;

import java.util.ArrayList;

public interface PService {
	public Integer productidpreview();
	public ArrayList<ProductDTO> productrecommendlist();
	public void productrecommend(int product_id, String recommend_product_id);
	public void productinput(int product_id,int category1_id,int category2_id,String p_name,int p_price,String p_info,String p_image,String p_thumbnail,int p_stock,double p_point);
	public ArrayList<ProductDTO> productouttotal(int a);
	public ArrayList<ProductDTO> productout(int a, int b);
	public ArrayList<ProductDTO> productdetail(int product_id);
	public ArrayList<ProductDTO> productrecommendout(int product_id);
	public void productcount(int product_id);
	public ArrayList<ProductDTO> productmodifyForm(int product_id);
	public void productmodifyView(int category_id,int product_id, String p_name,int p_price,String p_info,String p_image,String p_thumbnail,int p_stock,String p_enroll);
	public void productdelete(int product_id);
}

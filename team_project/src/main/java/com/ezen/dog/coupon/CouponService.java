package com.ezen.dog.coupon;

import java.util.ArrayList;

public interface CouponService {
	public void couponsave(String c_name,int c_stock,int c_discount,String c_startdate,String c_enddate);
	public ArrayList<CouponDTO> couponout();
	public Integer couponyesno(int c_code,String userId);
	public void coupondownload(int c_code,String userId,String c_enddate,int c_stock);
	public void couponuserstock(int c_code,String userId);
	public Integer couponstockok(int c_code,String userId);
	public ArrayList<CouponDTO> couponlist(String userId);
	public Integer coupondiscount(String selectcoupon);
	public void coupondelete(int c_code);
	public ArrayList<CouponDTO> couponmodifyform(int c_code);
	public void couponmodify(int c_code, String c_name,int c_stock,int c_discount,String c_startdate,String c_enddate);
	public void couponout(int c_code,String userId);
	public void deletecoupon();
	public void userdeletecoupon();
}

package com.ezen.dog.coupon;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CouponController {

	@Autowired
	SqlSession sqlSession;
	ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
	
	@RequestMapping(value = "/coupon-input")
	public String couponinput() {
		return "coupon-input";
	}
	
	@RequestMapping(value = "/coupon-save", method = RequestMethod.POST)
	public String couponsave(HttpServletRequest request) {
		String c_name = request.getParameter("c_name");
		int c_stock = Integer.parseInt(request.getParameter("c_stock"));
		int c_discount = Integer.parseInt(request.getParameter("c_discount"));
		String c_startdate = request.getParameter("c_startdate");
		String c_enddate = request.getParameter("c_enddate");
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		couponservice.couponsave(c_name,c_stock,c_discount,c_startdate,c_enddate);
		return "redirect:coupon-input";
	}
	
	@RequestMapping(value = "/coupon-out")
	public String couponout(Model mo) {
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		list = couponservice.couponout();
		mo.addAttribute("list", list);
		return "coupon-out";
	}
	
	@RequestMapping(value = "/coupon-downloadform")
	public String coupondownloadform(Model mo) {
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		list = couponservice.couponout();
		mo.addAttribute("list", list);
		return "coupon-downloadform";
	}
	
	@RequestMapping(value = "/coupon-download")
	public String coupondownload(HttpServletRequest request, Model mo) {
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		String c_enddate = request.getParameter("c_enddate");
		int c_stock = Integer.parseInt(request.getParameter("c_stock"));
		String userId = request.getParameter("userId");
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		//유저가 쿠폰 받은 이력이 있는지 확인
		int coupon_yesno = couponservice.couponyesno(c_code, userId);
		//쿠폰 받은 이력이 없으면 정보 다 입력
		if(coupon_yesno == 0) {
	    couponservice.coupondownload(c_code, userId, c_enddate, c_stock);
	    return "redirect:coupon-downloadform";
		}
		//받은 적이 있으면 유저 보유 쿠폰 +1
		else {
			int coupon_stock_ok = couponservice.couponstockok(c_code, userId);
			if(coupon_stock_ok == 1) {
			couponservice.couponuserstock(c_code, userId);
			return "redirect:coupon-downloadform";
			}
			else {
				return "main";
			}
		}
	}
	
	@RequestMapping(value = "/coupon-list")
	public String couponlist(HttpServletRequest request, Model mo) {
		String userId = request.getParameter("userId");
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		list = couponservice.couponlist(userId);
		mo.addAttribute("list", list);
		return "coupon-list";
	}

	@RequestMapping(value = "/coupon-list-popup")
	public String couponlistpopup(HttpServletRequest request, Model mo) {
		String userId = request.getParameter("userId");
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		list = couponservice.couponlist(userId);
		mo.addAttribute("list", list);
		return "coupon-list-popup";
	}
	
	@RequestMapping(value = "/coupondiscount")
	public String coupondiscount(HttpServletRequest request, Model mo) {
		String selectcoupon = request.getParameter("selectcoupon");
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		int c_discount = couponservice.coupondiscount(selectcoupon);
		System.out.println("##할인율##:"+c_discount);
//		int discount_price = (int)(price -(price * c_discount/100.0));
		mo.addAttribute("coupon", c_discount);
		return "order";
	}
	
	@RequestMapping(value = "/coupon-delete")
	public String coupondelete(HttpServletRequest request) {
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		couponservice.coupondelete(c_code);
		return "redirect:coupon-out";
	}
	
	@RequestMapping(value = "/coupon-modifyform")
	public String couponmodifyform(HttpServletRequest request, Model mo) {
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		list = couponservice.couponmodifyform(c_code);
		mo.addAttribute("list", list);
		return "coupon-modifyform";
	}
	
	
	@RequestMapping(value = "/coupon-modify", method = RequestMethod.POST)
	public String couponmodify(HttpServletRequest request) {
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		String c_name = request.getParameter("c_name");
		int c_stock = Integer.parseInt(request.getParameter("c_stock"));
		int c_discount = Integer.parseInt(request.getParameter("c_discount"));
		String c_startdate = request.getParameter("c_startdate");
		String c_enddate = request.getParameter("c_enddate");
		CouponService couponservice = sqlSession.getMapper(CouponService.class);
		couponservice.couponmodify(c_code,c_name,c_stock,c_discount,c_startdate,c_enddate);
		return "redirect:coupon-out";
	}

}

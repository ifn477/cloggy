package com.ezen.dog.pay;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dog.cart.CartProductDTO;
import com.ezen.dog.cart.Cservice;
import com.ezen.dog.member.MemberDTO;

@Controller
public class Paycontroller {
	
	@Autowired
	SqlSession sqlSession;
	

	@RequestMapping(value = "/order")
	public String order(HttpServletRequest request, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		String productIds = request.getParameter("productIdsToOrder");
		System.out.println("!!!!제품번호!!!!" + productIds);
		String[] ProductIdss = productIds.split(",");
		
		String userId = mdto.getUserId();

		for (int i = 0; i < ProductIdss.length; i++) {
			int product_id = Integer.parseInt(ProductIdss[i]);
			cs.cartdelete(userId, product_id);
		}
				
		return "order";
	}
	
	
	@RequestMapping(value = "/naverpay")
	public String naverpay() {
		
		
		return "naverpay";
	}

}

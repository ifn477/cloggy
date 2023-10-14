package com.ezen.dog.cart;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dog.member.MemberDTO;


@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;

	   @ResponseBody
	   @RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	    public String addToCart(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity, HttpSession session) {
	        // 회원정보 가져오기
	        MemberDTO mdto = (MemberDTO) session.getAttribute("member");
	        String userId = null;

	        // 로그인 상태
	        Cservice cs = sqlSession.getMapper(Cservice.class);
	        if (mdto != null) {
	            userId = mdto.getUserId();
	            cs.addcart(userId, product_id, quantity);
	            return "success";
	        } else {
	        	 return "not_logged_in";
	        }
	    }
	
	   
	@RequestMapping(value = "/cart-out")
	public String productout(HttpSession session,HttpServletRequest request, CartDTO cdto, Model mo) {
		
		//Session에 저장되어있는 사용자 ID 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();

		
		
		//제품DB에 접근해서 product_id로 상품 정보 가져오기
		Cservice cs = sqlSession.getMapper(Cservice.class);
		ArrayList<CartProductDTO> list = cs.cartout(userId);
		mo.addAttribute("list", list);
		
		return "cart-out";
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/deletefromcart", method = RequestMethod.POST)
	public String deletefromcart(@RequestParam("productIds") String[] productIds, HttpSession session) {
	    
	    if (productIds == null || productIds.length == 0) {
	        // Handle the case where productIds is missing or empty
	        return "error";
	    }

	    // 나머지 코드는 그대로 유지
	    MemberDTO mdto = (MemberDTO) session.getAttribute("member");
	    String userId = mdto.getUserId();

	    for (int i = 0; i < productIds.length; i++) {
	        Cservice cs = sqlSession.getMapper(Cservice.class);
	        cs.cartdelete(userId, productIds[i]);
	    }

	    return "success";
	}

}

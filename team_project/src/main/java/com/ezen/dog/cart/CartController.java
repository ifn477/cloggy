package com.ezen.dog.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	       if (mdto != null) { // 로그인 상태
	           userId = mdto.getUserId();

	           // 카트에 이미 저장된 상품인지 체크하는 메서드!
	           int hasitem = cs.checkcart(userId, product_id);
	           System.out.println("장바구니 수량 :" + hasitem);
	           
	           if (hasitem > 0) { // 장바구니에 있는 상품일 경우 수량 증가 method 호출
	               cs.increasequantity(userId, product_id, quantity);
	               return "success"; // 상품 수량 증가 성공
	           } else { // 없는 상품일 경우 신규 추가
	               cs.addcart(userId, product_id, quantity);
	               return "success"; // 상품 추가 성공
	           }

	       } else { // 비로그인 상태
	           return "no"; // 로그인되지 않은 상태
	       }
	   }

	
	   
	@RequestMapping(value = "/cart-out")
	public String productout(HttpSession session,HttpServletRequest request, CartDTO cdto, Model mo) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		if(mdto!= null) {
			//Session에 저장되어있는 사용자 ID 가져오기
			String userId = mdto.getUserId();
	
			
			//제품DB에 접근해서 product_id로 상품 정보 가져오기
			Cservice cs = sqlSession.getMapper(Cservice.class);
			ArrayList<CartProductDTO> list = cs.cartout(userId);
			mo.addAttribute("list", list);
			
			return "cart-out";	
		}
		return "cart-out";	
	}

	
	@RequestMapping(value = "/deletefromcart")
	public String deletefromcart(HttpServletRequest request	, HttpSession session) {
	    // 나머지 코드는 그대로 유지
	    MemberDTO mdto = (MemberDTO) session.getAttribute("member");
	    String userId = mdto.getUserId();
	    
	    String productIds = request.getParameter("productIds");
	    System.out.println("!!!!제품번호!!!!"+ productIds);//확인용
		String[] ProductIdss = productIds.split(",");
		
		Cservice cs = sqlSession.getMapper(Cservice.class);
		
	    for (int i = 0; i < ProductIdss.length; i++) {
	    	int product_id = Integer.parseInt(ProductIdss[i]);
	    	cs.cartdelete(userId, product_id);
	    }

	    return "redirect:/cart-out";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/changeqty", method = RequestMethod.POST)
	public String changeqty(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity, HttpSession session) {
	       // 회원정보 가져오기
	       MemberDTO mdto = (MemberDTO) session.getAttribute("member");
	       String userId = mdto.getUserId();
	     
	       Cservice cs = sqlSession.getMapper(Cservice.class);
	       cs.changeqty(userId, product_id, quantity);
	     return "success"; // 상품 수량 증가 성공
	}
}

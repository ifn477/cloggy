package com.ezen.dog.cart;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.ezen.dog.member.MemberDTO;


@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;

<<<<<<< HEAD
	@ResponseBody
	@RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	public int cartin(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity,
	        HttpSession session, HttpServletRequest request, HttpServletResponse response, CartDTO cdto) {

		// 회원정보 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");

		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		cdto.setProduct_id(product_id);
		cdto.setCart_quantity(quantity);
		
		// 비회원 & 장바구니 첫 클릭 시 쿠키생성
		if (cookie == null && mdto == null) {
			String ckid = RandomStringUtils.random(6, true, true);
			Cookie cartCookie = new Cookie("cartCookie", ckid);
			cartCookie.setPath("/");
			cartCookie.setMaxAge(60 * 60 * 24 * 1);
			response.addCookie(cartCookie);
			cdto.setCart_ckid(ckid);
			cs.cartin_nocookie(cdto);

			// 비회원 장바구니 쿠키생성 후 상품추가
		} else if (cookie != null && mdto == null) {
			String ckValue = cookie.getValue();
			cdto.setCart_ckid(ckValue);
			cs.cartin_yescookie(cdto);
			// 장바구니 중복제한
			if (cs.cartCheck(cdto) != 0) {
				return 2;
			}

			// 쿠키 시간 재설정해주기
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 1);
			response.addCookie(cookie);
			
			// 로그인 상태 : 회우너 장바구니 상품 추가
		} else if (mdto != null) {
			cdto.setUserId(mdto.getUserId());
			if (cs.cartCheck(cdto) != 0) {
				return 2;
			}
			cs.cartin_login(cdto);
		}
		return 1;
	}

=======
	
//	//카트 추가 : 비동기(view로 전환 없이 같은 창에서)
//	@ResponseBody
//	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
//	public void addcart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartDTO cdto){
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		
//		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
//		cdto.setUserId(mdto.getUserId());
//		cdto.setCart_quantity(quantity);
//		
//		Cservice cv = sqlSession.getMapper(Cservice.class);
//		cv.addcart(cdto);
//		
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
//	public void addcart(HttpSession session, @RequestBody Map<String, Object> requestData) {
//	    int quantity = Integer.parseInt(requestData.get("quantity").toString());
//	    int productId = Integer.parseInt(requestData.get("product_id").toString());
//
//	    MemberDTO mdto = (MemberDTO) session.getAttribute("member");
//	    CartDTO cdto = new CartDTO();
//	    cdto.setUserId(mdto.getUserId());
//	    cdto.setProduct_id(productId);
//	    cdto.setCart_quantity(quantity);
//
//	    Cservice cv = sqlSession.getMapper(Cservice.class);
//	    cv.addcart(cdto);
//	}

	
	@ResponseBody
	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	public String addcart(HttpSession session, @RequestParam("product_id") int productId, @RequestParam("quantity") int quantity) {
	    try {
	        MemberDTO mdto = (MemberDTO) session.getAttribute("member");

	        if (mdto == null) {
	            // Handle the case where the user is not logged in
	            return "User not logged in";
	        }

	        CartDTO cdto = new CartDTO();
	        cdto.setUserId(mdto.getUserId());
	        cdto.setProduct_id(productId);
	        cdto.setCart_quantity(quantity);

	        Cservice cv = sqlSession.getMapper(Cservice.class);

	        // Log values for debugging
	        System.out.println("Debug: mdto.getUserId() = " + mdto.getUserId());
	        System.out.println("Debug: productId = " + productId);
	        System.out.println("Debug: quantity = " + quantity);

	        // Attempt to add the item to the cart
	        cv.addcart(cdto);

	        // Optionally, you can return a success message
	        return "Item added to cart successfully";
	    } catch (Exception e) {
	        // Log the exception and stack trace
	        e.printStackTrace();
	        return "Error adding item to cart: " + e.getMessage();
	    }
	}


	
	//장바구니 출력1 : userId로 cart id 조회(조인 사용 못하니 임시방편) -> cartid에 있는 제품id로 제품 상세내역 조회(구현 전ㅜ)
>>>>>>> parent of 934500c (cart completed)
	@RequestMapping(value = "/cart-out")
	public String productout(HttpSession session,HttpServletRequest request, Model mo) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		
		mo.addAttribute("mdto", mdto);
		
		String userId = mdto.getUserId();
		
		Cservice cs = sqlSession.getMapper(Cservice.class);
		ArrayList<CartDTO> list = cs.cartout(userId);
		mo.addAttribute("list", list);
		
		return "cart-out";
	}
}

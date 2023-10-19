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

import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.OptionDTO;

@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;

	@ResponseBody
	@RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity,
			@RequestParam("optId") int optId, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		// 회원정보 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = null;
		Cservice cs = sqlSession.getMapper(Cservice.class);

		// 로그인 상태
		if (mdto != null) { 
			userId = mdto.getUserId();

			// 카트에 이미 저장된 상품인지 체크하는 메서드!
			int hasitem = cs.checkcart(userId, product_id, optId);
			System.out.println("장바구니 수량 :" + hasitem);

			if (hasitem > 0) { // 장바구니에 있는 상품일 경우 수량 증가 method 호출
				cs.increasequantity(userId, product_id, quantity, optId);
				return "success"; // 상품 수량 증가 성공
			} else { // 없는 상품일 경우 신규 추가
				cs.addcart(userId, product_id, quantity, optId);
				return "success"; // 상품 추가 성공
			}

		} else { // 비로그인 상태 
			//쿠키 유무 조회
			Cookie[] cookies = request.getCookies();
			String ckid = null;
			boolean foundCkid = false;

			//쿠키 검사~!
			for (Cookie cookie : cookies) {
				  if(cookie.getName().equals("ckid")){
				   ckid = cookie.getValue();
				   foundCkid = true;
				   break; // 이미 쿠키를 찾았으므로 루프 종료	
				  }
			}
			
			//ckid가 이미 있는 경우~
			if(foundCkid){
				// 카트에 이미 저장된 상품인지 체크하는 메서드!
				int hasitem = cs.checkcartwithcookie(ckid, product_id, optId);
				System.out.println("장바구니 수량 :" + hasitem);
					
				if (hasitem > 0) { // 장바구니에 있는 상품일 경우 수량 증가 method 호출
					cs.increasequantitywithcookie(ckid, product_id, quantity, optId);
					return "success"; // 상품 수량 증가 성공
				} else { // 없는 상품일 경우 신규 추가
					cs.addcartwithcookie(ckid, product_id, quantity, optId);
					return "success"; // 상품 추가 성공
				}
			   }//ckid 없을 때(비로그인 상태 최초 저장) : 쿠키 신규 생성
				
			else {  
			    // 쿠키가 없는 경우, 새로운 쿠키 아이디 생성
			    ckid = generateRandomString(); // 쿠키 아이디 생성 메서드를 구현해야 합니다.
			    // 랜덤 문자열로 ckid 생성
			    Cookie cookie = new Cookie("ckid", ckid);
			    cookie.setMaxAge(365 * 24 * 60 * 60); // 쿠키 유효기간 설정 (예: 1년)
			    cookie.setPath("/"); // 쿠키의 경로 설정
			    // 서버 -> 클라이언트(브라우저)로 쿠키 전송, 저장
			    response.addCookie(cookie);
			    // ckid 값을 사용하여 DB에 저장
			    cs.addcartwithcookie(ckid, product_id, quantity, optId);
			    System.out.println("쿠키 값:" + ckid);			    

			    return "success";
			}
		}
	}

	private String generateRandomString() {
		// 원하는 방식으로 쿠키 아이디 생성 (예: 랜덤 문자열, 시간 정보 등을 활용)
		String ckid = RandomStringUtils.random(6, true, true);

		return ckid;
	}

	@RequestMapping(value = "/cart-out")
	public String productout(HttpSession session, HttpServletRequest request, Model mo) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		if (mdto != null) {
			// Session에 저장되어있는 사용자 ID 가져오기
			String userId = mdto.getUserId();

			// 제품DB에 접근해서 product_id로 상품 정보 가져오기
			ArrayList<CartProductDTO> list = cs.cartout(userId);

			mo.addAttribute("list", list);
			

			return "cart-out";
		} else {// 로그인 값이 없는 경우 (쿠키로 저장한 경우)
			Cookie[] cookies = request.getCookies();
			String ckvalue = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("ckid")) {
					ckvalue = cookie.getValue();
					System.out.println("쿠키 값:" + ckvalue);
					ArrayList<CartProductDTO> list = cs.cartoutwithcookie(ckvalue);
					mo.addAttribute("list", list);
					break;
				}
			}
		}
		return "cart-out";
	}

	@RequestMapping(value = "/deletefromcart")
	public String deletefromcart(HttpServletRequest request, HttpSession session) {
		// 나머지 코드는 그대로 유지
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		String productIds = request.getParameter("productIds");
		String optIds = request.getParameter("optIds");
		System.out.println("!!!!제품번호!!!!" + productIds);// 확인용
		String[] ProductIdss = productIds.split(",");
		String[] optIdss = optIds.split(",");

		if (mdto != null) { // 로그인 상태일 경우
			String userId = mdto.getUserId();

			for (int i = 0; i < ProductIdss.length; i++) {
				int product_id = Integer.parseInt(ProductIdss[i]);
				int opt_id = Integer.parseInt(optIdss[i]);
				cs.cartdelete(userId, product_id, opt_id);
			}
			return "redirect:/cart-out";
		} else {
			Cookie[] cookies = request.getCookies();
			String ckvalue = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("ckid")) {
					ckvalue = cookie.getValue();
					break; // 이미 쿠키를 찾았으므로 루프 종료
				}
			}
			for (int i = 0; i < ProductIdss.length; i++) {
				int product_id = Integer.parseInt(ProductIdss[i]);
				int opt_id = Integer.parseInt(optIdss[i]);
				cs.cartdeletewithcookie(ckvalue, product_id, opt_id);
			}
			return "redirect:/cart-out";
		}

	}

	@RequestMapping(value = "/delete-all")
	public String deleteall(HttpServletRequest request, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		
		if (mdto != null) { 
			String userId =	mdto.getUserId();
			cs.deleteall(userId);
		
		}else {
		Cookie[] cookies = request.getCookies();
		String ckvalue = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("ckid")) {
					ckvalue = cookie.getValue();
					break; // 이미 쿠키를 찾았으므로 루프 종료
				}
			}
		cs.deleteall(ckvalue);
		}
		
		return "redirect:/cart-out";
	}
		
	@ResponseBody
	@RequestMapping(value = "/changeqty", method = RequestMethod.POST)
	public String changeqty(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity,
			HttpSession session, HttpServletRequest request) {
		// 회원정보 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");

		Cservice cs = sqlSession.getMapper(Cservice.class);

		if (mdto != null) { // 로그인 상태일 경우
			String userId = mdto.getUserId();
			cs.changeqty(userId, product_id, quantity);
			return "success"; // 상품 수량 증가 성공

		} else { // 비로그인 상태일 경우 : 쿠키로 저장된 상태
			Cookie[] cookies = request.getCookies();
			String ckvalue = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("ckid")) {
					ckvalue = cookie.getValue();
					break; // 이미 쿠키를 찾았으므로 루프 종료
				}
			}
			cs.changeqtyforcookie(ckvalue, product_id, quantity);
			return "success";
		}
	}
}

package com.ezen.dog.cart;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.commons.lang3.RandomStringUtils;
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
		
		// ?šŒ?›? •ë³? ê°?? ¸?˜¤ê¸?
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = null;
		Cservice cs = sqlSession.getMapper(Cservice.class);

		// ë¡œê·¸?¸ ?ƒ?ƒœ
		if (mdto != null) { 
			userId = mdto.getUserId();

			// ì¹´íŠ¸?— ?´ë¯? ???¥?œ ?ƒ?’ˆ?¸ì§? ì²´í¬?•˜?Š” ë©”ì„œ?“œ!
			int hasitem = cs.checkcart(userId, product_id, optId);
			System.out.println("?¥ë°”êµ¬?‹ˆ ?ˆ˜?Ÿ‰ :" + hasitem);

			if (hasitem > 0) { // ?¥ë°”êµ¬?‹ˆ?— ?ˆ?Š” ?ƒ?’ˆ?¼ ê²½ìš° ?ˆ˜?Ÿ‰ ì¦ê? method ?˜¸ì¶?
				cs.increasequantity(userId, product_id, quantity, optId);
				return "success"; // ?ƒ?’ˆ ?ˆ˜?Ÿ‰ ì¦ê? ?„±ê³?
			} else { // ?—†?Š” ?ƒ?’ˆ?¼ ê²½ìš° ?‹ ê·? ì¶”ê?
				cs.addcart(userId, product_id, quantity, optId);
				return "success"; // ?ƒ?’ˆ ì¶”ê? ?„±ê³?
			}

		} else { // ë¹„ë¡œê·¸ì¸ ?ƒ?ƒœ 
			//ì¿ í‚¤ ?œ ë¬? ì¡°íšŒ
			Cookie[] cookies = request.getCookies();
			String ckid = null;
			boolean foundCkid = false;

			//ì¿ í‚¤ ê²??‚¬~!
			for (Cookie cookie : cookies) {
				  if(cookie.getName().equals("ckid")){
				   ckid = cookie.getValue();
				   foundCkid = true;
				   break; // ?´ë¯? ì¿ í‚¤ë¥? ì°¾ì•˜?œ¼ë¯?ë¡? ë£¨í”„ ì¢…ë£Œ	
				  }
			}
			
			//ckidê°? ?´ë¯? ?ˆ?Š” ê²½ìš°~
			if(foundCkid){
				// ì¹´íŠ¸?— ?´ë¯? ???¥?œ ?ƒ?’ˆ?¸ì§? ì²´í¬?•˜?Š” ë©”ì„œ?“œ!
				int hasitem = cs.checkcartwithcookie(ckid, product_id, optId);
				System.out.println("?¥ë°”êµ¬?‹ˆ ?ˆ˜?Ÿ‰ :" + hasitem);
					
				if (hasitem > 0) { // ?¥ë°”êµ¬?‹ˆ?— ?ˆ?Š” ?ƒ?’ˆ?¼ ê²½ìš° ?ˆ˜?Ÿ‰ ì¦ê? method ?˜¸ì¶?
					cs.increasequantitywithcookie(ckid, product_id, quantity, optId);
					return "success"; // ?ƒ?’ˆ ?ˆ˜?Ÿ‰ ì¦ê? ?„±ê³?
				} else { // ?—†?Š” ?ƒ?’ˆ?¼ ê²½ìš° ?‹ ê·? ì¶”ê?
					cs.addcartwithcookie(ckid, product_id, quantity, optId);
					return "success"; // ?ƒ?’ˆ ì¶”ê? ?„±ê³?
				}
			   }//ckid ?—†?„ ?•Œ(ë¹„ë¡œê·¸ì¸ ?ƒ?ƒœ ìµœì´ˆ ???¥) : ì¿ í‚¤ ?‹ ê·? ?ƒ?„±
				
			else {  
			    // ì¿ í‚¤ê°? ?—†?Š” ê²½ìš°, ?ƒˆë¡œìš´ ì¿ í‚¤ ?•„?´?”” ?ƒ?„±
			    ckid = generateRandomString(); // ì¿ í‚¤ ?•„?´?”” ?ƒ?„± ë©”ì„œ?“œë¥? êµ¬í˜„?•´?•¼ ?•©?‹ˆ?‹¤.
			    // ?œ?¤ ë¬¸ì?—´ë¡? ckid ?ƒ?„±
			    Cookie cookie = new Cookie("ckid", ckid);
			    cookie.setMaxAge(365 * 24 * 60 * 60); // ì¿ í‚¤ ?œ ?š¨ê¸°ê°„ ?„¤? • (?˜ˆ: 1?…„)
			    cookie.setPath("/"); // ì¿ í‚¤?˜ ê²½ë¡œ ?„¤? •
			    // ?„œë²? -> ?´?¼?´?–¸?Š¸(ë¸Œë¼?š°??)ë¡? ì¿ í‚¤ ? „?†¡, ???¥
			    response.addCookie(cookie);
			    // ckid ê°’ì„ ?‚¬?š©?•˜?—¬ DB?— ???¥
			    cs.addcartwithcookie(ckid, product_id, quantity, optId);
			    System.out.println("ì¿ í‚¤ ê°?:" + ckid);			    

			    return "success";
			}
		}
	}

	private String generateRandomString() {
		// ?›?•˜?Š” ë°©ì‹?œ¼ë¡? ì¿ í‚¤ ?•„?´?”” ?ƒ?„± (?˜ˆ: ?œ?¤ ë¬¸ì?—´, ?‹œê°? ? •ë³? ?“±?„ ?™œ?š©)
//		String ckid = RandomStringUtils.random(6, true, true);
		String ckid = "hahaha";

		return ckid;
	}

	@RequestMapping(value = "/cart-out")
	public String productout(HttpSession session, HttpServletRequest request, Model mo) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		if (mdto != null) {
			// Session?— ???¥?˜?–´?ˆ?Š” ?‚¬?š©? ID ê°?? ¸?˜¤ê¸?
			String userId = mdto.getUserId();

			// ? œ?’ˆDB?— ? ‘ê·¼í•´?„œ product_idë¡? ?ƒ?’ˆ ? •ë³? ê°?? ¸?˜¤ê¸?
			ArrayList<CartProductDTO> list = cs.cartout(userId);

			mo.addAttribute("list", list);
			

			return "cart-out";
		} else {// ë¡œê·¸?¸ ê°’ì´ ?—†?Š” ê²½ìš° (ì¿ í‚¤ë¡? ???¥?•œ ê²½ìš°)
			Cookie[] cookies = request.getCookies();
			String ckvalue = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("ckid")) {
					ckvalue = cookie.getValue();
					System.out.println("ì¿ í‚¤ ê°?:" + ckvalue);
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
		// ?‚˜ë¨¸ì? ì½”ë“œ?Š” ê·¸ë?ë¡? ?œ ì§?
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		Cservice cs = sqlSession.getMapper(Cservice.class);
		String productIds = request.getParameter("productIds");
		String optIds = request.getParameter("optIds");
		System.out.println("!!!!? œ?’ˆë²ˆí˜¸!!!!" + productIds);// ?™•?¸?š©
		String[] ProductIdss = productIds.split(",");
		String[] optIdss = optIds.split(",");

		if (mdto != null) { // ë¡œê·¸?¸ ?ƒ?ƒœ?¼ ê²½ìš°
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
					break; // ?´ë¯? ì¿ í‚¤ë¥? ì°¾ì•˜?œ¼ë¯?ë¡? ë£¨í”„ ì¢…ë£Œ
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
					break; // ?´ë¯? ì¿ í‚¤ë¥? ì°¾ì•˜?œ¼ë¯?ë¡? ë£¨í”„ ì¢…ë£Œ
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
		// ?šŒ?›? •ë³? ê°?? ¸?˜¤ê¸?
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");

		Cservice cs = sqlSession.getMapper(Cservice.class);

		if (mdto != null) { // ë¡œê·¸?¸ ?ƒ?ƒœ?¼ ê²½ìš°
			String userId = mdto.getUserId();
			cs.changeqty(userId, product_id, quantity);
			return "success"; // ?ƒ?’ˆ ?ˆ˜?Ÿ‰ ì¦ê? ?„±ê³?

		} else { // ë¹„ë¡œê·¸ì¸ ?ƒ?ƒœ?¼ ê²½ìš° : ì¿ í‚¤ë¡? ???¥?œ ?ƒ?ƒœ
			Cookie[] cookies = request.getCookies();
			String ckvalue = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("ckid")) {
					ckvalue = cookie.getValue();
					break; // ?´ë¯? ì¿ í‚¤ë¥? ì°¾ì•˜?œ¼ë¯?ë¡? ë£¨í”„ ì¢…ë£Œ
				}
			}
			cs.changeqtyforcookie(ckvalue, product_id, quantity);
			return "success";
		}
	}
}

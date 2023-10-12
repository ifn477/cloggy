package com.ezen.dog.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.member.Mservice;
import com.ezen.dog.product.PService;
import com.ezen.dog.product.ProductDTO;


@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;

	   @ResponseBody
	    @RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	    public String cartin(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity, HttpSession session) {
	        // 회원정보 가져오기
	        MemberDTO mdto = (MemberDTO) session.getAttribute("member");
	        String userId = null;

	        // 로그인 상태
	        Cservice cs = sqlSession.getMapper(Cservice.class);
	        if (mdto != null) {
	            userId = mdto.getUserId();
	            cs.addcart(userId, product_id, quantity);
	            return "yes";
	        } else {
	            return "no";
	        }
	    }


	@RequestMapping(value = "/cart-out")
	public String productout(HttpSession session,HttpServletRequest request, CartDTO cdto, Model mo) {
		
		//Session에 저장되어있는 사용자 ID 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();
		
		//고객DB에 접근해서 userId로 고객 이름, 주소, 전화번호 등 정보 가져오기
		Mservice ms = sqlSession.getMapper(Mservice.class);
		ArrayList<MemberDTO> mlist = ms.memberInfoForCart(userId);
		mo.addAttribute("mlist", mlist);
		
		
		//제품DB에 접근해서 product_id로 상품 정보 가져오기
		PService ps = sqlSession.getMapper(PService.class);
		ArrayList<ProductDTO> plist = ps.cartout(userId);
		mo.addAttribute("plist", plist);
		
		//join해서 조회해보기...
		
		
		
		
		return "cart-out";
	}
}

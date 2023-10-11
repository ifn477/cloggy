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
import com.ezen.dog.product.PService;
import com.ezen.dog.product.ProductDTO;

@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;

	@ResponseBody
	@RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	public String cartin(@RequestParam("product_id") int product_id, @RequestParam("quantity") int quantity,
			HttpSession session) {
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
	public String cartout(HttpSession session, HttpServletRequest request, Model mo) {

		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = null;

		// 로그인 상태
		if (mdto != null) {
			userId = mdto.getUserId();
			Cservice cs = sqlSession.getMapper(Cservice.class);
			CartDTO cdto = cs.cartout(userId);
			int product_id = cdto.getProduct_id();
			PService ps = sqlSession.getMapper(PService.class);
			ArrayList<ProductDTO> pdto = ps.cartout2(product_id);
//			조인으로 가져와야 함!!!!
			mo.addAttribute("pdto", pdto);
			return "cart-out";
		}

		return "redirect:/";
	}
}

package com.ezen.dog.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.dog.cart.Cservice;
import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.PService;
import com.ezen.dog.product.ProductDTO;


@Controller
public class ReviewController {
	@Autowired
	SqlSession sqlSession;
	ArrayList<ReviewDTO>list = new ArrayList<ReviewDTO>();
	
	String imgPath = "C:\\Users\\dywlr\\git\\team_project\\team_project\\src\\main\\webapp\\review-img";
	
	//리뷰 작성폼 불러오기
	@RequestMapping(value="/review-input")
	public String reviewinput(HttpServletRequest request, Model mo, HttpSession session) {
		HttpSession hs = request.getSession();
		MemberDTO member = (MemberDTO) hs.getAttribute("member");
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		PService ps = sqlSession.getMapper(PService.class);
		ArrayList<ProductDTO> plist = ps.productdetail(product_id);
		mo.addAttribute("plist", plist);
		mo.addAttribute("member", member);

		
		return "review-input";
	}

	//리뷰 저장
	@RequestMapping(value="/review-save", method = RequestMethod.POST)
	public String reviewsave(HttpSession session, MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
//		회원 아이디 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();
		String rating =	multi.getParameter("rating");
		String r_content=multi.getParameter("r_content");
		MultipartFile mf = multi.getFile("r_photo");
		String fname = mf.getOriginalFilename();
		mf.transferTo(new File(imgPath+"\\"+fname));
		
		Rservice qs =sqlSession.getMapper(Rservice.class);
		qs.reviewinsert(userId, r_content, fname, rating);
		
		return "redirect:main";
	}
	
	//리뷰 출력
	@RequestMapping(value="/review-out")
	public String reviewout(Model mo, HttpServletRequest request, ProductDTO pdto) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		Rservice rs = sqlSession.getMapper(Rservice.class);
		ArrayList<ReviewDTO> list= rs.reviewout(product_id);
		mo.addAttribute("list", list);
		mo.addAttribute("product_id", product_id);
		pdto.setProduct_id(product_id);	
		mo.addAttribute("pdto", pdto);
		
		return "review-out";
	}
		
}

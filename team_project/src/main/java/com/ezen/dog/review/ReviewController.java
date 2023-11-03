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
import com.ezen.dog.member.Mservice;
import com.ezen.dog.order.OrderDTO;
import com.ezen.dog.order.OrderitemDTO;
import com.ezen.dog.order.Oservice;
import com.ezen.dog.product.PService;
import com.ezen.dog.product.ProductDTO;


@Controller
public class ReviewController {
	@Autowired
	SqlSession sqlSession;
	ArrayList<ReviewDTO>list = new ArrayList<ReviewDTO>();
	
	String imgPath = "C:\\Users\\dywlr\\git\\team_project_1024\\team_project\\src\\main\\webapp\\image";
	
	//리뷰 작성폼 불러오기
	@RequestMapping(value="/review-input")
	public String reviewinput(HttpServletRequest request, Model mo, HttpSession session) {
		HttpSession hs = request.getSession();
		MemberDTO member = (MemberDTO) hs.getAttribute("member");
		
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		
		Oservice ps = sqlSession.getMapper(Oservice.class);
		OrderitemDTO olist = ps.orderdetailToReview(order_id, product_id);
		mo.addAttribute("olist", olist);
		mo.addAttribute("member", member);

		
		return "review-input";
	}

	//리뷰 저장
	@RequestMapping(value="/review-save", method = RequestMethod.POST)
	public String reviewsave(HttpSession session, MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
//		회원 아이디 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();
		int product_id= Integer.parseInt(multi.getParameter("product_id"));
		String rating =	multi.getParameter("rating");
		String r_content=multi.getParameter("r_content");
		
		String r_photo = multi.getParameter("r_photo");
		MultipartFile mf = multi.getFile("r_photo");
		String fname = mf.getOriginalFilename();
		mf.transferTo(new File(imgPath+"\\"+fname));
		
		Rservice qs =sqlSession.getMapper(Rservice.class);
		qs.reviewinsert(userId, product_id, r_content, fname, rating);
		
		return "redirect:main";
	}
	
	//리뷰 출력
	@RequestMapping(value="/review-out")
	public String reviewout(Model mo, HttpServletRequest request, ProductDTO pdto) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		Rservice rs = sqlSession.getMapper(Rservice.class);
		ReviewDTO list= rs.reviewout(product_id);
		mo.addAttribute("list", list);
		mo.addAttribute("product_id", product_id);
		pdto.setProduct_id(product_id);	
		mo.addAttribute("pdto", pdto);
		
		return "review-out";
	}
	//리뷰 출력
	@RequestMapping(value="/review-list")
	public String reviewlist(Model mo, HttpServletRequest request, ProductDTO pdto) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		Rservice rs = sqlSession.getMapper(Rservice.class);
		ArrayList<ReviewDTO> list= rs.reviewlist(product_id);
		mo.addAttribute("list", list);
		mo.addAttribute("product_id", product_id);
		pdto.setProduct_id(product_id);	
		mo.addAttribute("pdto", pdto);
		
		return "review-out";
	}
		
}

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

import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.ProductDTO;


@Controller
public class ReviewController {
	@Autowired
	SqlSession sqlSession;
	ArrayList<ReviewDTO>list = new ArrayList<ReviewDTO>();
	
	String imgPath = "C:\\Users\\���Ѽ�\\git\\team_project3\\team_project\\src\\main\\webapp\\review-img";
	
	
	//���� �ۼ��� �ҷ�����
	@RequestMapping(value="/review-input")
	public String reviewinput(Model mo) {

		
		return "review-input";
	}

	//���� ����
	@RequestMapping(value="/review-save", method = RequestMethod.POST)
	public String reviewsave(HttpSession session,MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
//		ȸ�� ���̵�� ��ǰ ��ȣ�� DTO���� ������
//		int product_id = pdto.getProduct_id();
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();
		
		String r_content=multi.getParameter("r_content");
		MultipartFile mf = multi.getFile("r_photo");
		String fname = mf.getOriginalFilename();
		mf.transferTo(new File(imgPath+"\\"+fname));
		
		Rservice qs =sqlSession.getMapper(Rservice.class);
		qs.reviewinsert(userId, r_content, fname);
		
		return "redirect:main";
	}
	
	//���� ���
	@RequestMapping(value="/review-out")
	public String reviewout(Model mo, ProductDTO pdto) {
		int product_id = pdto.getProduct_id();
		mo.addAttribute("pdto", pdto);
		
		Rservice qs = sqlSession.getMapper(Rservice.class);
		ArrayList<ReviewDTO> list= qs.reviewout(product_id);
		mo.addAttribute("list", list);
		
		return "review-out";
	}
		
}

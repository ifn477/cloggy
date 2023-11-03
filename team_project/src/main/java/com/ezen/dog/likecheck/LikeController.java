package com.ezen.dog.likecheck;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LikeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/like-add")
	public String likeadd(HttpServletRequest request) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));	
		String userId = request.getParameter("userId");
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
		ls.likeadd(product_id,userId);
		return "product-user-out";
	}
	
	@RequestMapping(value = "/like-delete")
	public String likedelete(HttpServletRequest request) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));	
		String userId = request.getParameter("userId");
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
		ls.likedelete(product_id,userId);
		return "product-user-out";
	}
	
	@RequestMapping(value = "/like-out")
	public String likeout(HttpServletRequest request, Model mo) {
		String userId = request.getParameter("userId");
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
		ArrayList<LikeDTO> list = ls.likeout();
		mo.addAttribute("list",list);
		return "product-like-out";
	}
	
}

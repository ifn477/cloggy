package com.ezen.dog.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dog.likecheck.LikeDTO;
import com.ezen.dog.likecheck.Likeservice;

@Controller
public class Mycontroller {

	@Autowired
	SqlSession sqlSession;
	
	ArrayList<MyDTO> list = new ArrayList<MyDTO>();
	
	@RequestMapping(value = "/mypage")
	public String mypage()
	{
		return "mypage";
	}
	
	@RequestMapping(value = "mylike")
	public String mylike(HttpServletRequest request, Model mo) {
		
		String userId = request.getParameter("userId");
		Myservice ms = sqlSession.getMapper(Myservice.class);
		ArrayList<MyDTO> list = ms.mlikeout(userId);
		mo.addAttribute("list",list);
		
		return "mypage";
	}
	
	
	
	

}

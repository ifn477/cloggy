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
import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.member.Mservice;
import com.ezen.dog.member.MyBabyDTO;

@Controller
public class Mycontroller {

	@Autowired
	SqlSession sqlSession;

	ArrayList<MyDTO> list = new ArrayList<MyDTO>();

	@RequestMapping(value = "/mypage")
	public String mypage(HttpServletRequest request, Model mo) {

		String userId = request.getParameter("userId");
		Myservice ms = sqlSession.getMapper(Myservice.class);
		ArrayList<MyDTO> list = ms.ordercnt(userId);
		mo.addAttribute("list", list);

		int couponCount = ms.cpcnt(userId);
		System.out.println("##쿠폰수량##" + couponCount);
		mo.addAttribute("couponCount", couponCount);

		Mservice mems = sqlSession.getMapper(Mservice.class);
		ArrayList<MyBabyDTO> babyList = mems.babyView(userId);
		mo.addAttribute("babyList", babyList);
		
		return "mypage";
	}

}

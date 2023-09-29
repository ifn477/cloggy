package com.ezen.dog.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Membercontroller {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/memberinput")
	public String memberinput()
	{
		return "memberinput";
	}

	@RequestMapping(value = "/membersave",method = RequestMethod.POST)
	public String membersave(HttpServletRequest request)
	{
		String userId = request.getParameter("userId");
		String password =request.getParameter("password");
		String userName = request.getParameter("userName");
		int age =Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Mservice ms = sqlSession.getMapper(Mservice.class);
		ms.insertm(userId,password,userName,age,gender,email,phone,address);
		
		
		return "redirect:main";
	}
	
	
}

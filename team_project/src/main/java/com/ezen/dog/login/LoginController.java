package com.ezen.dog.login;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.LocalDataSourceJobStore;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.dog.member.MemberDTO;	

@Controller
public class LoginController {
	
	@Autowired
	SqlSession sqlSession;
	
	// 로그인 폼
	@RequestMapping(value = "/login-input")
	public String logininput() {
		return "login-input";
	}
	
	// 로그인
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		Lservice ms = sqlSession.getMapper(Lservice.class);
		MemberDTO mdto =ms.login(userId,password);
		
		if(mdto!=null){
		HttpSession hs = request.getSession();
		hs.setAttribute("member",mdto);
		hs.setAttribute("loginstate",true);
		hs.setMaxInactiveInterval(60*30);
		return "redirect:main";
		}
		else{
		return "login-input";
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession hs =request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate",false);
		return "redirect:/";
	}
	
}

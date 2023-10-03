package com.ezen.dog.login;

import java.io.IOException;
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

import com.ezen.dog.member.MMailSend;
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
		HttpSession hs = request.getSession();
		
		if(mdto!=null){
		hs.setAttribute("member",mdto);
		hs.setAttribute("loginstate",true);
		hs.setMaxInactiveInterval(60*30);
		return "redirect:main";
		}
		else{
		hs.setAttribute("loginFailed",true);
		hs.setMaxInactiveInterval(3);
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
	
	// 아이디 찾기 폼
	@RequestMapping(value = "/id-searchForm")
	public String idsearch() {
		return "id-searchForm";
	}
	
	// 아이디 찾기 뷰
	@RequestMapping(value="id-searchView")
	public String idsearchView(HttpServletRequest request, Model mo) {
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		Lservice ms = sqlSession.getMapper(Lservice.class);
		HttpSession hs =request.getSession();
		MemberDTO mdto =ms.idsearchView(userName,email);
		
		if(mdto!=null) {
			mo.addAttribute("list",mdto);
			return "id-searchView";
		}else {
			hs.setAttribute("loginFailed",true);
			hs.setMaxInactiveInterval(3);
			return "id-searchForm";
		}
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value = "/pw-searchForm")
	public String pwsearch() {
		return "pw-searchForm";
	}
	
	// 비밀번호 찾기 뷰
	@RequestMapping(value = "/pw-searchView")
	public String pwsearchView(HttpServletRequest request, Model mo) {
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		Lservice ms = sqlSession.getMapper(Lservice.class);
		HttpSession hs = request.getSession();
		MemberDTO mdto =ms.pwsearchView(userId,email);
		
		if(mdto!=null) {
			mo.addAttribute("list",mdto);
			String password = mdto.getPassword();
			LMailSend.sendMail(email,password);
	        hs.setAttribute("mailSent", true);
			hs.setMaxInactiveInterval(3);
			return "login-input";
		}else {
			hs.setAttribute("loginFailed",true);
			hs.setMaxInactiveInterval(3);
			return "pw-searchForm";
		}
	}
}

package com.ezen.dog.login;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

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
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request,HttpSession session,
			HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		Lservice ms = sqlSession.getMapper(Lservice.class);
		MemberDTO mdto =ms.login(userId,password);
		HttpSession hs = request.getSession();
		
//		회원 로그인 시 비회원 장바구니 -> 회원 장바구니 
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		
		if(cookie!=null) {
			String ckValue = cookie.getValue();
			System.out.println("비회원 장바구니 삭제");
//		쿠키에 담긴 정보에 회원 ID 입력.
			ms.cartUpdate(ckValue, userId);
		}
		
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
	//ReqeustParam으로 code값 받아오기
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Throwable {
		KakaoLoginService service = new KakaoLoginService();
		
		//code로 Token값 받아오기
		String access_Token = service.getAccessToken(code);
		//Token값으로 사용자 정보 가져오기
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		String nickname = (String)userInfo.get("nickname");
		String email = (String)userInfo.get("email");
		
		//사용자 정보 중 이름과, 이메일을 사용하여 회원여부 확인 후 로그인 
		Lservice ls = sqlSession.getMapper(Lservice.class);
		MemberDTO mdto = ls.kakaologin(nickname,email);
		if(mdto!=null){
		HttpSession hs = request.getSession();
		hs.setAttribute("member",mdto);
		hs.setAttribute("loginstate",true);
		hs.setMaxInactiveInterval(60*30);
		return "redirect:main";
		}
		else{
		return "kakaoLogin";
		}
	}
	
	@RequestMapping(value = "/naverlogin")
	public String naverlogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Throwable {
		NaverLoginService service = new NaverLoginService();
		System.out.println("code##:"+code);
		String access_Token = service.getAccessToken(code);
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		String name = (String)userInfo.get("name");
		String email = (String)userInfo.get("email");
		
		//사용자 정보 중 이름과, 이메일을 사용하여 회원여부 확인 후 로그인 
		Lservice ls = sqlSession.getMapper(Lservice.class);
		MemberDTO mdto = ls.naverlogin(name,email);
		if(mdto!=null){
		HttpSession hs = request.getSession();
		hs.setAttribute("member",mdto);
		hs.setAttribute("loginstate",true);
		hs.setMaxInactiveInterval(60*30);
		}
		return "redirect:main";
		
		
		
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

package com.ezen.dog.login;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.dog.member.MemberDTO;	


@Controller
public class LoginController {
	
	@Autowired
	SqlSession sqlSession;
	
	//  α      
	@RequestMapping(value = "/login-input")
	public String logininput(HttpServletRequest request, Model mo) {
		
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("rememberedUserId")) {
	                String rememberedUserId = cookie.getValue();
	                mo.addAttribute("rememberedUserId", rememberedUserId);
	                break;
	            }
	        }
	    }
		
		return "login-input";
	}
	
	//  α   
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		Lservice ls = sqlSession.getMapper(Lservice.class);
		MemberDTO mdto =ls.login(userId,password);
		HttpSession hs = request.getSession();
		
		if(mdto!=null){
		hs.setAttribute("member",mdto);
		hs.setAttribute("loginstate",true);
		hs.setMaxInactiveInterval(60*60);
		return "redirect:main";
		}
		else{
		hs.setAttribute("loginFailed",true);
		hs.setMaxInactiveInterval(3);
		return "login-input";
		}
	}
	//ReqeustParam으로 code값 받기
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Throwable {
		KakaoLoginService service = new KakaoLoginService();
		
		//code를 보내서 토큰 얻기  
		String access_Token = service.getAccessToken(code);
		//토큰보내서 회원정보 가져오기                          
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		String nickname = (String)userInfo.get("nickname");
		String email = (String)userInfo.get("email");
		
		//회원의 이름과 이메일이 일치하면 로그인    
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

	//  α׾ƿ 
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession hs =request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate",false);
		return "redirect:/";
	}
	
	//    ̵  ã     
	@RequestMapping(value = "/id-searchForm")
	public String idsearch() {
		return "id-searchForm";
	}
	
	//    ̵  ã     
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
	
	//   й ȣ ã     
	@RequestMapping(value = "/pw-searchForm")
	public String pwsearch() {
		return "pw-searchForm";
	}
	
	//   й ȣ ã     
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

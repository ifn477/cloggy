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
	
	@RequestMapping(value = "/login-input")
	public String logininput(HttpServletRequest request, Model model) {
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("rememberedUserId")) {
	                String rememberedUserId = cookie.getValue();
	                // Set the remembered user ID in the model to pre-fill the input field
	                model.addAttribute("rememberedUserId", rememberedUserId);
	                break;
	            }
	        }
	    }
	    return "login-input";
	}

	
	// �α���
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request,HttpSession session,
			HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		

		
		Lservice ms = sqlSession.getMapper(Lservice.class);
		MemberDTO mdto =ms.login(userId,password);
		HttpSession hs = request.getSession();
		
		
		
		

		System.out.println("3�ܰ�-�α��δܰ�");
		
		
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
	//ReqeustParam���� code�� �޾ƿ���
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Throwable {
		KakaoLoginService service = new KakaoLoginService();
		
		//code�� Token�� �޾ƿ���
		String access_Token = service.getAccessToken(code);
		//Token������ ����� ���� ��������
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		String nickname = (String)userInfo.get("nickname");
		String email = (String)userInfo.get("email");
		
		//����� ���� �� �̸���, �̸����� ����Ͽ� ȸ������ Ȯ�� �� �α��� 
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
		
		//����� ���� �� �̸���, �̸����� ����Ͽ� ȸ������ Ȯ�� �� �α��� 
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

	// �α׾ƿ�
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession hs =request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate",false);
		return "redirect:/";
	}
	
	// ���̵� ã�� ��
	@RequestMapping(value = "/id-searchForm")
	public String idsearch() {
		return "id-searchForm";
	}
	
	// ���̵� ã�� ��
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
	
	// ��й�ȣ ã�� ��
	@RequestMapping(value = "/pw-searchForm")
	public String pwsearch() {
		return "pw-searchForm";
	}
	
	// ��й�ȣ ã�� ��
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

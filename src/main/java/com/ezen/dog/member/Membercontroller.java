package com.ezen.dog.member;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Membercontroller {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/member-input")
	public String memberinput()
	{
		return "member-input";
	}

	@RequestMapping(value = "/member-save",method = RequestMethod.POST)
	public String membersave(HttpServletRequest request)
	{
		String userId = request.getParameter("userId");
		String password =request.getParameter("password");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("roadFullAddr");
		Mservice ms = sqlSession.getMapper(Mservice.class);
		ms.membersave(userId,password,userName,email,phone,address);
		
		return "redirect:main";
	}
	
		@RequestMapping(value = "/member-out")
		public String memberout(HttpServletRequest request, Model mo) {
			Mservice ms =sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberout();
			mo.addAttribute("list",list);
			return "member-out";
		}
		
		@RequestMapping(value = "/member-modifyForm")
		public String membermodifyForm(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.membermodifyForm(userId);
			mo.addAttribute("list",list);
			return "member-modifyForm";
		}

		@RequestMapping(value = "/member-modifyView")
		public String membermodifyView(HttpServletRequest request) {
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String userName = request.getParameter("userName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("roadFullAddr");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.membermodifyView(userId, password, userName, email, phone, address);
			return "redirect:member-out";
		}

		@RequestMapping(value ="/member-delete")
		public String memberdelete(HttpServletRequest request) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.memberdelete(userId);
			return "redirect:member-out";
		}
		

		@RequestMapping(value="/member-searchForm")
		public String membersearchForm() {
			return "member-searchForm";
		}


		@RequestMapping(value="/member-searchView", method = RequestMethod.POST)
		public String membersearchView(HttpServletRequest request, Model mo) {
			String item = request.getParameter("item");
			String value = request.getParameter("value");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			
			if(item.equals("userId")) {
				ArrayList<MemberDTO> list = ms.membersearchViewId(value);
			}
			else if(item.equals("userName")) {
				ArrayList<MemberDTO> list = ms.membersearchViewName(value);
			}
			else {
				ArrayList<MemberDTO> list = ms.membersearchViewEmail(value);
			}
			return "redirect:member-out";
		}

		@ResponseBody
		@RequestMapping(value="/idcheck")
		public String idcheck(String userId) {
			Mservice ms = sqlSession.getMapper(Mservice.class);
			int count = ms.idcheck(userId);
			String bb=null;
			if(count==0) {
				bb="ok";
			}else {
				bb="no";
			}
			return bb;
		}
			
		@RequestMapping(value = "/member-info")
		public String memberinfo(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberinfo(userId);
			mo.addAttribute("list",list);
		return "member-info";
		}	
		
		@RequestMapping(value = "/member-deleteSelf")
		public String memberdeleteSelf(HttpServletRequest request) {
				String userId = request.getParameter("userId");
				Mservice ms = sqlSession.getMapper(Mservice.class);
				ms.memberdeleteSelf(userId);


				HttpSession hs = request.getSession();
				hs.removeAttribute("member");
				hs.setAttribute("loginstate", false);
				return "redirect:/";

		}
		
		@RequestMapping(value = "/jusoPopup")
		public String jusoPopup() {
			return "jusoPopup";
		}

		@RequestMapping(value = "/mail-send")
		public String Mailsend(HttpServletRequest request) throws IOException {
			String email = request.getParameter("email");
			MMailSend.sendMail(email);
			return "redirect:member-input";
		}
		
		@ResponseBody
		@RequestMapping(value = "/verifyKey", produces = "application/json; charset=utf8")
		public boolean verifyKey(HttpServletRequest request) throws IOException {
			String email = request.getParameter("email");
			String userInputKey = request.getParameter("userInputKey");
			boolean codeCheck = MMailSend.verifyKey(email, userInputKey);
			return codeCheck;
		}
			
		@RequestMapping(value = "/kakaoMember", method = RequestMethod.GET)
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Throwable {
			KakaoLoginService service = new KakaoLoginService();
				
			String access_Token = service.getAccessToken(code);
			HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
			String nickname = (String)userInfo.get("nickname");
			String email = (String)userInfo.get("email");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.kakaomember(nickname, email);
				
			return "redirect:main";
		}
			
		@RequestMapping(value = "/member-modifySelfForm")
		public String membermodifySelfForm(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.membermodifyForm(userId);
			mo.addAttribute("list",list);
			return "member-modifySelfForm";
		}

		@RequestMapping(value = "/member-modifySelfView")
		public String membermodifySelfView(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String userName = request.getParameter("userName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("roadFullAddr");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.membermodifySelfView(userId, password, userName, email, phone, address);
			ArrayList<MemberDTO> list = ms.memberinfoout(userId);
			mo.addAttribute("list",list);
			return "member-info";
		}
		
		@RequestMapping(value = "/member-terms1")
		public String memberterms1() {
			return "member-terms1";
		}
		
		@RequestMapping(value = "/member-terms2")
		public String memberterms2() {
			return "member-terms2";
		}
		
}
		

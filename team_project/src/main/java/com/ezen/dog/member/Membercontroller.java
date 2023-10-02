package com.ezen.dog.member;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;

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
		int age =Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("roadFullAddr");
		Mservice ms = sqlSession.getMapper(Mservice.class);
		ms.membersave(userId,password,userName,age,gender,email,phone,address);
		
		return "redirect:main";
	}
	
	// 회원 정보 출력
		@RequestMapping(value = "/member-out")
		public String memberout(HttpServletRequest request, Model mo) {
			Mservice ms =sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberout();
			mo.addAttribute("list",list);
			return "member-out";
		}
		
		// 회원 정보 수정 폼
		@RequestMapping(value = "/member-modifyForm")
		public String membermodifyForm(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.membermodifyForm(userId);
			mo.addAttribute("list",list);
			return "member-modifyForm";
		}
		
		// 회원 정보 수정 저장
		@RequestMapping(value = "/member-modifyView")
		public String membermodifyView(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String userName = request.getParameter("userName");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("roadFullAddr");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.membermodifyView(userId, password, userName, age, gender, email, phone, address);
			return "redirect:member-out";
		}
		
		// 회원 정보 삭제
		@RequestMapping(value ="/member-delete")
		public String memberdelete(HttpServletRequest request) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.memberdelete(userId);
			return "redirect:member-out";
		}
		
		// 회원 정보 검색 폼
		@RequestMapping(value="/member-searchForm")
		public String membersearchForm() {
			return "member-searchForm";
		}

		// 회원 정보 검색 출력
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
		
		// 아이디 중복 검사
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
			
		// 내정보 조회
		@RequestMapping(value = "/member-info")
		public String memberinfo(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberinfo(userId);
			mo.addAttribute("list",list);
		return "member-info";
		}	
		
		// 회원 탈퇴
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
		
		// 주소 팝업 api
		@RequestMapping(value = "/jusoPopup")
		public String jusoPopup() {
			return "jusoPopup";
		}

		// 이메일 발송
		@RequestMapping(value = "/mail-send")
		public String Mailsend(HttpServletRequest request) throws IOException {
			String email = request.getParameter("email");
			MailSend.sendMail(email);
			return "redirect:member-input";
		}
		
		// 인증메일 확인
		@ResponseBody
		@RequestMapping(value = "/verifyKey", produces = "application/json; charset=utf8")
		public boolean verifyKey(HttpServletRequest request) throws IOException {
			String email = request.getParameter("email");
			String userInputKey = request.getParameter("userInputKey");
			System.out.println("메일 : "+email+" 인증 코드 : "+ userInputKey);
			boolean codeCheck = MailSend.verifyKey(email, userInputKey);
			System.out.println("일치 불일치 여부는 "+codeCheck);
			return codeCheck;
		}
}
		

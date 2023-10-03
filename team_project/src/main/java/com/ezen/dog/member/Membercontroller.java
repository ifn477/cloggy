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
	
	    // ȸ�� ���� ���
		@RequestMapping(value = "/member-out")
		public String memberout(HttpServletRequest request, Model mo) {
			Mservice ms =sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberout();
			mo.addAttribute("list",list);
			return "member-out";
		}
		
		// ȸ�� ���� ���� ��
		@RequestMapping(value = "/member-modifyForm")
		public String membermodifyForm(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.membermodifyForm(userId);
			mo.addAttribute("list",list);
			return "member-modifyForm";
		}
		
		// ȸ�� ���� ���� ����
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
		
		// ȸ�� ���� ����
		@RequestMapping(value ="/member-delete")
		public String memberdelete(HttpServletRequest request) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.memberdelete(userId);
			return "redirect:member-out";
		}
		
		// ȸ�� ���� �˻� ��
		@RequestMapping(value="/member-searchForm")
		public String membersearchForm() {
			return "member-searchForm";
		}

		// ȸ�� ���� �˻� ���
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
		
		// ���̵� �ߺ� �˻�
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
			
		// ������ ��ȸ
		@RequestMapping(value = "/member-info")
		public String memberinfo(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberinfo(userId);
			mo.addAttribute("list",list);
		return "member-info";
		}	
		
		// ȸ�� Ż��
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
		
		// �ּ� �˾� api
		@RequestMapping(value = "/jusoPopup")
		public String jusoPopup() {
			return "jusoPopup";
		}

		// �̸��� �߼�
		@RequestMapping(value = "/mail-send")
		public String Mailsend(HttpServletRequest request) throws IOException {
			String email = request.getParameter("email");
			MMailSend.sendMail(email);
			return "redirect:member-input";
		}
		
		// �������� Ȯ��
		@ResponseBody
		@RequestMapping(value = "/verifyKey", produces = "application/json; charset=utf8")
		public boolean verifyKey(HttpServletRequest request) throws IOException {
			String email = request.getParameter("email");
			String userInputKey = request.getParameter("userInputKey");
			boolean codeCheck = MMailSend.verifyKey(email, userInputKey);
			return codeCheck;
		}
}
		
package com.ezen.dog.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		int age =Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Mservice ms = sqlSession.getMapper(Mservice.class);
		ms.insertm(userId,password,userName,age,gender,email,phone,address);
		
		
		return "redirect:main";
	}
	
	// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½
		@RequestMapping(value = "/member-out")
		public String memberout(HttpServletRequest request, Model mo) {
			Mservice ms =sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.memberout();
			mo.addAttribute("list",list);
			return "member-out";
		}
		
		// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½
		@RequestMapping(value = "/member-modifyForm")
		public String membermodifyForm(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ArrayList<MemberDTO> list = ms.membermodifyForm(userId);
			mo.addAttribute("list",list);
			return "member-modifyForm";
		}
		
		// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
		@RequestMapping(value = "/member-modifyView")
		public String membermodifyView(HttpServletRequest request, Model mo) {
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String userName = request.getParameter("userName");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.membermodifyView(userId, password, userName, age, gender, email, phone, address);
			return "redirect:member-out";
		}
		
		// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
		@RequestMapping(value ="/member-delete")
		public String memberdelete(HttpServletRequest request) {
			String userId = request.getParameter("userId");
			Mservice ms = sqlSession.getMapper(Mservice.class);
			ms.memberdelete(userId);
			return "redirect:member-out";
		}
		
		// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Ë»ï¿½ ï¿½ï¿½
		@RequestMapping(value="/member-searchForm")
		public String membersearchForm() {
			return "member-searchForm";
		}

		// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Ë»ï¿½ ï¿½ï¿½ï¿½
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
		
		// ï¿½ï¿½ï¿½Ìµï¿½ ï¿½ßºï¿½ ï¿½Ë»ï¿½
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
			
			
			//ReqeustParamÀ¸·Î code°ª ¹Þ¾Æ¿À±â
			@RequestMapping(value = "/kakaoMember", method = RequestMethod.GET)
			public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Throwable {
				KakaoLoginService service = new KakaoLoginService();
				
				//code·Î Token°ª ¹Þ¾Æ¿À±â
				String access_Token = service.getAccessToken(code);
				//Token°ªÀ¸·Î »ç¿ëÀÚ Á¤º¸ °¡Á®¿À±â
				HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
				String nickname = (String)userInfo.get("nickname");
				String email = (String)userInfo.get("email");
				Mservice ms = sqlSession.getMapper(Mservice.class);
				ms.kakaomember(nickname, email);
				
				return "redirect:main";
			}
}

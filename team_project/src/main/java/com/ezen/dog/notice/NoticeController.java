package com.ezen.dog.notice;

import java.util.ArrayList;

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
public class NoticeController {
	
	@Autowired
	SqlSession sqlSession;
	
	ArrayList<NoticeDTO>list = new ArrayList<NoticeDTO>();
	
	@RequestMapping(value="/notice-input")
	public String noticeinput() {
		return "notice-input";
	}
	
	@RequestMapping(value="/notice-inputtest")
	public String noticeinputtest(HttpServletRequest request) {
	    HttpSession hs = request.getSession();
	    Object loginState = hs.getAttribute("loginstate");

	    if (loginState != null && loginState instanceof Boolean && (Boolean) loginState) {
	        return "notice-input";
	    } else {
	        return "error";
	    }
	}

	
	//qna����
	@RequestMapping(value="/notice-save",method = RequestMethod.POST)
	public String noticesave(HttpServletRequest request) {
		String userId=request.getParameter("userId");
		String n_title=request.getParameter("n_title");
		String n_content=request.getParameter("n_content").replace("\r \n","<br>");
		Nservice ns=sqlSession.getMapper(Nservice.class);
		ns.noticeinsert(userId, n_title, n_content);
		
		
		return "redirect:notice-out";
	}
	
	//qna ���
	@RequestMapping(value="/notice-out")
	public String noticeout(Model mo) {
		
		Nservice ns = sqlSession.getMapper(Nservice.class);
		ArrayList<NoticeDTO>list= ns.noticeout();		
		mo.addAttribute("list", list);
		
		return "notice-out";
	}
	
	//qna�������
	@RequestMapping(value = "/notice-detail")
	public String noticedetil(HttpServletRequest request,Model mo) {
		
		int n_number = Integer.parseInt(request.getParameter("n_number"));
		
		Nservice ns = sqlSession.getMapper(Nservice.class);
		ArrayList<NoticeDTO>list= ns.noticedetail(n_number);
		mo.addAttribute("list", list);
	
		return "notice-detail";
	}
	
	
	@RequestMapping(value = "/notice-modifyForm")
	public String qnamodifyForm(HttpServletRequest request,Model mo) {
		
		int n_number=Integer.parseInt(request.getParameter("n_number"));
		Nservice ns= sqlSession.getMapper(Nservice.class);
		ArrayList<NoticeDTO>list= ns.noticemodifydata(n_number);
		mo.addAttribute("list", list);
		
		return "notice-modifyForm";
	}
		
		@RequestMapping(value = "/notice-modifysave",method = RequestMethod.POST)
		public String noticemodifysave(HttpServletRequest request) {
			
			int n_number =Integer.parseInt(request.getParameter("n_number"));
			String userId = request.getParameter("userId");
			String n_title = request.getParameter("n_title");
			String n_content = request.getParameter("n_content");
			
			Nservice ns= sqlSession.getMapper(Nservice.class);
			ns.noticemodifysave(n_number,userId,n_title,n_content);
			
			return "redirect:notice-out";
		
	}
	
		@RequestMapping(value = "/notice-delete")
		public String qnadelete(HttpServletRequest request) {
			
			int n_number=Integer.parseInt(request.getParameter("n_number"));
			
			Nservice ns= sqlSession.getMapper(Nservice.class);
			ns.noticedelete(n_number);
			
			return "redirect:notice-out";
		}
		
		
		@RequestMapping(value = "/notice-searchview")
		public String qnasearchview(HttpServletRequest request,Model mo) {
			
			String noticeitem = request.getParameter("noticeitem");
			String noticevalue = request.getParameter("noticevalue");
			Nservice ns= sqlSession.getMapper(Nservice.class);
			if(noticeitem.equals("n_title")) list = ns.noticesearchqtitle(noticevalue);
			else list = ns.noticesearchqcontent(noticevalue);
			mo.addAttribute("list", list);
			
			return "notice-searchview";
		}
		
	
		
		
	
}

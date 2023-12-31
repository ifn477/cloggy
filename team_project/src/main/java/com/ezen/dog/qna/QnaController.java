package com.ezen.dog.qna;

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
import com.ezen.dog.notice.Nservice;
import com.ezen.dog.product.ProductPageDTO;




@Controller
public class QnaController {
	
	@Autowired
	SqlSession sqlSession;
	
	ArrayList<QnaDTO>list = new ArrayList<QnaDTO>();
	
	@RequestMapping(value="/qna-input")
	public String qnainputtest(HttpServletRequest request) {
	    HttpSession hs = request.getSession();
	    Object loginState = hs.getAttribute("loginstate");

	    if (loginState != null && loginState instanceof Boolean && (Boolean) loginState) {
	        return "qna-input";
	    } else {
	        return "error";
	    }
	}

	
	//qna저장
	@RequestMapping(value="/qna-save",method = RequestMethod.POST)
	public String qnasave(HttpServletRequest request) {
		String q_userId=request.getParameter("userId");
		String q_title=request.getParameter("q_title");
		String q_content=request.getParameter("q_content").replace("\r \n","<br>");
		boolean q_secret = request.getParameter("q_secret") != null;
		Qservice qs =sqlSession.getMapper(Qservice.class);
		qs.qnainsert(q_userId,q_title,q_content,q_secret);
		
		return "redirect:main";
	}
	
	//qna 출력
	@RequestMapping(value="/qna-out")
	public String qnaout(HttpServletRequest request,Model mo,ProductPageDTO dto) {
		
		Qservice qs = sqlSession.getMapper(Qservice.class);
		ArrayList<QnaDTO>list= qs.qnaout();
		mo.addAttribute("list", list);
		
		String nowPage=request.getParameter("nowPage");
	    String cntPerPage=request.getParameter("cntPerPage");
	    Qservice notice = sqlSession.getMapper(Qservice.class);
	    int total=notice.cntnotice();
	    if(nowPage==null && cntPerPage == null) {
	       nowPage="1";
	       cntPerPage="10";
	    }
	    else if(nowPage==null) {
	       nowPage="1";
	    }
	    else if(cntPerPage==null) {
	       cntPerPage="5";
	    }      
	    dto = new ProductPageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
	    mo.addAttribute("paging",dto);
	    mo.addAttribute("list",notice.selectnotice(dto));
		
		
		return "qna-out";
	}
	
	//qna 내용
	@RequestMapping(value = "/qna-detail")
	public String qnadetil(HttpServletRequest request,Model mo) {
		
		int q_number = Integer.parseInt(request.getParameter("q_number"));
		
		Qservice qs = sqlSession.getMapper(Qservice.class);
	ArrayList<QnaDTO>list	= qs.qnadetail(q_number);
		mo.addAttribute("list", list);
	
		return "qna-detail";
	}
	
	//qna 답글달기
	@RequestMapping(value = "/qna-reply",method = RequestMethod.POST)
	public String qnareply(HttpServletRequest request,Model mo) {
				
		int q_number = Integer.parseInt(request.getParameter("q_number"));
		Qservice qs = sqlSession.getMapper(Qservice.class);
		ArrayList<QnaDTO>list= qs.qnareplyview(q_number);
		mo.addAttribute("list", list);
		
		return "qna-replyview";
	}
	
	//qna 댓글 저장
	@RequestMapping(value = "/qna-replysave",method = RequestMethod.POST)
	public String qnareplysave(HttpServletRequest request) {

		int q_number=Integer.parseInt(request.getParameter("q_number"));
		int q_groups=Integer.parseInt(request.getParameter("q_groups"));
		int q_step=Integer.parseInt(request.getParameter("q_step"));
		int q_indent=Integer.parseInt(request.getParameter("q_indent"));
		
		String userId = request.getParameter("userId");
		String q_title =request.getParameter("q_title");
		String q_content = request.getParameter("q_content").replace("\r \n","<br>" );
		Qservice qs = sqlSession.getMapper(Qservice.class);
		stepup(q_groups,q_step)	;	
		q_step++;
		q_indent++;
		qs.qnainsertreply(q_number,userId,q_title,q_content,q_groups,q_step,q_indent);
		return "redirect:qna-out";
	}
	
	public void stepup(int q_groups, int q_step) {
		
		Qservice qs= sqlSession.getMapper(Qservice.class);
		qs.qnastepup(q_groups, q_step);
		
	}
	
	@RequestMapping(value = "/qna-modifyForm")
	public String qnamodifyForm(HttpServletRequest request,Model mo) {
		
		int q_number=Integer.parseInt(request.getParameter("q_number"));
		Qservice qs= sqlSession.getMapper(Qservice.class);
		ArrayList<QnaDTO>list= qs.qnamodifydata(q_number);
		mo.addAttribute("list", list);
		
		return "qna-modifyForm";
	}
		
		@RequestMapping(value = "/qna-modifysave",method = RequestMethod.POST)
		public String qnamodifysave(HttpServletRequest request) {
			
			int q_number =Integer.parseInt(request.getParameter("q_number"));
			String userId = request.getParameter("userId");
			String q_title = request.getParameter("q_title");
			String q_content = request.getParameter("q_content");
			
			Qservice qs= sqlSession.getMapper(Qservice.class);
			qs.qnamodifysave(q_number,userId,q_title,q_content);
			
			return "redirect:qna-out";
		
	}
	
		@RequestMapping(value = "/qna-delete")
		public String qnadelete(HttpServletRequest request) {
			
			int q_number=Integer.parseInt(request.getParameter("q_number"));
			
			Qservice qs= sqlSession.getMapper(Qservice.class);
			qs.qnadelete(q_number);
			
			return "redirect:qna-out";
		}
		
		
		@RequestMapping(value = "/qna-searchview")
		public String qnasearchview(HttpServletRequest request,Model mo) {
			
			String qnaitem = request.getParameter("qnaitem");
			String qnavalue = request.getParameter("qnavalue");
			Qservice qs= sqlSession.getMapper(Qservice.class);
			if(qnaitem.equals("q_title")) list = qs.qnasearchqtitle(qnavalue);
			else if(qnaitem.equals("userId")) list = qs.qnasearchuserId(qnavalue);
			else list = qs.qnasearchqcontent(qnavalue);
			mo.addAttribute("list", list);
			
			return "qna-searchview";
		}
		
	
		
		
	
}

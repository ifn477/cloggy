package com.ezen.dog;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.dog.product.ProductDTO;


@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String main1(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("loginstate", false);
		return "main";
	}
	
	@RequestMapping(value = "/main")
	public String main2() {
		return "main";
	}
	
	@RequestMapping(value = "/info")
	public String main3() {
		return "info";
	}
	
	@RequestMapping(value="/search-all", method = RequestMethod.POST )
	public String searchall(HttpServletRequest request, Model mo) {
		String p_name = request.getParameter("p_name");
		
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<ProductDTO> list = ss.searchAll(p_name);
		mo.addAttribute("list", list);
		
		return "redirect:product-out";
	}
	
    @RequestMapping("/popup")
    public String popup(Model model) {
        // 팝업에 전달할 데이터를 모델에 추가
        model.addAttribute("message", "팝업 창 내용입니다.");
        return "popup";
    }

}


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

import com.ezen.dog.product.PService;
import com.ezen.dog.product.ProductDTO;


@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;
	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
	
	@RequestMapping(value = "/")
	public String main1(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		hs.setAttribute("loginstate", false);
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productout();
		ArrayList<ProductDTO> list2 = ps.productout();
		mo.addAttribute("bestlist", list);
		mo.addAttribute("newlist", list2);
		
		return "main";
	}
	
	@RequestMapping(value = "/main")
	public String main2(Model mo) {
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productout();
		ArrayList<ProductDTO> list2 = ps.productout();
		mo.addAttribute("bestlist", list);
		mo.addAttribute("newlist", list2);

		return "main";
	}
	
	@RequestMapping(value = "/info")
	public String main3() {
		return "info";
	}
	
    @RequestMapping("/popup")
    public String popup(Model model) {
        model.addAttribute("message", "ÆË¾÷Ã¢");
        return "popup";
    }
	
}
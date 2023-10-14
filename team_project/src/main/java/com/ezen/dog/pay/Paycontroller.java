package com.ezen.dog.pay;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dog.cart.CartProductDTO;

@Controller
public class Paycontroller {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/order")
	public String order(HttpServletRequest request, CartProductDTO cpdto, Model mo) {
//		  int finalprice = Integer.parseInt(request.getParameter("finalprice"));
//		  
//		  cpdto.setFinalprice(finalprice);
//		  mo.addAttribute("cpdto", cpdto);		    
		    
		  return "order";
	}
	
	@RequestMapping(value = "/naverpay")
	public String naverpay() {
		
		
		return "naverpay";
	}

}

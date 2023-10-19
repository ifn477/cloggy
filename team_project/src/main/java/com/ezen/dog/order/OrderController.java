package com.ezen.dog.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.ProductDTO;

@Controller
public class OrderController {

	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping(value = "/order",  method = { RequestMethod.GET, RequestMethod.POST })
	public String order(HttpServletRequest request,HttpSession session,Model mo) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();
		
		 String productIds = request.getParameter("productIds");
		  System.out.println("!!!!제품 "+ productIds);//
		
	
			    String[] ProductIdss = productIds.split(",");
			    
				  	Oservice os = sqlSession.getMapper(Oservice.class);
				  	ArrayList<OrderitemDTO> list = new ArrayList<>(); // ArrayList
				  	for (int i = 0; i < ProductIdss.length; i++) {
				  	    int product_id = Integer.parseInt(ProductIdss[i]);
				  	    // product_id
				  	    list.add(os.orderitem(userId, product_id));
				  	}

				  	// for 
				  	mo.addAttribute("list", list);
				  	System.out.println("저장된 리스트" +list);
				  
		
		 
		return "order";
	}
	
	
	

	
}

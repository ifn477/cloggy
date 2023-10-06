package com.ezen.dog.pay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Paycontroller {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/order")
	public String order() {
		
		
		return "order";
	}
	
	@RequestMapping(value = "/naverpay")
	public String naverpay() {
		
		
		return "naverpay";
	}

}

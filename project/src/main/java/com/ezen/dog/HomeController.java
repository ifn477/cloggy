package com.ezen.dog;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/main")
	public String main1() {
		return "main";
	}
	
	@RequestMapping(value = "/product-group")
	public String productgroup() {
		return "productgroup";
	}
	
	@RequestMapping(value = "/info")
	public String info() {
		return "info";
	}
	
}

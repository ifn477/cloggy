package com.ezen.dog;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String main() {
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
	
}

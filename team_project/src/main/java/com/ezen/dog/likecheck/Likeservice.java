package com.ezen.dog.likecheck;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.tools.javac.util.List;

public interface Likeservice {
	public ArrayList<LikeDTO> likecheck(String userId);
	public void likeadd(int product_id,String userId);
	public void likedelete(int product_id,String userId);
	public ArrayList<LikeDTO> likeout();
	
	}

package com.ezen.dog.product;

import java.io.File;	
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.parser.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.dog.likecheck.LikeDTO;
import com.ezen.dog.likecheck.Likeservice;
import com.ezen.dog.login.Lservice;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.tools.javac.util.List;

@Controller
public class ProductController {

	@Autowired
	SqlSession sqlSession;
	String image_path = "C:\\Users\\이한솔\\git\\team_project_comcomcom\\team_project\\src\\main\\webapp\\image";
	ArrayList<ProductDTO>list = new ArrayList<ProductDTO>();
	
	//상품입력
	@RequestMapping(value = "/product-input")
	public String productinput(Model mo) {
		PService ps = sqlSession.getMapper(PService.class);
		int now_product_id = ps.productidpreview();
		int input_product_id = now_product_id+1;
		mo.addAttribute("input_product_id", input_product_id);
		return "product-input";
	}
	
	//상품추천리스트
	@RequestMapping(value = "/product-recommendlist")
	public String productrecommendlist(HttpServletRequest request, Model mo) {
		String product_id = request.getParameter("product_id");
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productrecommendlist();
		mo.addAttribute("list", list);
		mo.addAttribute("product_id", product_id);
		return "product-recommendlist";
	}
	
	@RequestMapping(value = "/product-recommend", method = RequestMethod.POST)
	public ModelAndView productrecommend(HttpServletRequest request) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String[] recommend_product_id = request.getParameterValues("recommend_select_product");
		PService ps = sqlSession.getMapper(PService.class);
		for(int i=0; i<recommend_product_id.length ; i++) {
			ps.productrecommend(product_id,recommend_product_id[i]);
		}
	    ModelAndView modelAndView = new ModelAndView("closePopup");
	    return modelAndView;
	}
	
	//상품 DB저장
	@RequestMapping(value = "/product-save", method = RequestMethod.POST)
	public String product2(MultipartHttpServletRequest multi) throws IllegalStateException, IOException{
		int product_id = Integer.parseInt(multi.getParameter("product_id"));
		int category1_id = Integer.parseInt(multi.getParameter("category1_id"));
		int category2_id = Integer.parseInt(multi.getParameter("category2_id"));
		String p_name = multi.getParameter("p_name");
		int p_price = Integer.parseInt(multi.getParameter("p_price"));
		String p_info = multi.getParameter("p_info");
		MultipartFile mf_image = multi.getFile("p_image");
		String p_image = mf_image.getOriginalFilename(); 
		mf_image.transferTo(new File(image_path+"\\"+p_image));
		MultipartFile mf_thumnail = multi.getFile("p_thumbnail");
		String p_thumbnail = mf_thumnail.getOriginalFilename(); 
		mf_thumnail.transferTo(new File(image_path+"\\"+p_thumbnail));
		int p_stock = Integer.parseInt(multi.getParameter("p_stock"));
		double p_point = p_price * 0.01;
		PService ps = sqlSession.getMapper(PService.class);
		ps.productinput(product_id,category1_id,category2_id,p_name,p_price,p_info,p_image,p_thumbnail,p_stock,p_point);
		
		return "redirect:product-input";
	}

	//占쏙옙품占쏙옙占쏙옙트
	@RequestMapping(value = "/product-out")
	public String productout(Model mo) {
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productout();
		mo.addAttribute("list", list);
		return "product-out";
	}
	
	//占쏙옙품 占쏙옙占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/product-detail")
	public String productdetail(HttpServletRequest request, Model mo) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String userId = request.getParameter("userId");
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productdetail(product_id);
		ps.productcount(product_id);
		mo.addAttribute("list", list);
		
		//李쒗븯湲�
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
	    ArrayList<LikeDTO> likelist = null;
		likelist = ls.likecheck(userId);
		mo.addAttribute("likelist",likelist);
		
		return "product-detail";
	}
	

	@RequestMapping(value = "/product-modifyForm")
	public String productmodifyForm(HttpServletRequest request, Model mo) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productmodifyForm(product_id);
		mo.addAttribute("list", list);
		return "product-modifyForm";
	}

	//占쏙옙품 占쏙옙占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/product-modifyView", method = RequestMethod.POST)
	public String productmodifyView(MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
		int category_id = Integer.parseInt(multi.getParameter("category_id"));
		int product_id = Integer.parseInt(multi.getParameter("product_id"));
		String p_name = multi.getParameter("p_name");
		int p_price = Integer.parseInt(multi.getParameter("p_price"));
		String p_info = multi.getParameter("p_info");
		MultipartFile mf_image = multi.getFile("p_image");
		String p_image = mf_image.getOriginalFilename(); 
		mf_image.transferTo(new File(image_path+"\\"+p_image));
		MultipartFile mf_thumnail = multi.getFile("p_thumbnail");
		String p_thumbnail = mf_thumnail.getOriginalFilename(); 
		mf_thumnail.transferTo(new File(image_path+"\\"+p_thumbnail));
		int p_stock = Integer.parseInt(multi.getParameter("p_stock"));
		String p_enroll = multi.getParameter("p_enroll");

		PService ps = sqlSession.getMapper(PService.class);
		ps.productmodifyView(category_id,product_id, p_name,p_price,p_info,p_image,p_thumbnail,p_stock, p_enroll);
		
		return "redirect:product-out";
	}
	
	//占쏙옙품占쏙옙占쏙옙
	@RequestMapping(value = "/product-delete")
	public String productdelete(HttpServletRequest request) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		PService ps = sqlSession.getMapper(PService.class);
		ps.productdelete(product_id);
		
		return "redirect:product-out";
	}

	// �긽�뭹 �쟾泥닿��깋
	@RequestMapping(value="/search-all", method = RequestMethod.POST )
	public String searchall(HttpServletRequest request, Model mo) {
		String p_name = request.getParameter("p_name");
		PService ss = sqlSession.getMapper(PService.class);
		ArrayList<ProductDTO> listall = ss.searchAll(p_name);	
		ArrayList<ProductDTO> list1 = ss.search1(p_name);	
		ArrayList<ProductDTO> list2 = ss.search2(p_name);	
		ArrayList<ProductDTO> list3 = ss.search3(p_name);	
		mo.addAttribute("p_name", p_name);
		mo.addAttribute("listall", listall);
		mo.addAttribute("list1", list1);
		mo.addAttribute("list2", list2);
		mo.addAttribute("list3", list3);
		return "product-searchView";
	}	
	
	
	@RequestMapping(value = "/recent-products")
	public String recentProducts(HttpServletRequest request, Model mo) {
		
		String userId = request.getParameter("userId");
		
	    javax.servlet.http.Cookie[] cookies = request.getCookies();
	    String recentProducts = null;

	    if (cookies != null) {
	        for (javax.servlet.http.Cookie cookie : cookies) {
	            if (cookie.getName().equals("recent_products")) {
	                recentProducts = cookie.getValue();
	                break;
	            }
	        }
	    }
	    if (recentProducts != null && !recentProducts.isEmpty()) {
			PService ss = sqlSession.getMapper(PService.class);
			list = ss.productuserout();
			mo.addAttribute("list", list);
			
	        String[] productIds = recentProducts.split("/");
			PService ps = sqlSession.getMapper(PService.class);
	        ArrayList<ProductDTO> rplist = ps.recentProducts(productIds);
	        mo.addAttribute("rplist", rplist);
	    }
	    else {
	    	
	    }
	    
		return "product-recent-out";
	}
	
	
	@RequestMapping(value = "/prduct-user-out")
	public String prductuserout(HttpServletRequest request, Model mo) {
		
		String userId = request.getParameter("userId");
		

		PService ss = sqlSession.getMapper(PService.class);	
		list = ss.productuserout();
		mo.addAttribute("list", list);
	    
		//李쒗븯湲�
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
	    ArrayList<LikeDTO> likelist = null;
		likelist = ls.likecheck(userId);	
		mo.addAttribute("likelist",likelist);
		return "product-user-out";
	}
	
}

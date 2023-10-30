package com.ezen.dog.product;

import java.io.File;	
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.qna.Qservice;
import com.ezen.dog.review.ReviewDTO;
import com.ezen.dog.review.Rservice;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.tools.javac.util.List;

@Controller
public class ProductController {

	@Autowired
	SqlSession sqlSession;
	String image_path = "C:\\Users\\meata\\git\\team_project\\team_project\\src\\main\\webapp\\image";
	ArrayList<ProductDTO>list = new ArrayList<ProductDTO>();
	ArrayList<OptionDTO> optlist = new ArrayList<OptionDTO>();
	
	//상품입력
	@RequestMapping(value = "/product-input")
	public String productinput(Model mo) {
		PService ps = sqlSession.getMapper(PService.class);
		int p_id = ps.firstproductinput();
		int input_product_id = 1;
		if(p_id == 0){
			input_product_id =1;
		}
		else {
			int now_product_id = ps.productidpreview();
			input_product_id = now_product_id+1;
		}
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

	//전체상품출력
	@RequestMapping(value = "/product-out")
	public String productout(Model mo) {
		
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productout();
		mo.addAttribute("list", list);
		
		return "product-out";
	}

	//best카테 출력
	@RequestMapping(value = "/totalbest")
	public String totalbest(Model mo) {
		
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.totalbest();
		mo.addAttribute("list", list);
		
		return "best-product-out";
	}
	
	//상품리스트 대분류 출력
	@RequestMapping(value = "/product-out-total")
	public String productouttotal(HttpServletRequest request, Model mo) {
		int a = Integer.parseInt(request.getParameter("category1_id"));
		
	    // 세션에서 id 값 가져오기
	    HttpSession hs = request.getSession();
	    MemberDTO member = (MemberDTO) hs.getAttribute("member");
	    String userId = "";
	    if (member != null) {
	        userId = member.getUserId();
	    } 
		
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productouttotal(a);
		ArrayList<ProductDTO> bestlist = ps.bestproductouttotal(a);
		
		mo.addAttribute("list", list);
		mo.addAttribute("bestlist", bestlist);
		
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
	    ArrayList<LikeDTO> likelist = null;
		likelist = ls.likecheck(userId);	
		mo.addAttribute("likelist",likelist);
		return "product-user-out";
	}
	
	//상품리스트 중분류 출력
	@RequestMapping(value = "/product-out-cate")
	public String productout(HttpServletRequest request, Model mo) {
		int a = Integer.parseInt(request.getParameter("category1_id"));
		int b = Integer.parseInt(request.getParameter("category2_id"));

	    // 세션에서 id 값 가져오기
	    HttpSession hs = request.getSession();
	    MemberDTO member = (MemberDTO) hs.getAttribute("member");
	    String userId = "";
	    if (member != null) {
	        userId = member.getUserId();
	    } 
		
		PService ps = sqlSession.getMapper(PService.class);
		ArrayList<ProductDTO> list = ps.productoutcate(a, b);
		ArrayList<ProductDTO> bestlist = ps.bestproductoutcate(a, b);
		
		mo.addAttribute("list", list);
		mo.addAttribute("bestlist", bestlist);
		
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
	    ArrayList<LikeDTO> likelist = null;
		likelist = ls.likecheck(userId);	
		mo.addAttribute("likelist",likelist);
		return "product-user-out";
	}
	
	//상세페이지
	@RequestMapping(value = "/product-detail")
	public String productdetail(HttpServletRequest request, Model mo) {
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String userId = request.getParameter("userId");
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productdetail(product_id);
		optlist = ps.optdetail(product_id);
		ps.productcount(product_id);
		
		
		mo.addAttribute("list", list);
		mo.addAttribute("optlist", optlist);
		
		
		Rservice rs = sqlSession.getMapper(Rservice.class);
		ReviewDTO rdto = rs.reviewlist(product_id);
		mo.addAttribute("rdto", rdto);
		
		
		//추천상품출력
		ArrayList<ProductDTO> recommend_list = ps.productrecommendout(product_id);
		mo.addAttribute("recommend_list", recommend_list);
		
		//찜하기
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
		int category1_id = Integer.parseInt(multi.getParameter("category1_id"));
		int category2_id = Integer.parseInt(multi.getParameter("category2_id"));
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
		ps.productmodifyView(category1_id,product_id, p_name,p_price,p_info,p_image,p_thumbnail,p_stock, p_enroll,category2_id);
		
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
	    
		//찜하기
		Likeservice ls = sqlSession.getMapper(Likeservice.class);
	    ArrayList<LikeDTO> likelist = null;
		likelist = ls.likecheck(userId);	
		mo.addAttribute("likelist",likelist);
		return "product-user-out";
	}

	@RequestMapping(value = "/product-searchview")
	public String qnasearchview(HttpServletRequest request,Model mo) {
		
		String p_item = request.getParameter("p_item");
		String p_value = request.getParameter("p_value");
		PService ps = sqlSession.getMapper(PService.class);
		if(p_item.equals("p_name")) list = ps.searchproductname(p_value);
		else if(p_item.equals("category1")) list = ps.searchcategory1(p_value);
		else list = ps.searchcategory2(p_value);
		mo.addAttribute("list", list);
		
		return "product-out";
	}
}

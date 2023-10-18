package com.ezen.dog.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.dog.review.ReviewDTO;
import com.ezen.dog.review.Rservice;

@Controller
public class ProductController {

	@Autowired
	SqlSession sqlSession;
	String image_path = "C:\\Users\\���Ѽ�\\git\\team_project3\\team_project\\src\\main\\webapp\\image";
	ArrayList<ProductDTO>list = new ArrayList<ProductDTO>();
	
	//��ǰ�Է�
	@RequestMapping(value = "/product-input")
	public String productinput(Model mo) {
		PService ps = sqlSession.getMapper(PService.class);
		int now_product_id = ps.productidpreview();
		int input_product_id = now_product_id+1;
		mo.addAttribute("input_product_id", input_product_id);
		return "product-input";
	}
	
	//��ǰ��õ����Ʈ
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
	
	//��ǰ DB����
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

	//��ǰ����Ʈ ��з� ���
	@RequestMapping(value = "/product-out-total")
	public String productouttotal(HttpServletRequest request, Model mo) {
		int a = Integer.parseInt(request.getParameter("category1_id"));
		

		PService ps = sqlSession.getMapper(PService.class);
		ArrayList<ProductDTO> list = ps.productouttotal(a);
		
	
		mo.addAttribute("list", list);
		
		return "product-out";
	}
	
	//��ǰ����Ʈ �ߺз� ���
	@RequestMapping(value = "/product-out")
	public String productout(HttpServletRequest request, Model mo) {
		int a = Integer.parseInt(request.getParameter("category1_id"));
		int b = Integer.parseInt(request.getParameter("category2_id"));

		PService ps = sqlSession.getMapper(PService.class);
		ArrayList<ProductDTO> list = ps.productout(a, b);
		mo.addAttribute("list", list);
		
		return "product-out";
	}

	
	//��ǰ ��������
	@RequestMapping(value = "/product-detail")
	public String productdetail(HttpServletRequest request, ProductDTO pdto, Model mo) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		//�ش��ǰ�������
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productdetail(product_id);
		ps.productcount(product_id);
		mo.addAttribute("list", list);
		
		//��õ��ǰ���
		ArrayList<ProductDTO> recommend_list = ps.productrecommendout(product_id);
		mo.addAttribute("recommend_list", recommend_list);

		//�������
		Rservice rs = sqlSession.getMapper(Rservice.class);
		ReviewDTO rdto = rs.reviewlist(product_id);
		mo.addAttribute("rdto", rdto);
		
		return "product-detail";
	}
	
	//��ǰ �������� �Է�â
	@RequestMapping(value = "/product-modifyForm")
	public String productmodifyForm(HttpServletRequest request, Model mo) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		PService ps = sqlSession.getMapper(PService.class);
		list = ps.productmodifyForm(product_id);
		mo.addAttribute("list", list);
		return "product-modifyForm";
	}

	//��ǰ ��������
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
	
	//��ǰ����
	@RequestMapping(value = "/product-delete")
	public String productdelete(HttpServletRequest request) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		PService ps = sqlSession.getMapper(PService.class);
		ps.productdelete(product_id);
		
		return "redirect:product-out";
	}

}

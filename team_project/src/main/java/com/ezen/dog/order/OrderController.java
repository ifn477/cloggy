package com.ezen.dog.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.jni.OS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.ProductDTO;

@Controller
public class OrderController {

	@Autowired
	SqlSession sqlSession;
	
	ArrayList<OrderitemDTO> list = new ArrayList<OrderitemDTO>();
	ArrayList<OrderDTO> listo=new ArrayList<OrderDTO>();
	
	@RequestMapping(value = "/order",  method = { RequestMethod.GET, RequestMethod.POST })
	public String order(HttpServletRequest request,HttpSession session,Model mo) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();
		
		 String productIds = request.getParameter("productIds");
		  System.out.println("!!!!力前 "+ productIds);//
		
	
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
				  	System.out.println("历厘等 府胶飘" +list);
				  
		
		 
		return "order";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ordersave",method = RequestMethod.POST)
	public String orderitem(String add1,String add2,String add3,int totalprice,String userId,int shipping,int ordermemo,String phone,String addressee,HttpServletRequest request,Model mo) {
		
		
		
		String productIds = request.getParameter("productIds");
		String prices = request.getParameter("prices");
		String quantity = request.getParameter("quantity");
		System.out.println("!!!!力前 "+ productIds);//
		System.out.println("!!!!力前 "+ prices);//
		System.out.println("!!!!力前 "+ quantity);//
		
		 String[] ProductIdss = productIds.split(",");
		 String[] pricess = prices.split(",");
		 String[] quantities = quantity.split(",");
	
		 Oservice os = sqlSession.getMapper(Oservice.class);
		 int orderid = os.orderid();
		 
			for (int i = 0; i < ProductIdss.length; i++) {
		  	    int oproduct_id = Integer.parseInt(ProductIdss[i]);
		  	    int oprice = Integer.parseInt(pricess[i]);
		  	    int oquantity = Integer.parseInt(quantities[i]);
		  	    int savepoint = (int)((oprice*oquantity)*0.01);
		  	    
		  	   os.inserti(oproduct_id,oprice,oquantity,savepoint,orderid);
		  	}

		String address = add1+add2+add3;	
		os.inserto(address,totalprice,userId,shipping,ordermemo,phone,addressee,orderid);
		
	
		ArrayList<OrderitemDTO>list = os.ordercompleted(orderid, userId);
		mo.addAttribute("list", list);
		
		return "order-completed";
	}
	
	@RequestMapping(value = "/orderlistout")
	public String orderlistout(HttpServletRequest request ,Model mo)
	{

		String userId = request.getParameter("uesrId");
		System.out.println("##蜡历酒叼##"+userId);
	
		Oservice os = sqlSession.getMapper(Oservice.class);
		ArrayList<OrderDTO>listo  = os.orderlist(userId);
		mo.addAttribute("listo", listo);
		
		return "orderlistout";
	}
	
	@RequestMapping(value = "/order-detail")
	public String orderdetail(HttpServletRequest request,Model mo)
	{
		int order_id =Integer.parseInt(request.getParameter("order_id"));
		Oservice os=sqlSession.getMapper(Oservice.class);
		
		ArrayList<OrderDTO>list= os.orderdetail(order_id);
		mo.addAttribute("list", list);
		
		return "order-detail";
	}
	
	
	@RequestMapping(value = "/order-cancle")
	public String ordercancle(HttpServletRequest request,HttpSession session,Model mo)
	{
		int order_id =Integer.parseInt(request.getParameter("order_id"));
		Oservice os=sqlSession.getMapper(Oservice.class);
		
		os.ordercancle(order_id);
		
//		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
//		String userId = mdto.getUserId();  
//		System.out.println("蜡历酒捞叼"+userId);
//		ArrayList<OrderDTO>list= os.ordercancleout(userId);
//		mo.addAttribute("list", list);
		
		return "redirect:orderlistout";
	}
	
	
	
}

	


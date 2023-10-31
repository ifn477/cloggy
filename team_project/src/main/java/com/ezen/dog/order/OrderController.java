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

import com.ezen.dog.coupon.CouponDTO;
import com.ezen.dog.coupon.CouponService;
import com.ezen.dog.member.MemberDTO;
import com.ezen.dog.product.ProductDTO;

@Controller
public class OrderController {

	@Autowired
	SqlSession sqlSession;
	
	ArrayList<OrderitemDTO> list = new ArrayList<OrderitemDTO>();
	ArrayList<OrderDTO> listo=new ArrayList<OrderDTO>();
	
	@RequestMapping(value = "/order", method = { RequestMethod.GET, RequestMethod.POST })
	public String order(HttpServletRequest request, HttpSession session, Model mo) {
	    MemberDTO mdto = (MemberDTO) session.getAttribute("member");
	    String userId = mdto.getUserId();
	    
	    String productIds = request.getParameter("productIds");

	    String optionIds = request.getParameter("optionIds");  // �샃�뀡 �븘�씠�뵒 諛쏄린
	    
	    System.out.println("�젣�뭹 �븘�씠�뵒: " + productIds);
	    System.out.println("�샃�뀡 �븘�씠�뵒: " + optionIds);
	    
	    String[] ProductIdss = productIds.split(",");
	    String[] OptionIdss = optionIds.split(",");  // �샃�뀡 �븘�씠�뵒瑜� 諛곗뿴濡� 蹂��솚

	    
	    Oservice os = sqlSession.getMapper(Oservice.class);
	    ArrayList<OrderitemDTO> list = new ArrayList<>();
	    
	    for (int i = 0; i < ProductIdss.length; i++) {
	        int product_id = Integer.parseInt(ProductIdss[i]);

	        int option_id = Integer.parseInt(OptionIdss[i]); // �샃�뀡 �븘�씠�뵒 �궗�슜
	        list.add(os.orderitem(userId, product_id, option_id)); // �샃�뀡 �븘�씠�뵒�룄 �쟾�떖
	    }

	    mo.addAttribute("list", list);
	    System.out.println("���옣�맂 由ъ뒪�듃" + list);

	     // 荑좏룿
	    // 二쇰Ц �럹�씠吏��뿉 諛붾줈 �쓣�슦湲�

	    CouponService couponservice = sqlSession.getMapper(CouponService.class);
	    ArrayList<CouponDTO> couponlist = couponservice.couponlist(userId);
	    mo.addAttribute("couponlist", couponlist);

	    return "order";
	}
	
    @ResponseBody
    @RequestMapping(value = "/couponin", method = RequestMethod.POST)
    public String couponin(@RequestParam("totalprice") int totalprice, @RequestParam("discount") int discount, @RequestParam("shipping") int shipping) {
		int producttotalprice = (int) (totalprice - (totalprice * discount/100.0));
		int finaltotalprice = producttotalprice + shipping;
		return Integer.toString(finaltotalprice); // 결과를 문자열로 반환
    }
	
	@ResponseBody
	@RequestMapping(value = "/ordersave",method = RequestMethod.POST)
	public String orderitem(String add1,String add2,String add3,int totalprice,String userId,int shipping,int ordermemo,String phone,String addressee,int selectcoupon,HttpServletRequest request,Model mo) {

		String productIds = request.getParameter("productIds");
		String prices = request.getParameter("prices");
		String quantity = request.getParameter("quantity");
		String optid = request.getParameter("optid");

		System.out.println("!!!!�젣�뭹 "+ productIds);//
		System.out.println("!!!!�젣�뭹 "+ prices);//
		System.out.println("!!!!�젣�뭹 "+ quantity);//
		
		 String[] ProductIdss = productIds.split(",");
		 String[] pricess = prices.split(",");
		 String[] quantities = quantity.split(",");
		 String[] optids = optid.split(",");
	
		 Oservice os = sqlSession.getMapper(Oservice.class);
		 int orderid = os.orderid();
		 
			for (int i = 0; i < ProductIdss.length; i++) {
		  	    int oproduct_id = Integer.parseInt(ProductIdss[i]);
		  	    int ooptid = Integer.parseInt(optids[i]);
		  	    int oprice = Integer.parseInt(pricess[i]);
		  	    int oquantity = Integer.parseInt(quantities[i]);
		  	    int savepoint = (int)((oprice*oquantity)*0.01);
		  	    
		  	   os.inserti(oproduct_id,oprice,oquantity,savepoint,orderid,ooptid);
		  	}

		String address = add1+add2+add3;	
		os.inserto(address,totalprice,userId,shipping,ordermemo,phone,addressee,orderid,selectcoupon);
		
		ArrayList<OrderitemDTO>list = os.ordercompleted(orderid, userId);
		mo.addAttribute("list", list);
		
		return "order-completed";
	}
	
	@RequestMapping(value = "/orderlistout")
	public String orderlistout(HttpSession session ,Model mo)
	{

		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String userId = mdto.getUserId();

		System.out.println("##�쑀���븘�뵒##"+userId);
	
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
		
		
		return "redirect:orderlistout";
	}
	
	
	
}

	


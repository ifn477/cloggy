package com.ezen.dog.coupon;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ezen.dog.member.Mservice;

@Service
public class CouponScheduler {

		@Autowired
		SqlSession sqlSession;
		
		
		//매월 1일마다 업데이트!
		@Scheduled(cron = "0 0 0 * * ?")
		public void AutoCoupon() {
			AutodeleteCoupon();
			System.out.println("=========쿠폰 업데이트 완료!!!!=========");
		}
		
		public void AutodeleteCoupon() {
			 
			 CouponService couponservice =sqlSession.getMapper(CouponService.class);
			 couponservice.deletecoupon();
			 couponservice.userdeletecoupon();
		}
	
}

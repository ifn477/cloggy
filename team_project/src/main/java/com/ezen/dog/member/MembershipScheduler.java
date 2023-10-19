package com.ezen.dog.member;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class MembershipScheduler {

	@Autowired
	SqlSession sqlSession;
	
	
	//매월 1일마다 업데이트!
	@Scheduled(cron = "0 0 0 1 * ?")
	public void updateMembership() {
		updateMembershipByPurchaseAmount();
		System.out.println("=========업데이트 완료!!!!=========");
	}
	
	public void updateMembershipByPurchaseAmount() {
		 
		 Mservice ms =sqlSession.getMapper(Mservice.class);
		 ms.updateMembershipByPurchaseAmount();
		 	
	}
	
	
}

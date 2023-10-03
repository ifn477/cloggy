package com.ezen.dog.login;

import java.util.ArrayList;

import com.ezen.dog.member.MemberDTO;

public interface Lservice {
	public MemberDTO login(String userId,String password);
	public MemberDTO idsearchView(String userName, String email);
	public MemberDTO pwsearchView(String userId, String email);
	
	
}

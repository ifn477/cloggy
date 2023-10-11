package com.ezen.dog.login;

import java.util.ArrayList;

import com.ezen.dog.member.MemberDTO;

public interface Lservice {
	public MemberDTO login(String userId,String password);
	public MemberDTO idsearchView(String userName, String email);
	public MemberDTO pwsearchView(String userId, String email);
	public MemberDTO kakaologin(String nickname,String email);
	public MemberDTO naverlogin(String name,String email);
	public void cartUpdate(String cart_ckid, String userId);
}

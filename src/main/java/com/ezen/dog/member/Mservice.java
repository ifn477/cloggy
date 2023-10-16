package com.ezen.dog.member;

import java.util.ArrayList;

public interface Mservice {
	public void membersave(String userId,String password,String userName,String email,String phone,String address);
	public ArrayList<MemberDTO> memberout();
	public ArrayList<MemberDTO> membermodifyForm(String userId);
	public void membermodifyView(String userId,String password,String userName,String email,String phone,String address);
	public void memberdelete(String userId);
	public ArrayList<MemberDTO> membersearchViewId(String value);
	public ArrayList<MemberDTO> membersearchViewName(String userId);
	public ArrayList<MemberDTO> membersearchViewEmail(String userId);
	public int idcheck(String userId);
	public ArrayList<MemberDTO> memberinfo(String userId);
	public void memberdeleteSelf(String userId);
	public void kakaomember(String nicknaem, String email);
	public ArrayList<MemberDTO> membermodifySelfForm(String userId);
	public void membermodifySelfView(String userId,String password,String userName,String email,String phone,String address);
	public ArrayList<MemberDTO> memberinfoout(String userId);
}

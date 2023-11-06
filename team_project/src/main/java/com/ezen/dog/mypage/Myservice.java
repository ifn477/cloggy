package com.ezen.dog.mypage;

import java.util.ArrayList;


public interface Myservice {

	public ArrayList<MyDTO> ordercnt(String userId);
	public Integer cpcnt(String userId);
}

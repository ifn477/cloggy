
package com.ezen.dog.notice;

import java.util.ArrayList;

import com.ezen.dog.product.ProductPageDTO;

public interface Nservice {
	public void noticeinsert(String userId,String n_title,String n_content);
	public ArrayList<NoticeDTO> noticeout();
	public ArrayList<NoticeDTO> noticedetail(int n_number);
	public ArrayList<NoticeDTO> noticemodifydata(int n_number);
	public void noticemodifysave(int n_number,String userId,String n_title,String n_content);
	public void noticedelete(int n_number);
	public ArrayList<NoticeDTO> noticesearchqtitle(String npvalue);
	public ArrayList<NoticeDTO> noticesearchuserId(String npvalue);
	public ArrayList<NoticeDTO> noticesearchqcontent(String npvalue);
	public int cntnotice();
	public ArrayList<NoticeDTO> selectnotice(ProductPageDTO dto);
	
}

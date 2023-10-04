
package com.ezen.dog.qna;

import java.util.ArrayList;

public interface Qservice {
	public void qnainsert(String q_userId,String q_title,String q_content,boolean q_secret);
	public ArrayList<QnaDTO> qnaout();
	public ArrayList<QnaDTO> qnadetail(int q_number);
	public ArrayList<QnaDTO> qnareplyview(String userId);
	public void qnainsertreply(int q_number,String userId,String q_title,String q_content,int q_groups,int q_step,int q_indent);
	public void qnastepup(int q_groups,int q_step);
	public ArrayList<QnaDTO> qnamodifydata(int q_number);
	public void qnamodifysave(int q_number,String userId,String q_title,String q_content);
	public void qnadelete(int q_number);
	public ArrayList<QnaDTO> qnasearchqtitle(String spvalue);
	public ArrayList<QnaDTO> qnasearchuserId(String spvalue);
	public ArrayList<QnaDTO> qnasearchqcontent(String spvalue);
	
}

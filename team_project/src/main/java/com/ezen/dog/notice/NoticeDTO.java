package com.ezen.dog.notice;

public class NoticeDTO {
	int n_number;
	String userId,n_title,n_content,n_date;
	
	public NoticeDTO() {
		super();
	}
	public NoticeDTO(int n_number, String userId, String n_title, String n_content, String n_date) {
		super();
		this.n_number = n_number;
		this.userId = userId;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
	}
	public int getN_number() {
		return n_number;
	}
	public void setN_number(int n_number) {
		this.n_number = n_number;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	
	

}
package com.ezen.dog.qna;

public class QnaDTO {
	int q_number;
	String userId,q_title,q_content,q_date;
	int q_readcnt, q_groups,q_step,q_indent;
	boolean q_secret;
	
	public boolean isQ_secret() {
		return q_secret;
	}
	public void setQ_secret(boolean q_secret) {
		this.q_secret = q_secret;
	}
	public QnaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaDTO(int q_number, String userId, String q_title, String q_content, String q_date, int q_readcnt,
			int q_groups, int q_step, int q_indent) {
		super();
		this.q_number = q_number;
		this.userId = userId;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_readcnt = q_readcnt;
		this.q_groups = q_groups;
		this.q_step = q_step;
		this.q_indent = q_indent;
	}
	public int getQ_number() {
		return q_number;
	}
	public void setQ_number(int q_number) {
		this.q_number = q_number;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public int getQ_readcnt() {
		return q_readcnt;
	}
	public void setQ_readcnt(int q_readcnt) {
		this.q_readcnt = q_readcnt;
	}
	public int getQ_groups() {
		return q_groups;
	}
	public void setQ_groups(int q_groups) {
		this.q_groups = q_groups;
	}
	public int getQ_step() {
		return q_step;
	}
	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}
	public int getQ_indent() {
		return q_indent;
	}
	public void setQ_indent(int q_indent) {
		this.q_indent = q_indent;
	}

}
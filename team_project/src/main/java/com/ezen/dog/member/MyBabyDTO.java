package com.ezen.dog.member;

public class MyBabyDTO {
	String baby_photo, baby_name, baby_type, baby_birth;
	String babygender, bodytype;
	public MyBabyDTO(String baby_photo, String baby_name, String baby_type, String baby_birth, String babygender,
			String bodytype) {
		super();
		this.baby_photo = baby_photo;
		this.baby_name = baby_name;
		this.baby_type = baby_type;
		this.baby_birth = baby_birth;
		this.babygender = babygender;
		this.bodytype = bodytype;
	}
	public MyBabyDTO() {
		super();
	}
	public String getBaby_photo() {
		return baby_photo;
	}
	public void setBaby_photo(String baby_photo) {
		this.baby_photo = baby_photo;
	}
	public String getBaby_name() {
		return baby_name;
	}
	public void setBaby_name(String baby_name) {
		this.baby_name = baby_name;
	}
	public String getBaby_type() {
		return baby_type;
	}
	public void setBaby_type(String baby_type) {
		this.baby_type = baby_type;
	}
	public String getBaby_birth() {
		return baby_birth;
	}
	public void setBaby_birth(String baby_birth) {
		this.baby_birth = baby_birth;
	}
	public String getBabygender() {
		return babygender;
	}
	public void setBabygender(String babygender) {
		this.babygender = babygender;
	}
	public String getBodytype() {
		return bodytype;
	}
	public void setBodytype(String bodytype) {
		this.bodytype = bodytype;
	}
	
	
	
	
}

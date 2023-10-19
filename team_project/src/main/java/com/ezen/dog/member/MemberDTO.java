package com.ezen.dog.member;

public class MemberDTO {

	String userId;
	int auth_id;
	String password,userName;
	int age;
	String gender,email,phone,address,enroll_date,last_update,userInputKey;
	private boolean customCheck;

	public MemberDTO() {
		super();
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(int auth_id) {
		this.auth_id = auth_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(String enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getLast_update() {
		return last_update;
	}

	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}


	public String getUserInputKey() {
		return userInputKey;
	}


	public void setUserInputKey(String userInputKey) {
		this.userInputKey = userInputKey;
	}


	public boolean isCustomCheck() {
		return customCheck;
	}


	public void setCustomCheck(boolean customCheck) {
		this.customCheck = customCheck;
	}


	
	
	
	
	
}

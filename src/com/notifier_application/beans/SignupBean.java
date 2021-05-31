package com.notifier_application.beans;

public class SignupBean
{
	private String name;
	private String username;
	private long mobile_number;
	private String email_id;
	private String password;
	private String re_password;
	
	public SignupBean() {
	
	}
	
	public SignupBean(String name, String username, long mobile_number, String email_id, String password) {
		super();
		this.name = name;
		this.username = username;
		this.mobile_number = mobile_number;
		this.email_id = email_id;
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public long getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(long mobile_number) {
		this.mobile_number = mobile_number;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRe_password() {
		return re_password;
	}
	public void setRe_password(String re_password) {
		this.re_password = re_password;
	}
	
}

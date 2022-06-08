package com.spring.datatree.Vo;

import java.sql.Date;



public class UsersVo {
	private String userid;
	private String pw;
	private String name;
	private String phone;
	private Date regdate;
	
	
	public UsersVo() {}


	public UsersVo(String userid, String pw, String name, String phone, Date regdate) {
		super();
		this.userid = userid;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
	}

	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "UsersVo [userid=" + userid + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", regdate="
				+ regdate + "]";
	}


}

package com.myweb.domain;

import java.sql.Date;

public class MemberVO {
	private String email;
	private String pwd;
	private String name;
	private String nick;
	private String birth;
	private String gender;
	private String addr;
	private String tel;
	private Date regd8;
	private int grade;
	private int sratrcount;
	private int coupon;

	
	public MemberVO() {	}
	
	//insert
	public MemberVO(String email, String pwd, String name, String nick, String birth, String gender, String addr, String tel,
			int grade, int sratrcount) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.gender = gender;
		this.addr = addr;
		this.tel = tel;
		this.grade = grade;
		this.sratrcount = sratrcount;
	}
	
	//로그인
	public MemberVO(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}

	//list
	public MemberVO(String email, String name, String nick, Date regd8, int grade) {
		this.email = email;
		this.name = name;
		this.nick = nick;
		this.regd8 = regd8;
		this.grade = grade;
	}
	

	//detail
	public MemberVO(String email, String name, String nick, String birth, String gender, String addr, String tel, Date regd8,
			int grade, int sratrcount, int coupon) {
		this.email = email;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.gender = gender;
		this.addr = addr;
		this.tel = tel;
		this.regd8 = regd8;
		this.grade = grade;
		this.sratrcount = sratrcount;
		this.coupon = coupon;
	}
	
	//modify
	public MemberVO(String nick, String birth, String addr, String tel) {
		this.nick = nick;
		this.birth = birth;
		this.addr = addr;
		this.tel = tel;
	}
	
	//order
	public MemberVO(String name, String addr, String tel) {
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getRegd8() {
		return regd8;
	}
	public void setRegd8(Date regd8) {
		this.regd8 = regd8;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSratrcount() {
		return sratrcount;
	}
	public void setSratrcount(int sratrcount) {
		this.sratrcount = sratrcount;
	}

	public int getCoupon() {
		return coupon;
	}

	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	
}

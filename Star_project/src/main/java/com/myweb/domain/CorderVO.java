package com.myweb.domain;

import java.sql.Date;

public class CorderVO {
	private String email;
	private String name;
	private String addr;
	private String tel;
	private String cname;
	private int camount;
	private int cprice;
	private String cpay;
	private String coupon;
	private Date cbuyday;
	private String csize;
	private String hc;
	
	public CorderVO() {}

	
	
	public CorderVO(String cname, int cprice, String coupon, String csize, String hc) {
		this.cname = cname;
		this.cprice = cprice;
		this.coupon = coupon;
		this.csize = csize;
		this.hc = hc;
	}


	

	public CorderVO(String email, String cname, int camount, int cprice, String cpay,
			 String coupon, String csize, String hc, String addr,String name, String tel) {
		this.email = email;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.cname = cname;
		this.camount = camount;
		this.cprice = cprice;
		this.cpay = cpay;
		this.coupon = coupon;
		this.csize = csize;
		this.hc = hc;
	}



	public CorderVO(String email, String cname, int camount, int cprice, String cpay, String coupon, Date cbuyday,
			String csize, String hc) {
		this.email = email;
		this.cname = cname;
		this.camount = camount;
		this.cprice = cprice;
		this.cpay = cpay;
		this.coupon = coupon;
		this.cbuyday = cbuyday;
		this.csize = csize;
		this.hc = hc;
	}
	
	public CorderVO(String cname, int camount, int cprice, String cpay, Date cbuyday, String email) {
		this.cname = cname;
		this.camount = camount;
		this.cprice = cprice;
		this.cpay = cpay;
		this.cbuyday = cbuyday;
		this.email = email;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
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

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getCamount() {
		return camount;
	}

	public void setCamount(int camount) {
		this.camount = camount;
	}

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public String getCpay() {
		return cpay;
	}

	public void setCpay(String cpay) {
		this.cpay = cpay;
	}

	public String getcoupon() {
		return coupon;
	}

	public void setcoupon(String coupon) {
		this.coupon = coupon;
	}

	public Date getCbuyday() {
		return cbuyday;
	}

	public void setCbuyday(Date cbuyday) {
		this.cbuyday = cbuyday;
	}

	public String getCsize() {
		return csize;
	}

	public void setCsize(String csize) {
		this.csize = csize;
	}

	public String getHc() {
		return hc;
	}

	public void setHc(String hc) {
		this.hc = hc;
	}

	@Override
	public String toString() {
		return "CoffeeVO [email=" + email + ", cname=" + cname + ", camount=" + camount + ", cprice=" + cprice
				+ ", cpay=" + cpay + ", coupon=" + coupon + ", cbuyday=" + cbuyday + ", csize=" + csize + ", hc=" + hc
				+ "]";
	}
	
	
}

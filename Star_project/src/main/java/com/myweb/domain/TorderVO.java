package com.myweb.domain;

import java.sql.Date;

public class TorderVO {
	private int tamount;
	private String name;
	private String addr;
	private String tel;
	private String email;
	private String tname;
	private String timg;
	private int tallprice;
	private String tpay;
	private Date tbuyday;
	
	public TorderVO() {}
	
	
	//insert
	public TorderVO(int tamount, String name, String addr, String tel, String email, String tname,
			int tallprice, String tpay) {
		this.tamount = tamount;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.email = email;
		this.tname = tname;
		this.tallprice = tallprice;
		this.tpay = tpay;
	}
	
	//list
	public TorderVO(int tamount, String tname, int tallprice, String tpay, Date tbuyday, String email) {
		this.tamount = tamount;
		this.tname = tname;
		this.tallprice = tallprice;
		this.tpay = tpay;
		this.tbuyday = tbuyday;
		this.email = email;
	}
	
	
	public Date getTbuyday() {
		return tbuyday;
	}
	public void setTbuyday(Date tbuyday) {
		this.tbuyday = tbuyday;
	}
	public int getTamount() {
		return tamount;
	}
	public void setTamount(int tamount) {
		this.tamount = tamount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTimg() {
		return timg;
	}
	public void setTimg(String timg) {
		this.timg = timg;
	}
	public int getTallprice() {
		return tallprice;
	}
	public void setTallprice(int tallprice) {
		this.tallprice = tallprice;
	}
	public String getTpay() {
		return tpay;
	}
	public void setTpay(String tpay) {
		this.tpay = tpay;
	}
	
}

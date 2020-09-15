package com.myweb.domain;


public class TbagVO {
	
	private int tbagno;
	private String email;
	private String tname;
	private int tprice;
	private int tamount;
	private String timg;
	private int tto;
	private int price;
	
	public TbagVO(){}

	// 주문
	public TbagVO(String email, String tname, int tprice, int tamount, String timg) {
		this.email = email;
		this.tname = tname;
		this.tprice = tprice;
		this.tamount = tamount;
		this.timg = timg;
	}
	
	// 리스트
	public TbagVO(int tbagno, String email, String tname, int tprice, int tamount, String timg, int tto, int price) {
		this.tbagno = tbagno;
		this.email = email;
		this.tname = tname;
		this.tprice = tprice;
		this.tamount = tamount;
		this.timg = timg;
		this.tto = tto;
		this.price = price;
	}
	
	//결제
	public TbagVO(int tbagno, String tname, int tprice, int tamount) {
		this.tbagno = tbagno;
		this.tname = tname;
		this.tprice = tprice;
		this.tamount = tamount;
	}
	
	// 수정
	public TbagVO(int tbagno, int tprice, int tamount) {
		this.tbagno = tbagno;
		this.tprice = tprice;
		this.tamount = tamount;
	}

	
	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}

	public int getTto() {
		return tto;
	}

	public void setTto(int tto) {
		this.tto = tto;
	}

	public int getTbagno() {
		return tbagno;
	}

	public void setTbagno(int tbagno) {
		this.tbagno = tbagno;
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

	public int getTprice() {
		return tprice;
	}

	public void setTprice(int tprice) {
		this.tprice = tprice;
	}

	public int getTamount() {
		return tamount;
	}

	public void setTamount(int tamount) {
		this.tamount = tamount;
	}

	public String getTimg() {
		return timg;
	}

	public void setTimg(String timg) {
		this.timg = timg;
	}
	
	
	
}

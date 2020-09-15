package com.myweb.domain;


public class TumblerVO {
	private int tcount;
	private String tcontent;
	private String timg;
	private String tname;
	private int tprice;
	private int ttotal;

	
	public TumblerVO() {}

	// 상품 등록
	public TumblerVO(String tcontent, String timg, String tname, int tprice, int ttotal) {
		this.tcontent = tcontent;
		this.timg = timg;
		this.tname = tname;
		this.tprice = tprice;
		this.ttotal = ttotal;
		
	}

	// 리스트
	public TumblerVO(String tcontent, String timg, String tname) {
		this.tcontent = tcontent;
		this.timg = timg;
		this.tname = tname;
	}


	public TumblerVO(int tcount, String tcontent, String timg, String tname, int tprice, int ttotal) {
		this.tcount = tcount;
		this.tcontent = tcontent;
		this.timg = timg;
		this.tname = tname;
		this.tprice = tprice;
		this.ttotal = ttotal;
	}

	

	public int getTcount() {
		return tcount;
	}

	public void setTcount(int tcount) {
		this.tcount = tcount;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getTimg() {
		return timg;
	}

	public void setTimg(String timg) {
		this.timg = timg;
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

	public int getTtotal() {
		return ttotal;
	}

	public void setTtotal(int ttotal) {
		this.ttotal = ttotal;
	}
	
	
}

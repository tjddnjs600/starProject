package com.myweb.domain;

public class CoffeeVO {
	private String cname;
	private int cprice;
	private String ccontent;
	private String cimg;
	private int ctotalcount;
	private String category;
	private String hc;
	
	public CoffeeVO() {}
	
	
	
	public CoffeeVO(String cname, int cprice, String ccontent, String cimg, String category, String hc) {
		this.cname = cname;
		this.cprice = cprice;
		this.ccontent = ccontent;
		this.cimg = cimg;
		this.category = category;
		this.hc = hc;
	}
	
	public CoffeeVO(String cname, String cimg) {
		this.cname = cname;
		this.cimg = cimg;
	}

	public CoffeeVO(String cname, int cprice, String ccontent, String cimg, int ctotalcount) {
		this.cname = cname;
		this.cprice = cprice;
		this.ccontent = ccontent;
		this.cimg = cimg;
		this.ctotalcount = ctotalcount;
	}

	public CoffeeVO(String cname, int cprice, String ccontent, String cimg, int ctotalcount, String category,
			String hc) {
		this.cname = cname;
		this.cprice = cprice;
		this.ccontent = ccontent;
		this.cimg = cimg;
		this.ctotalcount = ctotalcount;
		this.category = category;
		this.hc = hc;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public int getCtotalcount() {
		return ctotalcount;
	}

	public void setCtotalcount(int ctotalcount) {
		this.ctotalcount = ctotalcount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHc() {
		return hc;
	}

	public void setHc(String hc) {
		this.hc = hc;
	}

	@Override
	public String toString() {
		return "CoffeeVO [cname=" + cname + ", cprice=" + cprice + ", ccontent=" + ccontent + ", cimg=" + cimg
				+ ", ctotalcount=" + ctotalcount + ", category=" + category + ", hc=" + hc + "]";
	}
	
	
}

package com.myweb.domain;

import java.util.List;

public class CbagVO {
	private int cbagno;
	private String email;
	private String cname;
	private int cprice;
	private int camount;
	private String csize;
	private String cimg;
	private String hc;
	
	private List<CbagVO> inputArr;
	
	public CbagVO() {}

	public CbagVO(int cbagno, String email, String cname, int cprice, int camount, String csize, String cimg,
			String hc) {
		this.cbagno = cbagno;
		this.email = email;
		this.cname = cname;
		this.cprice = cprice;
		this.camount = camount;
		this.csize = csize;
		this.cimg = cimg;
		this.hc = hc;
	}



	public CbagVO(String email, String cname, int cprice, int camount, String csize, String cimg, String hc) {
		this.email = email;
		this.cname = cname;
		this.cprice = cprice;
		this.camount = camount;
		this.csize = csize;
		this.cimg = cimg;
		this.hc = hc;
	}

	public CbagVO(String cname, int cprice, int camount, String csize, String cimg) {
		this.cname = cname;
		this.cprice = cprice;
		this.camount = camount;
		this.csize = csize;
		this.cimg = cimg;
	}

	public CbagVO(int cbagno, String email, String cname, int cprice, int camount, String csize, String cimg) {
		this.cbagno = cbagno;
		this.email = email;
		this.cname = cname;
		this.cprice = cprice;
		this.camount = camount;
		this.csize = csize;
		this.cimg = cimg;
	}
	

	
	
	public CbagVO(int cbagno, String cname, int cprice, int camount, String csize, String cimg, String hc) {
		this.cbagno = cbagno;
		this.cname = cname;
		this.cprice = cprice;
		this.camount = camount;
		this.csize = csize;
		this.cimg = cimg;
		this.hc = hc;
	}

	public CbagVO(String cname, int cprice, String csize, String hc, int cbagno) {
		this.cname = cname;
		this.cprice = cprice;
		this.csize = csize;
		this.hc = hc;
		this.cbagno = cbagno;
	}

	public List<CbagVO> getInputArr() {
		return inputArr;
	}

	public void setInputArr(List<CbagVO> inputArr) {
		this.inputArr = inputArr;
	}

	public int getCbagno() {
		return cbagno;
	}

	public void setCbagno(int cbagno) {
		this.cbagno = cbagno;
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

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public int getCamount() {
		return camount;
	}

	public void setCamount(int camount) {
		this.camount = camount;
	}

	public String getCsize() {
		return csize;
	}

	public void setCsize(String csize) {
		this.csize = csize;
	}
	
	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public String getHc() {
		return hc;
	}

	public void setHc(String hc) {
		this.hc = hc;
	}

	@Override
	public String toString() {
		return "CbagVO [cbagno=" + cbagno + ", email=" + email + ", cname=" + cname + ", cprice=" + cprice
				+ ", camount=" + camount + ", csize=" + csize + ", cimg=" + cimg + ", hc=" + hc + "]";
	}
	
}

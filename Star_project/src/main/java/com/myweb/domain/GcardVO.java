package com.myweb.domain;

import java.util.List;

public class GcardVO {
	private String gnum;
	private int gprice;
	private String gname;
	private String email;
	private List<GcardVO> clist;
	
	public GcardVO() { }
	
	
	//info
	public GcardVO(String gname, String email) {
		this.gname = gname;
		this.email = email;
	}
	
	//charge or transfer
	public GcardVO(String gname, String email, int gprice) {
		this.gname = gname;
		this.email = email;
		this.gprice = gprice;
	}
	
	//infoList
	public GcardVO(String gnum, int gprice, String gname) {
		this.gnum = gnum;
		this.gprice = gprice;
		this.gname = gname;
	}
	
	//nameList
	public GcardVO(String gname) {
		this.gname = gname;
	}


	//insert
	public GcardVO(String gnum, String gname, String email) {
		this(gnum,gname);
		this.email = email;
	}
	
	
	public String getGnum() {
		return gnum;
	}
	public void setGnum(String gnum) {
		this.gnum = gnum;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


	public List<GcardVO> getClist() {
		return clist;
	}


	public void setClist(List<GcardVO> clist) {
		this.clist = clist;
	}
	
	
	
}

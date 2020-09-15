package com.myweb.domain;


public class Criterion {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	private int startlist;
	

	public Criterion() {
		this(1,8);
	}

	public Criterion(int amount, int pageNum, int startlist) {
		this.amount = amount;
		this.pageNum = pageNum;
		this.startlist = startlist;
	}
	
	public Criterion(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criterion(int pageNum, int amount, String type, String keyword, int startlist) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.type = type;
		this.keyword = keyword;
		this.startlist = startlist;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStartlist() {
		return startlist;
	}

	public void setStartlist(int startlist) {
		this.startlist = startlist;
	}

	
}

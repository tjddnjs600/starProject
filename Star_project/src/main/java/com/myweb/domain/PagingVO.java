package com.myweb.domain;


public class PagingVO {
	private int totalCount;
	private int firstPage;
	private int lastPage;
	private boolean prev, next;
	private Criterion cri;
	
	public PagingVO() {}

	public PagingVO(int totalCount, Criterion cri) {
		this.totalCount = totalCount;
		this.cri = cri;
		
		this.lastPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.firstPage = lastPage -9;
		
		int realEndNum = (int)(Math.ceil(totalCount/8.0));
		
		if(this.lastPage >= realEndNum) {
			lastPage = realEndNum;
		}
		
		this.prev = firstPage > 1;
		this.next = this.lastPage < realEndNum;
		
	}
	

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	
	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criterion getCri() {
		return cri;
	}

	public void setCri(Criterion cri) {
		this.cri = cri;
	}
	
	
}

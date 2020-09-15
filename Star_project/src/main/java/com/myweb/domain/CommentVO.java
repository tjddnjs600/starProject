package com.myweb.domain;

import java.util.Date;

public class CommentVO {
	private int cno;
	private int bno;
	private String writer;
	private String comm;
	private Date cregd8;
	private Date cmodd8;
	
	public CommentVO() {}
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public Date getCregd8() {
		return cregd8;
	}
	public void setCregd8(Date cregd8) {
		this.cregd8 = cregd8;
	}
	public Date getCmodd8() {
		return cmodd8;
	}
	public void setCmodd8(Date cmodd8) {
		this.cmodd8 = cmodd8;
	}
	
	
}

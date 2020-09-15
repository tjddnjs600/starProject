package com.myweb.domain;

import java.util.Date;

public class BoardVO {
	private int bno;  
	private String email; // 작성자
	private int viewcount; // 조회수
	private Date bregd8;
	private Date bmodd8;
	private String bcontent;  // 내용
	private int cmtcnt;  // 댓글수
	private int noticenum;
	private String btitle; // 공지사항 or 게시글
	private String b_file;  // 첨부파일

	public BoardVO() {}


	// 등록, 삭제
	public BoardVO(String email, String bcontent, String b_file, String btitle, int noticenum) {
		this.email = email;
		this.bcontent = bcontent;
		this.b_file = b_file;
		this.btitle = btitle;
		this.noticenum = noticenum;
	}

	
	// 리스트
	public BoardVO(int bno, String email, int viewcount, Date bmodd8, String bcontent, int cmtcnt, String b_file, int noticenum, String btitle) {
		this.bno = bno;
		this.email = email;
		this.viewcount = viewcount;
		this.bmodd8 = bmodd8;
		this.bcontent = bcontent;
		this.cmtcnt = cmtcnt;
		this.b_file = b_file;
		this.noticenum = noticenum;
		this.btitle = btitle;
	}
	
	// 업데이트
	public BoardVO(int bno, String email, String bcontent, String b_file, String btitle) {
		this.bno = bno;
		this.email = email;
		this.bcontent = bcontent;
		this.b_file = b_file;
		this.btitle = btitle;
	}

	

	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public Date getBregd8() {
		return bregd8;
	}

	public void setBregd8(Date bregd8) {
		this.bregd8 = bregd8;
	}

	public Date getBmodd8() {
		return bmodd8;
	}

	public void setBmodd8(Date bmodd8) {
		this.bmodd8 = bmodd8;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getCmtcnt() {
		return cmtcnt;
	}

	public void setCmtcnt(int cmtcnt) {
		this.cmtcnt = cmtcnt;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public int getNoticenum() {
		return noticenum;
	}

	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}
	
	
}

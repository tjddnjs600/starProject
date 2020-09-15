package com.myweb.domain;

import java.util.List;

public class CommentDTO {
	private int cmtCnt; // 댓글 총 갯수
	private List<CommentVO> clist; //데이터베이스에서 가져온 댓글 리스트
	
	public CommentDTO() {}
	public CommentDTO(int cmtCnt,List<CommentVO> clist) {
		this.cmtCnt = cmtCnt;
		this.clist = clist;
	}
	public int getCmtCnt() {
		return cmtCnt;
	}
	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}
	public List<CommentVO> getClist() {
		return clist;
	}
	public void setClist(List<CommentVO> clist) {
		this.clist = clist;
	}	
}

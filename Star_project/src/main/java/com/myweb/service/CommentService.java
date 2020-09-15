package com.myweb.service;

import java.util.List;

import com.myweb.domain.CommentDTO;
import com.myweb.domain.CommentVO;
import com.myweb.domain.Criterion;

public interface CommentService {
	public int write(CommentVO cvo);
	public CommentDTO getList(Criterion cri, int bno);
	public int modify(CommentVO cvo);
	public int delete(int cno);
	
}

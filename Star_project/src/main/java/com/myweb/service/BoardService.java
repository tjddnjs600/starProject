package com.myweb.service;

import java.util.List;

import com.myweb.domain.BoardVO;
import com.myweb.domain.Criterion;

public interface BoardService {

	public int write(BoardVO bvo);
	public List<BoardVO> list(Criterion cri);
	public BoardVO getBoard(int bno);
	public int modify(BoardVO bvo);
	public int remove(int bno);
	public int totalCount(Criterion cri);
	
}

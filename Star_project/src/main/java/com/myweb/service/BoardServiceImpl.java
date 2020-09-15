package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.BoardVO;
import com.myweb.domain.Criterion;
import com.myweb.persistence.BoardDAO;
import com.myweb.persistence.CommentDAO;

@Service
public class BoardServiceImpl implements BoardService{
	private static Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);


	@Inject
	BoardDAO bdao;
	
	@Inject
	CommentDAO cdao;
	
	@Override
	public int write(BoardVO bvo) {
		return bdao.starBorInsert(bvo);
	}

	@Override
	public List<BoardVO> list(Criterion cri) {
		return bdao.starBorselectList(cri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO getBoard(int bno) {
		bdao.starBorViewcount(bno);
		return bdao.starBorDetail(bno);
	}
	
	@Override
	public int modify(BoardVO bvo) {
		return bdao.starBorupdate(bvo);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public int remove(int bno) {
		cdao.deletecomment(bno);
		return bdao.starBordelete(bno);
	}

	@Override
	public int totalCount(Criterion cri) {
		return bdao.starBorselectTotal(cri);
	}

	
}

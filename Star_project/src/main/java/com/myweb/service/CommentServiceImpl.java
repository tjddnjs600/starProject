package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CommentDTO;
import com.myweb.domain.CommentVO;
import com.myweb.domain.Criterion;
import com.myweb.persistence.BoardDAO;
import com.myweb.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService{
	private static Logger log = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Inject
	CommentDAO cdao;
	
	@Inject
	BoardDAO bdao;
	
	

	@Override
	public int write(CommentVO cvo) {
		return cdao.starCominsert(cvo);
	}

	@Override
	public CommentDTO getList(Criterion cri, int bno) {
		List<CommentVO> list = cdao.starComselectList(cri,bno);
		int cmtCnt = cdao.starComselectTotal(bno);
		CommentDTO cdto = new CommentDTO(cmtCnt, list);
		return cdto;
	}

	@Override
	public int modify(CommentVO cvo) {
		return cdao.starComupdate(cvo);
	}

	@Override
	public int delete(int cno) {
		return cdao.starComdelete(cno);
	}
}

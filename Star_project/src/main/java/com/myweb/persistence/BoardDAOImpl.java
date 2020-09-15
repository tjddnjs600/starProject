package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.BoardVO;
import com.myweb.domain.Criterion;

@Repository
public class BoardDAOImpl implements BoardDAO{
	private static Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);
	private static String ns="BoardMapper.";

	@Inject
	SqlSession sql;
	
	@Override
	public int starBorInsert(BoardVO bvo) {
		return sql.insert(ns+"write",bvo);
	}

	@Override
	public List<BoardVO> starBorselectList(Criterion cri) {
		return sql.selectList(ns+"list", cri);
	}

	@Override
	public BoardVO starBorDetail(int bno) {
		return sql.selectOne(ns+"detail", bno);
	}
	
	@Override
	public int starBorupdate(BoardVO bvo) {
		return sql.update(ns+"modify", bvo);
	}

	@Override
	public int starBordelete(int bno) {
		return sql.delete(ns+"remove", bno);
	}

	@Override
	public int starBorselectTotal(Criterion cri) {
		return sql.selectOne(ns+"totalCount", cri);
	}

	@Override
	public int starBorViewcount(int bno) {
		return sql.update(ns+"viewCount", bno);
	}

	
}

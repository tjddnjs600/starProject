package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CommentVO;
import com.myweb.domain.Criterion;

@Repository
public class CommentDAOImpl implements CommentDAO{
	private static Logger log = LoggerFactory.getLogger(CommentDAOImpl.class);
	private static String ns = "CommentMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int starCominsert(CommentVO cvo) {
		return sql.insert(ns+"add", cvo);
	}

	@Override
	public List<CommentVO> starComselectList(Criterion cri, int bno) {
		Map<String, Object> map = new HashMap<>();
		map.put("cri",cri);
		map.put("bno", bno);
		return sql.selectList(ns+"list", map);
	}

	@Override
	public int starComupdate(CommentVO cvo) {
		return sql.update(ns+"modify", cvo);
	}

	@Override
	public int starComdelete(int cno) {
		return sql.delete(ns+"delete", cno);
	}

	@Override
	public int starComselectTotal(int pno) {
		return sql.selectOne(ns+"total", pno);
	}

	@Override
	public int deletecomment(int bno) {
		return sql.delete(ns+"deletecomment", bno);
	}
}

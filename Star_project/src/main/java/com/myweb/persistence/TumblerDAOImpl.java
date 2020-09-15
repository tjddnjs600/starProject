package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.TumblerVO;

@Repository
public class TumblerDAOImpl implements TumblerDAO{
	private static Logger log = LoggerFactory.getLogger(TumblerDAOImpl.class);
	private static String ns ="TumblerMapper.";
	
	
	@Inject
	SqlSession sql;

	
	@Override
	public int starTumInsert(TumblerVO tvo) {
		return sql.insert(ns+"add", tvo);
	}

	@Override
	public List<TumblerVO> starTumList(Criterion cri) {
		return sql.selectList(ns+"list", cri);
	}

	@Override
	public TumblerVO starTumDetail(String tname) {
		return sql.selectOne(ns+"detail", tname);
	}

	@Override
	public int starTumModify(TumblerVO tvo) {
		return sql.update(ns+"modify", tvo);
	}

	@Override
	public int starTumRemove(String tname) {
		return sql.delete(ns+"remove", tname);
	}

	@Override
	public int starTumTotal(Criterion cri) {
		return sql.selectOne(ns+"totalCount", cri);
	}

	@Override
	public int starTumTcountMod(String tname, int tamount) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tname", tname);
		map.put("tamount", tamount);
		return sql.update(ns+"tamountMod", map);
	}
}

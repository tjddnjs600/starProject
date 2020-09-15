package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CorderVO;
import com.myweb.domain.Criterion;

@Repository
public class CorderDAOImpl implements CorderDAO{
	private static Logger log = LoggerFactory.getLogger(CorderDAOImpl.class);
	private static String ns = "CorderMapper.";

	@Inject
	SqlSession sql;
	
	@Override
	public int StarCorinsert(CorderVO covo) {
		return sql.insert(ns+"order", covo);
	}

	@Override
	public List<CorderVO> StarCorlist(Criterion cri, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("email", email);
		return sql.selectList(ns+"list", map);
	}

	@Override
	public int StarCordelete(int cono) {
		return sql.delete(ns+"cancel", cono);
	}

	@Override
	public int StarCorTotalCount(String email) {
		return sql.selectOne(ns+"corderTotalCount", email);
	}
}

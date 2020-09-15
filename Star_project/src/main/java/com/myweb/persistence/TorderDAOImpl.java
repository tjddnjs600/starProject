package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.TorderVO;

@Repository
public class TorderDAOImpl implements TorderDAO{
	private static Logger log = LoggerFactory.getLogger(TorderDAOImpl.class);
	private static String ns = "TorderMapper.";

	@Inject
	SqlSession sql;
	
	@Override
	public int starTumOrderInsert(TorderVO tovo) {
		return sql.insert(ns+"torderInsert", tovo);
	}

	@Override
	public List<TorderVO> starTumOrderList(Criterion cri, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("email", email);
		return sql.selectList(ns+"torderList", map);
	}

	@Override
	public int starTumTotalCount(String email) {
		return sql.selectOne(ns+"torderTotalCount", email);
	}
}

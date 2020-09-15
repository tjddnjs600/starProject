package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.TbagVO;

@Repository
public class TbagDAOImpa implements TbagDAO{
	private static Logger log = LoggerFactory.getLogger(TbagDAOImpa.class);
	private static String ns="TbagMapper.";

	@Inject
	SqlSession sql;
	
	@Override
	public int starTbagInsert(TbagVO tbvo) {
		return sql.insert(ns+"addTb", tbvo);
	}

	@Override
	public List<TbagVO> starTbagList(String email) {
		return sql.selectList(ns+"listTb", email);
	}

	@Override
	public int starTbagUpdate(TbagVO tbvo) {
		return sql.update(ns+"updateTb", tbvo);
	}

	@Override
	public int starTbagDelete(int tbagno) {
		return sql.delete(ns+"deleteTb",tbagno);
	}

	@Override
	public int starTbagTotal(Criterion cri) {
		return 0;
	}
}

package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CbagVO;

@Repository
public class CbagDAOImpl implements CbagDAO{
	private static Logger log = LoggerFactory.getLogger(CbagDAOImpl.class);
	private static String ns="CbagMapper.";

	@Inject
	SqlSession sql;
	
	
	@Override
	public int StarCbagadd(CbagVO cbvo) {
		return sql.insert(ns+"cbadd", cbvo);
	}

	@Override
	public List<CbagVO> StarCbaglist(String email) {
		return sql.selectList(ns+"cblist", email);
	}

	@Override
	public int StarCbagdel(int cbagno) {
		return sql.delete(ns+"cbdel", cbagno);
	}

	@Override
	public int StarCbagAlldel(String email) {
		return sql.delete(ns+"cballdel", email);
	}

	@Override
	public int StarCbagmod(CbagVO cbvo) {
		return sql.update(ns+"cbmod", cbvo);
	}

	@Override
	public CbagVO starCbagdetail(int cbagno) {
		return sql.selectOne(ns+"cbdetail", cbagno);
	}

	@Override
	public CbagVO StarCplist(int cbagno) {
		return sql.selectOne(ns+"cplist", cbagno);
	}
}

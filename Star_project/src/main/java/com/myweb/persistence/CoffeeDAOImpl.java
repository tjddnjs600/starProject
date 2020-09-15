package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CoffeeVO;

@Repository
public class CoffeeDAOImpl implements CoffeeDAO{
	private static Logger log = LoggerFactory.getLogger(CoffeeDAOImpl.class);
	private static String ns="CoffeeMapper.";
	

	@Inject
	SqlSession sql;
	
	
	@Override
	public int StarCofinsert(CoffeeVO cfvo) {
		return sql.insert(ns+"insert", cfvo);
	}

	@Override
	public List<CoffeeVO> StarCoflist(String category) {
		return sql.selectList(ns+"clist", category);
	}

	@Override
	public CoffeeVO StarCofdetail(String cname) {
		return sql.selectOne(ns+"cdetail", cname);
	}

	@Override
	public int StarCofupdate(CoffeeVO cfvo) {
		return sql.update(ns+"cupdate", cfvo);
	}

	@Override
	public int StarCofdelete(String cname) {
		return sql.delete(ns+"cdelete", cname);
	}

	@Override
	public int StarCofTotalcount(String cname) {
		return sql.update(ns+"ctotalcount", cname);
	}

	@Override
	public List<CoffeeVO> StarCofalllist() {
		return sql.selectList(ns+"alllist");
	}
}

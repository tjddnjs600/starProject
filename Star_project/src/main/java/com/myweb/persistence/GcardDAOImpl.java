package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.GcardVO;

@Repository
public class GcardDAOImpl implements GcardDAO{
	private static Logger log = LoggerFactory.getLogger(GcardDAOImpl.class);
	private static String ns = "GcardMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int starCardinsert(GcardVO gvo) {
		return sql.insert(ns+"insert", gvo);
	}

	@Override
	public List<GcardVO> starCardSelectInfoList(String email) {
		return sql.selectList(ns+"cardList", email);
	}


	@Override
	public List<GcardVO> starCardGnameList(String email) {
		return sql.selectList(ns+"nameList", email);
	}

	@Override
	public GcardVO starCardGetPrice(GcardVO gvo) {
		return sql.selectOne(ns+"cardInfo", gvo);
	}

	@Override
	public int starCardUpPrice(GcardVO gvo) {
		return sql.update(ns+"charge", gvo);
	}

	@Override
	public void starCardRemoveCard(GcardVO gvo) {
		sql.delete(ns+"rmCard", gvo);
	}

	@Override
	public int starCardTransfer(GcardVO gvo) {
		return sql.update(ns+"charge", gvo);
	}

	@Override
	public int starCardPayPrice(GcardVO gvo) {
		return sql.update(ns+"gcardPay", gvo);
	}

}

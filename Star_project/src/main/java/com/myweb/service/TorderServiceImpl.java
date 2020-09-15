package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.Criterion;
import com.myweb.domain.TorderVO;
import com.myweb.domain.TumblerVO;
import com.myweb.persistence.TorderDAO;
import com.myweb.persistence.TumblerDAO;

@Service
public class TorderServiceImpl implements TorderService{
	private static Logger log = LoggerFactory.getLogger(TorderServiceImpl.class);
	
	@Inject
	TorderDAO todao;
	
	@Inject
	TumblerDAO tdao;

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public int insertTorder(TorderVO tovo) {
		tdao.starTumTcountMod(tovo.getTname(), tovo.getTamount());
		return todao.starTumOrderInsert(tovo);
	}

	@Override
	public List<TorderVO> getBuyList(Criterion cri, String email) {
		return todao.starTumOrderList(cri,email);
	}

	@Override
	public int torderCount(String email) {
		return todao.starTumTotalCount(email);
	}
}

package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.GcardVO;
import com.myweb.persistence.GcardDAO;

@Service
public class GcardServiceImpl implements GcardService{
	private static Logger log = LoggerFactory.getLogger(GcardServiceImpl.class);
	
	@Inject
	GcardDAO gdao;

	@Override
	public int cardInsert(GcardVO gvo) {
		return gdao.starCardinsert(gvo);
	}

	@Override
	public List<GcardVO> getCardList(String email) {
		return gdao.starCardSelectInfoList(email);
	}


	@Override
	public List<GcardVO> gNameList(String email) {
		return gdao.starCardGnameList(email);
	}

	@Override
	public GcardVO getPrice(GcardVO gvo) {
		return gdao.starCardGetPrice(gvo);
	}

	@Override
	public int charge(GcardVO gvo) {
		return gdao.starCardUpPrice(gvo);
	}

	@Override
	public void removeCard(GcardVO gvo) {
		gdao.starCardRemoveCard(gvo);
	}

	@Override
	public int transferCard(GcardVO gvo) {
		return gdao.starCardTransfer(gvo);
	}

	@Override
	public int payCard(GcardVO gvo) {
		return gdao.starCardPayPrice(gvo);
	}

}

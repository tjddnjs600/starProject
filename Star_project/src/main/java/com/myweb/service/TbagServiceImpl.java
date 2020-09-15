package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.TbagVO;
import com.myweb.persistence.TbagDAO;

@Service
public class TbagServiceImpl implements TbagService{
	private static Logger log = LoggerFactory.getLogger(TbagServiceImpl.class);
	
	@Inject
	TbagDAO tbdao;
	
	
	@Override
	public int addTb(TbagVO tbvo) {
		return tbdao.starTbagInsert(tbvo);
	}

	@Override
	public List<TbagVO> list(String email) {
		return tbdao.starTbagList(email);
	}

	@Override
	public int modify(TbagVO tbvo) {
		return tbdao.starTbagUpdate(tbvo);
	}

	@Override
	public int remove(int tbagno) {
		return tbdao.starTbagDelete(tbagno);
	}
}

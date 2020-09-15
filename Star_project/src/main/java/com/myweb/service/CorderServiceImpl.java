package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.CorderVO;
import com.myweb.domain.Criterion;
import com.myweb.persistence.CbagDAO;
import com.myweb.persistence.CorderDAO;

@Service
public class CorderServiceImpl implements CorderService{
	private static Logger log = LoggerFactory.getLogger(CorderServiceImpl.class);

	@Inject
	CorderDAO codao;
	
	@Inject
	CbagDAO cbdao;
	
	@Override
	public int orderCof(CorderVO covo) {
		return codao.StarCorinsert(covo);
	}

	@Override
	public List<CorderVO> listCorder(Criterion cri, String email) {
		return codao.StarCorlist(cri, email);
	}
	
	
	@Override
	public int deleteCorder(int cono) {
		return codao.StarCordelete(cono);
	}

	@Override
	public int corderCount(String email) {
		return codao.StarCorTotalCount(email);
	}
}

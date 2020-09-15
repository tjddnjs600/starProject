package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CbagVO;
import com.myweb.persistence.CbagDAO;

@Service
public class CbagServiceImpl implements CbagService{
	private static Logger log = LoggerFactory.getLogger(CbagServiceImpl.class);

	@Inject
	CbagDAO cbdao;
	
	@Override
	public int addcbag(CbagVO cbvo) {
		return cbdao.StarCbagadd(cbvo);
	}

	@Override
	public List<CbagVO> showlist(String email) {
		return cbdao.StarCbaglist(email);
	}

	@Override
	public int oneremove(int cbagno) {
		return cbdao.StarCbagdel(cbagno);
	}

	@Override
	public int allremove(String email) {
		return cbdao.StarCbagAlldel(email);
	}

	@Override
	public int upmodify(CbagVO cbvo) {
		return cbdao.StarCbagmod(cbvo);
	}

	@Override
	public CbagVO showone(int cbagno) {
		return cbdao.starCbagdetail(cbagno);
	}

	@Override
	public CbagVO cplist(int cbagno) {
		return cbdao.StarCplist(cbagno);
	}
}

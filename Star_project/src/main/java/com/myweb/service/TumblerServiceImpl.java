package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.Criterion;
import com.myweb.domain.TumblerVO;
import com.myweb.persistence.TumblerDAO;

@Service
public class TumblerServiceImpl implements TumblerService{
	private static Logger log = LoggerFactory.getLogger(TumblerServiceImpl.class);

	@Inject
	TumblerDAO tdao;
	
	@Override
	public int add(TumblerVO tvo) {
		return tdao.starTumInsert(tvo);
	}

	@Override
	public List<TumblerVO> list(Criterion cri) {
		return tdao.starTumList(cri);
	}

	@Override
	public TumblerVO getTumbler(String tname) {
		return tdao.starTumDetail(tname);
	}

	@Override
	public int modify(TumblerVO tvo) {
		return tdao.starTumModify(tvo);
	}

	@Override
	public int remove(String tname) {
		return tdao.starTumRemove(tname);
	}

	@Override
	public int totalCount(Criterion cri) {
		return tdao.starTumTotal(cri);
	}


}

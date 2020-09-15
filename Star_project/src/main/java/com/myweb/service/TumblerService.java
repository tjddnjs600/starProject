package com.myweb.service;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.TumblerVO;

public interface TumblerService {
	public int add(TumblerVO tvo);
	public List<TumblerVO> list(Criterion cri);
	public TumblerVO getTumbler(String tname);
	public int modify(TumblerVO tvo);
	public int remove(String tname);
	public int totalCount(Criterion cri);
}

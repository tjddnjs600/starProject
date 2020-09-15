package com.myweb.service;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.TorderVO;

public interface TorderService {
	public int insertTorder(TorderVO tovo);
	public List<TorderVO> getBuyList(Criterion cri, String email);
	public int torderCount(String email);
}

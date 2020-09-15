package com.myweb.service;

import java.util.List;

import com.myweb.domain.CorderVO;
import com.myweb.domain.Criterion;

public interface CorderService {
	public int orderCof(CorderVO covo);
	public List<CorderVO> listCorder(Criterion cri, String email);
	public int deleteCorder(int cono);
	public int corderCount(String email);
}

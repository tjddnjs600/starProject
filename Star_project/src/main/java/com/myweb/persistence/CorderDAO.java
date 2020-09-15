package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.CorderVO;
import com.myweb.domain.Criterion;

public interface CorderDAO {
	public int StarCorinsert(CorderVO covo);
	public List<CorderVO> StarCorlist(Criterion cri, String email);
	public int StarCordelete(int cono);
	public int StarCorTotalCount(String email);
	
}

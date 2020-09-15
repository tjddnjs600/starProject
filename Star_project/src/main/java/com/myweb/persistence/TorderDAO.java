package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.TorderVO;

public interface TorderDAO {
	public int starTumOrderInsert(TorderVO tovo);

	public List<TorderVO> starTumOrderList(Criterion cri, String email);

	public int starTumTotalCount(String email);
}

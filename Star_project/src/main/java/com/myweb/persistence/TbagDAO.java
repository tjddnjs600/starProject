package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.TbagVO;

public interface TbagDAO {

	public int starTbagInsert(TbagVO tbvo);
	public List<TbagVO> starTbagList(String email);
	public int starTbagUpdate(TbagVO tbvo);
	public int starTbagDelete(int tbagno);
	public int starTbagTotal(Criterion cri);
}

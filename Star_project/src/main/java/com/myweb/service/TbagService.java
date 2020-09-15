package com.myweb.service;

import java.util.List;

import com.myweb.domain.TbagVO;

public interface TbagService {
	public int addTb(TbagVO tbvo);
	public List<TbagVO> list(String email);
	public int modify(TbagVO tbvo);
	public int remove(int tbagno);
}

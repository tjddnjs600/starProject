package com.myweb.service;

import java.util.List;

import com.myweb.domain.CbagVO;

public interface CbagService {
	public int addcbag(CbagVO cbvo);
	public List<CbagVO> showlist(String email);
	public int oneremove(int cbagno);
	public int allremove(String email);
	public int upmodify(CbagVO cbvo);
	public CbagVO showone(int cbagno);
	public CbagVO cplist(int cbagno);
}

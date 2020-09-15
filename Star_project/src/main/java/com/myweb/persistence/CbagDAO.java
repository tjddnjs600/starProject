package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.CbagVO;

public interface CbagDAO {
	public int StarCbagadd(CbagVO cbvo);
	public List<CbagVO> StarCbaglist(String email);
	public int StarCbagdel(int cbagno);
	public int StarCbagAlldel(String email); 
	public CbagVO starCbagdetail(int cbagno);
	public int StarCbagmod(CbagVO cbvo);
	public CbagVO StarCplist(int cbagno);
}

package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.CoffeeVO;

public interface CoffeeDAO {
	public int StarCofinsert(CoffeeVO cfvo);
	public List<CoffeeVO> StarCoflist(String category);
	public List<CoffeeVO> StarCofalllist();
	public CoffeeVO StarCofdetail(String cname);
	public int StarCofupdate(CoffeeVO cfvo);
	public int StarCofdelete(String cname);
	public int StarCofTotalcount(String cname);
	
}

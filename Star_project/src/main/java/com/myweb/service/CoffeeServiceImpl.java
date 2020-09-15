package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CoffeeVO;
import com.myweb.persistence.CoffeeDAO;


@Service
public class CoffeeServiceImpl implements CoffeeService{
	private static Logger log = LoggerFactory.getLogger(CoffeeServiceImpl.class);

	@Inject
	CoffeeDAO cfdao;
	
	@Override
	public int addCoffee(CoffeeVO cfvo) {
		return cfdao.StarCofinsert(cfvo);
	}

	@Override
	public List<CoffeeVO> clistCoffee(String category) {
		return cfdao.StarCoflist(category);
	}

	@Override
	public CoffeeVO detailCoffee(String cname) {
		return cfdao.StarCofdetail(cname);
	}

	@Override
	public int modifyCoffee(CoffeeVO cfvo) {
		return cfdao.StarCofupdate(cfvo);
	}

	@Override
	public int removeCoffee(String cname) {
		return cfdao.StarCofdelete(cname);
	}

	@Override
	public int totalCoffee(String cname) {
		return cfdao.StarCofTotalcount(cname);
	}

	@Override
	public List<CoffeeVO> allCoffee() {
		return cfdao.StarCofalllist();
	}
}

package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.CoffeeVO;

public interface CoffeeService {
	public int addCoffee(CoffeeVO cfvo);
	public List<CoffeeVO> clistCoffee(String category);
	public CoffeeVO detailCoffee(String cname);
	public int modifyCoffee(CoffeeVO cfvo);
	public int removeCoffee(String cname);
	public int totalCoffee(String cname);
	public List<CoffeeVO> allCoffee();
}

package com.myweb.service;

import java.util.List;

import com.myweb.domain.GcardVO;

public interface GcardService {
	public int cardInsert(GcardVO gvo);
	public List<GcardVO> getCardList(String email);
	public List<GcardVO> gNameList(String email);
	public GcardVO getPrice(GcardVO gvo);
	public int charge(GcardVO gvo);
	public void removeCard(GcardVO gvo);
	public int transferCard(GcardVO gvo);
	public int payCard(GcardVO gvo);
}

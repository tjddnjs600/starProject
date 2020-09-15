package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.GcardVO;

public interface GcardDAO {
	public int starCardinsert(GcardVO gvo);
	public List<GcardVO> starCardSelectInfoList(String email);
	public List<GcardVO> starCardGnameList(String email);
	public GcardVO starCardGetPrice(GcardVO gvo);
	public int starCardUpPrice(GcardVO gvo);
	public void starCardRemoveCard(GcardVO gvo);
	public int starCardTransfer(GcardVO gvo);
	public int starCardPayPrice(GcardVO gvo);
}

package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.TumblerVO;

public interface TumblerDAO {
	public int starTumInsert(TumblerVO tvo); 
	public List<TumblerVO> starTumList(Criterion cri);
	public TumblerVO starTumDetail(String tname);
	public int starTumModify(TumblerVO tvo);
	public int starTumRemove(String tname);
	public int starTumTotal(Criterion cri);
	public int starTumTcountMod(String tname, int tamount);
}

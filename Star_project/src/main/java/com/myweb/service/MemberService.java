package com.myweb.service;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;

public interface MemberService {
	public int join(MemberVO mvo);
	public int checkEmail(String email);
	public MemberVO login(MemberVO mvo);
	public List<MemberVO> getList(Criterion cri);
	public MemberVO memberInfo(String email);
	public int modify(MemberVO mvo);
	public int resign(String email);
	public void updatePwd(MemberVO mvo);
	public MemberVO torderInfo(String email);
	public int upCou(String email);
	public int mTotalCount();
	public int upPoint(String email);
	public int useCou(String email);
	public int upGrade(String email);
	public int upCouPoint(String email);
	public int selectCou(String email);
}

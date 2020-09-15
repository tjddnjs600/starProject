package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;

public interface MemberDAO {
	public int starMemInsert(MemberVO mvo);
	public int starMemCheckEmail(String email);
	public MemberVO starMemSelectMember(MemberVO mvo);
	public List<MemberVO> starMemList(Criterion cri);
	public MemberVO starMemInfo(String email);
	public int starMemUpdate(MemberVO mvo);
	public int starMemDelete(String email);
	public void starMemUpdatePwd(MemberVO mvo);
	public MemberVO starMemTorder(String email);
	public int starMemUpCou(String email);
	public int starMemTotalCount();
	public int starMemUpPoint(String email);
	public int starMemUpGrade(String email);
	public int starMemUpCouPoint(String email);
	public int starMemUseCou(String email);
	public int starMemSelCou(String email);
}

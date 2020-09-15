package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	private static Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Inject
	MemberDAO mdao;
	
	@Override
	public int join(MemberVO mvo) {
		return mdao.starMemInsert(mvo);
	}

	@Override
	public int checkEmail(String email) {
		return mdao.starMemCheckEmail(email);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.starMemSelectMember(mvo);
	}

	@Override
	public List<MemberVO> getList(Criterion cri) {
		return mdao.starMemList(cri);
	}

	@Override
	public MemberVO memberInfo(String email) {
		return mdao.starMemInfo(email);
	}

	@Override
	public int modify(MemberVO mvo) {
		return mdao.starMemUpdate(mvo);
	}


	@Override
	public int resign(String email) {
		return mdao.starMemDelete(email);
	}

	@Override
	public void updatePwd(MemberVO mvo) {
		mdao.starMemUpdatePwd(mvo);
	}
	
	@Override
	public MemberVO torderInfo(String email) {
		return mdao.starMemTorder(email);
	}

	@Override
	public int upCou(String email) {
		return mdao.starMemUpCou(email);
	}

	@Override
	public int mTotalCount() {
		return mdao.starMemTotalCount();
	}

	@Override
	public int upPoint(String email) {
		return mdao.starMemUpPoint(email);
	}

	@Override
	public int useCou(String email) {
		return mdao.starMemUseCou(email);
	}

	@Override
	public int upGrade(String email) {
		return mdao.starMemUpGrade(email);
	}

	@Override
	public int upCouPoint(String email) {
		return mdao.starMemUpCouPoint(email);
	}

	@Override
	public int selectCou(String email) {
		return mdao.starMemSelCou(email);
	}


}

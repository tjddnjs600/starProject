package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	private static Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	private static String ns = "MemberMapper.";
	
	@Inject
	SqlSession sql;
	

	@Override
	public int starMemInsert(MemberVO mvo) {
		return sql.insert(ns+"join", mvo);
	}

	@Override
	public int starMemCheckEmail(String email) {
		return sql.selectOne(ns+"check", email);
	}

	@Override
	public MemberVO starMemSelectMember(MemberVO mvo) {
		return sql.selectOne(ns+"login", mvo);
	}

	@Override
	public List<MemberVO> starMemList(Criterion cri) {
		return sql.selectList(ns+"mlist",cri);
	}

	@Override
	public MemberVO starMemInfo(String email) {
		return sql.selectOne(ns+"minfo", email);
	}

	@Override
	public int starMemUpdate(MemberVO mvo) {
		return sql.update(ns+"modify", mvo);
	}


	@Override
	public int starMemDelete(String email) {
		return sql.delete(ns+"resign", email);
	}

	@Override
	public void starMemUpdatePwd(MemberVO mvo) {
		sql.update(ns+"modPwd", mvo);
	}
	
	@Override
	public MemberVO starMemTorder(String email) {
		return sql.selectOne(ns+"torder", email);
	}

	@Override
	public int starMemUpCou(String email) {
		return sql.update(ns+"upCou",email);
	}

	@Override
	public int starMemTotalCount() {
		return sql.selectOne(ns+"totalmInfo");
	}

	@Override
	public int starMemUpPoint(String email) {
		return sql.update(ns+"upPoint", email);
	}

	@Override
	public int starMemUpGrade(String email) {
		return sql.update(ns+"upGrade", email);
	}

	@Override
	public int starMemUpCouPoint(String email) {
		return sql.update(ns+"upGradeCouponPoint", email);
	}

	@Override
	public int starMemUseCou(String email) {
		return sql.update(ns+"useCou", email);
	}

	@Override
	public int starMemSelCou(String email) {
		return sql.selectOne(ns+"selCou", email);
	}


}

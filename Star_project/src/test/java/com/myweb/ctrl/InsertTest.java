package com.myweb.ctrl;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.BoardVO;
import com.myweb.domain.MemberVO;
import com.myweb.persistence.BoardDAO;
import com.myweb.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class InsertTest {
	private static Logger log = LoggerFactory.getLogger(InsertTest.class);

	@Inject
	private BoardDAO bdao;

	@Inject
	private MemberDAO mdao;

	@Test
	public void insertDummy() {
		for (int i = 1; i < 156; i++) {
			BoardVO bvo = new BoardVO();
			bvo.setBtitle(i + "게시글");
			bvo.setEmail("admin@admin.com");
			bvo.setBcontent(i + "게시글내용입니닷!");
			bvo.setNoticenum(0);
			bvo.setB_file("NONE");
			bdao.starBorInsert(bvo);
		}
	}

	/*
	 * @Test public void meminsertDummy(){ for (int i = 1; i < 21; i++) { MemberVO
	 * mvo = new MemberVO(); mvo.setEmail("test"+i+"@test.com"); mvo.setPwd(i+"");
	 * mvo.setName("tester"+i); mvo.setNick("tsr"+i); mvo.setBirth(""+i);
	 * mvo.setGender("남"); mvo.setAddr("서울"); mvo.setTel("010"+i+"2"+i+"3");
	 * mdao.starMemInsert(mvo); } }
	 */

}

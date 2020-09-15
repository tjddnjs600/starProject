package com.myweb.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.CommentVO;
import com.myweb.domain.Criterion;

public interface CommentDAO {
	public int starCominsert(CommentVO cvo);
	public List<CommentVO> starComselectList(Criterion cri, int bno);
	public int starComupdate(CommentVO cvo);
	public int starComdelete(int cno);
	public int starComselectTotal(int pno);
	public int deletecomment(int bno);

}

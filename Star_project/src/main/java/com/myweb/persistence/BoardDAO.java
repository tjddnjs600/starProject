package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.BoardVO;
import com.myweb.domain.Criterion;

public interface BoardDAO {
  public int starBorInsert(BoardVO bvo);
  public List<BoardVO> starBorselectList(Criterion cri);
  public BoardVO starBorDetail(int bno);
  public int starBorupdate(BoardVO bvo);
  public int starBordelete(int bno);
  public int starBorselectTotal(Criterion cri);
  public int starBorViewcount(int bno);

}

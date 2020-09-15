package com.myweb.persistence;

import java.util.List;
import java.util.Map;

import com.myweb.domain.LocVO;

public interface LocDAO {
   public List<LocVO> selectList();
   public List<Map<String, Object>> selectgpsList(Map<String, Object> map);
}
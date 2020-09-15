package com.myweb.service;

import java.util.List;
import java.util.Map;

import com.myweb.domain.LocVO;

public interface LocService {
   public List<LocVO> getList();
   List<Map<String,Object>> gpsList(Map<String, Object> map);
}
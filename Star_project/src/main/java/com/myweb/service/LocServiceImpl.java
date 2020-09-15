package com.myweb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.LocVO;
import com.myweb.persistence.LocDAO;

@Service
public class LocServiceImpl implements LocService{
   private static Logger log = LoggerFactory.getLogger(LocServiceImpl.class);

   @Inject
   LocDAO ldao;
   
   @Override
   public List<LocVO> getList() {
      
//      List<LocVO> locinfo = ldao.selectList();
//      log.info(">>>>>>>>>>>>로케이션리스트"+locinfo.size());
//      log.info(">>>>>>>>>>>로케이션"+locinfo);
//      Map<String, Object> loclist = new HashMap<>();
//      for(int i = 0; i < locinfo.size(); i++) {
//      loclist.put("loc"+i, new LocVO(locinfo.get(i).getPlace(),locinfo.get(i).getRegion(),locinfo.get(i).getWidth(),locinfo.get(i).getHeight()));
//      loclist.put("region", locinfo.get(i).getRegion());
//      loclist.put("width", locinfo.get(i).getWidth());
//      loclist.put("height", locinfo.get(i).getHeight());
//   
//      }
//      log.info(">>>>>>>>로케이션서비스"+loclist.get("loc1"));
      return ldao.selectList();
      
   }

   @Override
   public List<Map<String, Object>> gpsList(Map<String, Object> map) {
      return ldao.selectgpsList(map);
   }
}
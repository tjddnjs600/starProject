package com.myweb.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.LocVO;

@Repository
public class LocDAOImpl implements LocDAO{
   private static Logger log = LoggerFactory.getLogger(LocDAOImpl.class);
   private static String ns = "LocMapper.";
   
   @Inject
   SqlSession sql;
   
   @Override
   public List<LocVO> selectList() {
      log.info(">>>체킹");
      return sql.selectList(ns+"location");
   }

   @Override
   public List<Map<String, Object>> selectgpsList(Map<String, Object> map) {
      return sql.selectList(ns+"gpslist", map);
   }
}